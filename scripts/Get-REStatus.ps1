<#
.SYNOPSIS
    Mostra o status de todos os projetos *_decompiled/ no workspace.

.DESCRIPTION
    Lê o state.json de cada projeto (se existir) e exibe um dashboard
    consolidado com fase, progresso e métricas de confiança.

.PARAMETER Workspace
    Caminho do workspace. Padrão: diretório pai do framework.

.EXAMPLE
    .\Get-REStatus.ps1
#>
[CmdletBinding()]
param(
    [string]$Workspace = (Split-Path -Parent (Split-Path -Parent $PSScriptRoot))
)

$projects = Get-ChildItem -Path $Workspace -Directory -Filter "*_decompiled"

if ($projects.Count -eq 0) {
    Write-Host "Nenhum projeto *_decompiled/ encontrado." -ForegroundColor Yellow
    return
}

$phaseEmoji = @{
    "triage"         = "🔍"
    "extraction"     = "⛏️"
    "interpretation" = "🧩"
    "structuring"    = "📐"
    "validation"     = "✅"
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  REVERSAL PROJECTS — Dashboard de Projetos" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

$table = @()

foreach ($proj in $projects) {
    $statePath = Join-Path $proj.FullName "state.json"
    $handoffPath = Join-Path $proj.FullName "HANDOFF.md"

    $hasState = Test-Path $statePath
    $hasHandoff = Test-Path $handoffPath

    if ($hasState) {
        try {
            $state = Get-Content $statePath -Raw | ConvertFrom-Json
            $phase = $state.phase
            $emoji = if ($phaseEmoji.ContainsKey($phase)) { $phaseEmoji[$phase] } else { "❓" }
            $progress = [math]::Round($state.phase_progress * 100)
            $conf = $state.confidence
            $total = $conf.confirmed + $conf.inferred + $conf.gap
            $coverage = if ($total -gt 0) { [math]::Round(($conf.confirmed + $conf.inferred) / $total * 100) } else { 0 }

            $table += [PSCustomObject]@{
                Projeto    = $proj.Name -replace '_decompiled$', ''
                Perfil     = $state.profile
                Fase       = "$emoji $phase"
                Progresso  = "${progress}%"
                Confianca  = "🟢$($conf.confirmed) 🟡$($conf.inferred) 🔴$($conf.gap)"
                Cobertura  = "${coverage}%"
                Checkpoint = if ($state.last_checkpoint) { $state.last_checkpoint.Substring(0, 10) } else { "-" }
            }
        } catch {
            $table += [PSCustomObject]@{
                Projeto    = $proj.Name -replace '_decompiled$', ''
                Perfil     = "⚠️ erro"
                Fase       = "state.json inválido"
                Progresso  = "-"
                Confianca  = "-"
                Cobertura  = "-"
                Checkpoint = "-"
            }
        }
    } else {
        $status = if ($hasHandoff) { "📄 só HANDOFF" } else { "⚠️ sem tracking" }
        $table += [PSCustomObject]@{
            Projeto    = $proj.Name -replace '_decompiled$', ''
            Perfil     = "-"
            Fase       = $status
            Progresso  = "-"
            Confianca  = "-"
            Cobertura  = "-"
            Checkpoint = "-"
        }
    }
}

$table | Format-Table -AutoSize

Write-Host "Total: $($projects.Count) projetos" -ForegroundColor DarkGray
Write-Host ""

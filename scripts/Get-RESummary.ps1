<#
.SYNOPSIS
    Gera um resumo condensado de um projeto para economia de tokens.

.DESCRIPTION
    Le o HANDOFF.md, state.json, evidence_ledger.md e soul.md de um projeto
    e gera um resumo compacto de ~20-25 linhas, ideal para alimentar um
    agente AI sem gastar contexto lendo todos os arquivos do projeto.

.PARAMETER Project
    Nome do projeto (sem _decompiled).

.PARAMETER Full
    Se especificado, inclui lista detalhada de docs tematicos encontrados.

.EXAMPLE
    .\Get-RESummary.ps1 -Project "meu_jogo"
.EXAMPLE
    .\Get-RESummary.ps1 -Project "meu_jogo" -Full
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Project,

    [switch]$Full
)

$workspace = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$projectDir = Join-Path $workspace "${Project}_decompiled"

if (-not (Test-Path $projectDir)) {
    Write-Error "Projeto nao encontrado: $projectDir"
    return
}

$statePath = Join-Path $projectDir "state.json"
$handoffPath = Join-Path $projectDir "HANDOFF.md"
$ledgerPath = Join-Path $projectDir "evidence_ledger.md"
$soulPath = Join-Path $projectDir "soul.md"

Write-Host ""
Write-Host "--- RESUMO DO PROJETO: $Project ---" -ForegroundColor Cyan

# 1. State Tracking
if (Test-Path $statePath) {
    $state = Get-Content $statePath -Raw -Encoding UTF8 | ConvertFrom-Json
    $conf = $state.confidence
    $total = $conf.confirmed + $conf.inferred + $conf.gap
    $coverage = if ($total -gt 0) { [math]::Round(($conf.confirmed + $conf.inferred) / $total * 100) } else { 0 }
    $certainty = if ($total -gt 0) { [math]::Round($conf.confirmed / $total * 100) } else { 0 }

    Write-Host "Perfil:      $($state.profile)" -ForegroundColor White
    Write-Host "Fase Atual:  $($state.phase) ($([math]::Round($state.phase_progress * 100))%)" -ForegroundColor White
    Write-Host "Concluidas:  $($state.phases_completed -join ' -> ')" -ForegroundColor DarkGray
    Write-Host "Confianca:   CONF:$($conf.confirmed) INF:$($conf.inferred) GAP:$($conf.gap) | Cobertura: ${coverage}% Certeza: ${certainty}%" -ForegroundColor White
    Write-Host "Ferramentas: $($state.tools -join ', ')" -ForegroundColor DarkGray
    Write-Host "Checkpoint:  $($state.last_checkpoint)" -ForegroundColor DarkGray
} else {
    Write-Host "(state.json ausente)" -ForegroundColor Yellow
}

# 2. Status dos Motores Destilados (Evidence & Soul)
$hasSoul = Test-Path $soulPath
$hasLedger = Test-Path $ledgerPath
$soulStatus = if ($hasSoul) { "[OK] presente" } else { "[!] ausente" }

$ledgerInfo = "[!] ausente"
if ($hasLedger) {
    $ledgerContent = Get-Content $ledgerPath -Raw -Encoding UTF8
    $evMatches = [regex]::Matches($ledgerContent, "EV-\d+").Count
    $unkMatches = [regex]::Matches($ledgerContent, "UNK-\d+").Count
    $ledgerInfo = "[OK] presente ($evMatches evidencias, $unkMatches incognitas/UNKs)"
}

Write-Host "Motores:     Soul: $soulStatus | Evidence Ledger: $ledgerInfo" -ForegroundColor White

# 3. HANDOFF excerpt
if (Test-Path $handoffPath) {
    Write-Host ""
    Write-Host "--- HANDOFF EXCERPT (Inicio) ---" -ForegroundColor DarkCyan
    Get-Content $handoffPath -TotalCount 12 -Encoding UTF8 | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
    Write-Host "  ..." -ForegroundColor DarkGray
}

# 4. Docs tematicos
if ($Full) {
    Write-Host ""
    Write-Host "--- Documentos Mapeados ---" -ForegroundColor DarkCyan
    $docs = Get-ChildItem -Path $projectDir -Recurse -Filter "*.md" -File |
        Where-Object { $_.Name -notin @("HANDOFF.md", "soul.md", "evidence_ledger.md") } |
        Sort-Object FullName
    if ($docs.Count -gt 0) {
        foreach ($doc in $docs) {
            $rel = $doc.FullName.Substring($projectDir.Length + 1)
            $lines = (Get-Content $doc.FullName | Measure-Object).Count
            Write-Host "  $rel ($lines linhas)" -ForegroundColor Gray
        }
        Write-Host "  Total: $($docs.Count) docs tematicos" -ForegroundColor DarkGray
    } else {
        Write-Host "  (nenhum doc tematico adicional)" -ForegroundColor Yellow
    }
}

Write-Host ""

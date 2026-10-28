<#
.SYNOPSIS
    Atualiza o state.json de um projeto, avançando fase ou ajustando métricas.

.DESCRIPTION
    Transiciona entre fases do pipeline, atualiza progresso e contadores
    de confiança. Salva checkpoint automático.

.PARAMETER Project
    Nome do projeto (sem _decompiled).

.PARAMETER Phase
    Nova fase: triage, extraction, interpretation, structuring, validation.

.PARAMETER Progress
    Progresso da fase atual (0.0 a 1.0).

.PARAMETER Confirmed
    Quantidade de itens confirmados (🟢).

.PARAMETER Inferred
    Quantidade de itens inferidos (🟡).

.PARAMETER Gap
    Quantidade de lacunas (🔴).

.PARAMETER Tools
    Lista de ferramentas utilizadas (separadas por vírgula).

.PARAMETER Note
    Nota livre para registrar no state.

.EXAMPLE
    .\Update-REState.ps1 -Project "meu_jogo" -Phase extraction -Progress 0.3
.EXAMPLE
    .\Update-REState.ps1 -Project "meu_jogo" -Confirmed 12 -Inferred 8 -Gap 5
.EXAMPLE
    .\Update-REState.ps1 -Project "meu_jogo" -Tools "Ghidra,JADX" -Note "Decompilação inicial concluída"
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Project,

    [ValidateSet("triage", "extraction", "interpretation", "structuring", "validation")]
    [string]$Phase,

    [ValidateRange(0.0, 1.0)]
    [double]$Progress = -1,

    [int]$Confirmed = -1,
    [int]$Inferred = -1,
    [int]$Gap = -1,

    [string]$Tools = "",
    [string]$Note = ""
)

$ErrorActionPreference = "Stop"

$workspace = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$projectDir = Join-Path $workspace "${Project}_decompiled"
$statePath = Join-Path $projectDir "state.json"

if (-not (Test-Path $statePath)) {
    Write-Error "state.json não encontrado: $statePath"
    return
}

$state = Get-Content $statePath -Raw | ConvertFrom-Json

$changed = @()

# Transição de fase
if ($Phase -and $Phase -ne $state.phase) {
    $oldPhase = $state.phase
    # Registrar fase anterior como completa
    $completed = @($state.phases_completed)
    if ($oldPhase -and $completed -notcontains $oldPhase) {
        $completed += $oldPhase
    }
    $state.phases_completed = $completed
    $state.phase = $Phase
    $state.phase_progress = 0.0
    $changed += "fase: $oldPhase → $Phase"
}

# Progresso
if ($Progress -ge 0) {
    $state.phase_progress = $Progress
    $changed += "progresso: $([math]::Round($Progress * 100))%"
}

# Confiança
if ($Confirmed -ge 0) { $state.confidence.confirmed = $Confirmed; $changed += "🟢 $Confirmed" }
if ($Inferred -ge 0) { $state.confidence.inferred = $Inferred; $changed += "🟡 $Inferred" }
if ($Gap -ge 0) { $state.confidence.gap = $Gap; $changed += "🔴 $Gap" }

# Ferramentas
if ($Tools) {
    $toolList = $Tools -split ',' | ForEach-Object { $_.Trim() }
    $existing = @($state.tools)
    foreach ($t in $toolList) {
        if ($existing -notcontains $t) { $existing += $t }
    }
    $state.tools = $existing
    $changed += "tools: +$Tools"
}

# Nota
if ($Note) {
    $state.notes = $Note
    $changed += "nota atualizada"
}

# Checkpoint
$state.last_checkpoint = Get-Date -Format "yyyy-MM-ddTHH:mm:ssK"

# Salvar
$state | ConvertTo-Json -Depth 3 | Set-Content -Path $statePath -Encoding UTF8

Write-Host ""
Write-Host "State atualizado: $Project" -ForegroundColor Green
foreach ($c in $changed) {
    Write-Host "  • $c" -ForegroundColor DarkGray
}
Write-Host "  📌 checkpoint: $($state.last_checkpoint)" -ForegroundColor DarkGray
Write-Host ""

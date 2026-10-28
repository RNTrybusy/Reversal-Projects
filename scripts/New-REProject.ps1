<#
.SYNOPSIS
    Inicializa um novo projeto de engenharia reversa usando o Reversal Projects framework.

.DESCRIPTION
    Cria a pasta *_decompiled/, copia templates essenciais (HANDOFF.md, state.json,
    evidence_ledger.md, soul.md), configura o perfil selecionado e inicializa o rastreamento.

.PARAMETER Name
    Nome do projeto (sem sufixo _decompiled).

.PARAMETER Profile
    Perfil do projeto: legacy-system, game, app, documentation.

.PARAMETER Platform
    Plataforma do alvo (Win32, .NET, Android, SNES, J2ME, etc.).

.PARAMETER Language
    Linguagem/compilador (VB.NET, Delphi, Java, C, ARM, 65816, etc.).

.PARAMETER Description
    Descrição breve do projeto (1-2 frases).

.EXAMPLE
    .\New-REProject.ps1 -Name "meu_jogo" -Profile game -Platform "Android" -Language "Java/ARM" -Description "Jogo de puzzle Android com engine nativa"
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Name,

    [Parameter(Mandatory)]
    [ValidateSet("legacy-system", "game", "app", "documentation")]
    [string]$Profile,

    [Parameter(Mandatory)]
    [string]$Platform,

    [string]$Language = "",
    [string]$Description = ""
)

$ErrorActionPreference = "Stop"

# Paths
$workspace = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$framework = Join-Path $workspace "Reversal Projects"
$projectDir = Join-Path $workspace "${Name}_decompiled"
$templates = Join-Path $framework "templates"

# Verificar se já existe
if (Test-Path $projectDir) {
    Write-Error "Projeto já existe: $projectDir"
    return
}

# Criar estrutura de pastas
Write-Host "Criando projeto: $Name ($Profile)" -ForegroundColor Cyan
$dirs = @("src", "docs", "docs\specs", "docs\adrs", "tools", "resources")
foreach ($d in $dirs) {
    New-Item -ItemType Directory -Path (Join-Path $projectDir $d) -Force | Out-Null
}

$today = (Get-Date -Format "yyyy-MM-dd")

# 1. Copiar e preencher HANDOFF.md
$handoff = Get-Content (Join-Path $templates "HANDOFF_TEMPLATE.md") -Raw
$handoff = $handoff -replace '\{NOME_PROJETO\}', $Name
$handoff = $handoff -replace '\{DESCRICAO_BREVE.*?\}', $Description
$handoff = $handoff -replace '\{Win32.*?\}', $Platform
$handoff = $handoff -replace '\{VB\.NET.*?\}', $Language
$handoff = $handoff -replace '\{Nenhuma.*?\}', "A identificar"
$handoff = $handoff -replace '\{Ghidra.*?\}', "A selecionar"
$handoff = $handoff -replace '\{legacy-system.*?\}', $Profile
$handoff = $handoff -replace '\{Código decompilado\}', "Código decompilado"
$handoff = $handoff -replace '\{Documentação temática\}', "Documentação temática"
$handoff = $handoff -replace '\{Scripts de análise\}', "Scripts de análise"
$handoff = $handoff -replace '\{Assets extraídos\}', "Assets extraídos"
$handoff = $handoff -replace '\{triage.*?\}', "triage"
$handoff = $handoff -replace '\{N\}%', "0%"
$handoff = $handoff -replace '🟢\{N\}', "🟢 0"
$handoff = $handoff -replace '🟡\{N\}', "🟡 0"
$handoff = $handoff -replace '🔴\{N\}', "🔴 0"
$handoff = $handoff -replace '\{DATA\}', $today
$handoff = $handoff -replace '\{Listar 3-5 regras.*?\}', "Ver Reversal Projects/core/RULES.md"
$handoff = $handoff -replace '\{Próxima tarefa.*?\}', "Completar triagem (Fase 0 - SCOUT)"
$handoff = $handoff -replace '\{Segunda tarefa\}', "Identificar proteções e ferramentas"
$handoff = $handoff -replace '\{Terceira tarefa\}', "Iniciar extração (Fase 1 - ARCHAEOLOGIST)"
$handoff = $handoff -replace '\{nome\.md\}', "evidence_ledger.md"
$handoff = $handoff -replace '\{Descrição breve\}', "Rastreabilidade de offsets, evidências e UNKs"
Set-Content -Path (Join-Path $projectDir "HANDOFF.md") -Value $handoff -Encoding UTF8

# 2. Copiar e preencher evidence_ledger.md
$ledger = Get-Content (Join-Path $templates "EVIDENCE_LEDGER_TEMPLATE.md") -Raw
$ledger = $ledger -replace '\{NOME_PROJETO\}', $Name
$ledger = $ledger -replace '\{DATA\}', $today
$ledger = $ledger -replace '\{N_CONFIRMED\}', "0"
$ledger = $ledger -replace '\{N_INFERRED\}', "0"
$ledger = $ledger -replace '\{N_GAPS\}', "0"
Set-Content -Path (Join-Path $projectDir "evidence_ledger.md") -Value $ledger -Encoding UTF8

# 3. Copiar e preencher soul.md
$soul = Get-Content (Join-Path $templates "SOUL_TEMPLATE.md") -Raw
$soul = $soul -replace '\{NOME_PROJETO\}', $Name
Set-Content -Path (Join-Path $projectDir "soul.md") -Value $soul -Encoding UTF8

# 4. Copiar e preencher state.json
$now = Get-Date -Format "yyyy-MM-ddTHH:mm:ssK"
$state = @{
    project          = $Name
    profile          = $Profile
    phase            = "triage"
    phase_progress   = 0.0
    phases_completed = @()
    last_checkpoint  = $now
    confidence       = @{ confirmed = 0; inferred = 0; gap = 0 }
    tools            = @()
    notes            = "Projeto inicializado com motor destilado Reversal Projects"
} | ConvertTo-Json -Depth 3
Set-Content -Path (Join-Path $projectDir "state.json") -Value $state -Encoding UTF8

Write-Host ""
Write-Host "  Projeto criado em: $projectDir" -ForegroundColor Green
Write-Host "  Perfil: $Profile" -ForegroundColor Green
Write-Host "  HANDOFF:         $projectDir\HANDOFF.md" -ForegroundColor Green
Write-Host "  Evidence Ledger: $projectDir\evidence_ledger.md" -ForegroundColor Green
Write-Host "  Soul Document:   $projectDir\soul.md" -ForegroundColor Green
Write-Host "  State:           $projectDir\state.json" -ForegroundColor Green
Write-Host ""
Write-Host "Próximo passo: abrir o PROFILE.md do perfil '$Profile'" -ForegroundColor Yellow
Write-Host "  $framework\profiles\$Profile\PROFILE.md" -ForegroundColor Yellow

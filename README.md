# 🔄 Reversal Projects

> **Framework autônomo de engenharia reversa, especificação e reconstrução de software.**  
> O melhor do **REA Framework** e do **Reversa** destilado em um único núcleo enxuto, eficiente e auto-suficiente.

---

## 💡 Filosofia

Em vez de depender de frameworks pesados, dezenas de prompts redundantes que esgotam o contexto de tokens, ou ferramentas fragmentadas:
O **Reversal Projects** une:
1. **O Rigor Científico do REA Framework:** Livro de evidências técnicas verificadas (`evidence_ledger.md`), rastreador de incógnitas (`UNK`), contratos de fronteira e harnesses de paridade (*bit-exact* e *behavior-exact*).
2. **A Maturidade Cognitiva do Reversa:** Posturas cognitivas especializadas (`SCOUT`, `ARCHAEOLOGIST`, `DETECTIVE`, `ARCHITECT`, `SPECIFIER`, `RECONSTRUCTOR`), caderno de encargos executável (`sdd_*.md`), extração da alma do produto (`soul.md`) e catálogo de migração de paradigmas legados para modernos.
3. **Especialização por Perfil:** Exigências proporcionais e customizadas para **sistemas legados**, **jogos**, **aplicativos** e **documentação**.
4. **Economia Inteligente de Tokens:** Estrutura projetada para permitir que agentes de IA trabalhem com altíssima assertividade sem carregar centenas de arquivos na memória desnecessariamente.

---

## 📁 Estrutura do Framework

```
Reversal Projects/
├── HANDOFF.md                  # Handoff executivo e estado atual do framework
├── AGENTS.md                   # Diretrizes para agentes de IA que operam no workspace
├── README.md                   # Este documento
├── .gitignore
│
├── core/                       # Núcleo Universal Compartilhado
│   ├── PIPELINE.md             # Pipeline de 5 fases (Triagem -> Extração -> Interpretação -> Estruturação -> Validação)
│   ├── CONFIDENCE.md           # Escala de confiança 🟢 CONFIRMADO / 🟡 INFERIDO / 🔴 LACUNA com métricas
│   ├── RULES.md                # As 9 regras inegociáveis de engenharia e contexto
│   └── engine/                 # Motores Destilados (O "Coração" REA + Reversa)
│       ├── evidence.md         # Evidence Ledger, Unknowns Tracker & Parity Harness (REA)
│       ├── roles.md            # 6 Posturas cognitivas para agentes de IA (Reversa)
│       ├── synthesis.md        # Estratégias de reconstrução (Clean-Room, Strangler Fig, Bridge, Port)
│       └── soul.md             # Soul Document: essência irredutível e descarte de débito
│
├── profiles/                   # Perfis Especializados por Tipo de Produto
│   ├── legacy-system/          # VB.NET, Delphi, C/C++ Win32 (+Desobfuscação, +Data Mapping)
│   ├── game/                   # ROMs, APKs, Engines (+Assets, +Loop & Física, +RNG, +Saves)
│   ├── app/                    # Mobile, Desktop, Web (+APIs, +Fluxos de UI, +Cirurgia de Ads/Licenças)
│   └── documentation/          # Consolidação pós-reversão (+Inventário, +SDD, +Publicação)
│
├── templates/                  # Templates Padronizados
│   ├── HANDOFF_TEMPLATE.md     # Ponto de entrada de projetos (~40 linhas)
│   ├── state.json              # State machine e métricas de cobertura
│   ├── EVIDENCE_LEDGER_TEMPLATE.md # Registro técnico de offsets, bytes e obrigações
│   ├── PARITY_SPEC_TEMPLATE.md # Casos de teste de conformidade de saída
│   ├── RETRO_ADR_TEMPLATE.md   # Registro de decisões arquiteturais históricas
│   ├── SDD_SPEC_TEMPLATE.md    # Especificações executáveis para criação de novo código
│   └── SOUL_TEMPLATE.md        # Documento da alma do produto
│
├── scripts/                    # Utilitários PowerShell para Automação Enxuta
│   ├── New-REProject.ps1       # Inicializa projeto *_decompiled com estrutura e templates
│   ├── Get-REStatus.ps1        # Dashboard unificado de todos os projetos do workspace
│   ├── Update-REState.ps1      # Atualiza fases, progresso, métricas e checkpoints
│   └── Get-RESummary.ps1       # Extrai resumo hiper-compacto para injetar em prompts de IA
│
└── docs/                       # Documentação e Guias do Framework
    ├── COMPARISON.md           # Como o Reversal Projects destilou REA e Reversa
    └── guides/
        ├── QUICKSTART.md       # Passo a passo para iniciar um projeto
        └── SCRIPTS.md          # Manual de uso dos scripts de automação
```

---

## 🚀 Como Iniciar um Novo Projeto

```powershell
# Exemplo: Criar projeto de um jogo clássico
.\scripts\New-REProject.ps1 -Name "meu_jogo" -Profile game -Platform "SNES" -Language "65816 ASM" -Description "Jogo de futebol 16-bit com física customizada"
```

O comando cria automaticamente a pasta `meu_jogo_decompiled/` já abastecida com:
- `HANDOFF.md` preenchido
- `evidence_ledger.md` pronto para anotações técnicas
- `soul.md` para capturar a essência do produto
- `state.json` com checkpoint inicial

---

## 🛠️ Automação e Economia de Contexto

| Comando | O que faz | Benefício para IA / Tokens |
|---|---|---|
| `.\scripts\Get-REStatus.ps1` | Dashboard tabular de todos os projetos | Visão instantânea sem ler pastas |
| `.\scripts\Get-RESummary.ps1 -Project nome` | Resumo de ~20 linhas com estado e métricas | Injeta contexto completo gastando < 300 tokens |
| `.\scripts\Update-REState.ps1 -Project nome ...` | Salva checkpoint e atualiza cobertura | Mantém o histórico sem gastar contexto |

---

## 📄 Licença
Uso pessoal e profissional para engenharia reversa, preservação de software e reconstrução moderna.

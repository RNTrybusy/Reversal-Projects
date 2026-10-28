# Scripts de Automação

Utilitários PowerShell para gerenciar projetos de engenharia reversa.

## Uso

Todos os scripts ficam em `Reversal Projects/scripts/` e operam
no workspace `E:\Reverse Engineering Anything\`.

---

## `New-REProject.ps1` — Criar projeto

Inicializa uma pasta `*_decompiled/` com HANDOFF e state.json preenchidos.

```powershell
# Interativo — todos os parâmetros obrigatórios serão perguntados
.\scripts\New-REProject.ps1

# Completo
.\scripts\New-REProject.ps1 `
    -Name "meu_jogo" `
    -Profile game `
    -Platform "Android" `
    -Language "Java/ARM" `
    -Description "Jogo de puzzle com engine nativa"
```

**Resultado:** Cria `meu_jogo_decompiled/` com:
- `HANDOFF.md` preenchido
- `state.json` configurado
- Subpastas `src/`, `docs/`, `tools/`, `resources/`

---

## `Get-REStatus.ps1` — Dashboard

Mostra status de todos os projetos `*_decompiled/` do workspace.

```powershell
.\scripts\Get-REStatus.ps1
```

**Saída exemplo:**
```
═══════════════════════════════════════════════
  REVERSAL PROJECTS — Dashboard de Projetos
═══════════════════════════════════════════════

Projeto           Perfil         Fase              Progresso  Confiança        Cobertura
-------           ------         ----              ---------  ---------        ---------
cm14              legacy-system  ✅ validation     100%       🟢42 🟡28 🔴15   82%
rfm2013           game           🧩 interpretation 65%        🟢18 🟡22 🔴10   80%
purl_player       app            📄 só HANDOFF     -          -                -
```

---

## `Update-REState.ps1` — Atualizar estado

Avança fase, atualiza progresso ou métricas de confiança.

```powershell
# Avançar de fase
.\scripts\Update-REState.ps1 -Project "meu_jogo" -Phase extraction

# Atualizar progresso
.\scripts\Update-REState.ps1 -Project "meu_jogo" -Progress 0.5

# Atualizar confiança
.\scripts\Update-REState.ps1 -Project "meu_jogo" -Confirmed 12 -Inferred 8 -Gap 5

# Registrar ferramentas
.\scripts\Update-REState.ps1 -Project "meu_jogo" -Tools "Ghidra,JADX"

# Combinar tudo
.\scripts\Update-REState.ps1 -Project "meu_jogo" `
    -Phase interpretation -Progress 0.3 `
    -Confirmed 15 -Inferred 10 -Gap 8 `
    -Note "Módulos principais mapeados"
```

---

## `Get-RESummary.ps1` — Resumo para AI

Gera resumo condensado (~20 linhas) de um projeto, ideal para alimentar
agentes AI sem gastar tokens lendo todos os docs.

```powershell
# Resumo compacto
.\scripts\Get-RESummary.ps1 -Project "meu_jogo"

# Com lista de docs temáticos
.\scripts\Get-RESummary.ps1 -Project "meu_jogo" -Full
```

---

## Economia de tokens

Os scripts foram desenhados para minimizar contexto:

| Sem scripts | Com scripts |
|-------------|-------------|
| "Leia o HANDOFF, depois o state.json, depois liste os .md" | `Get-RESummary -Project x -Full` |
| "Qual o status de todos os projetos?" | `Get-REStatus` |
| "Atualize o state.json com fase=extraction, progresso=0.5" | `Update-REState -Project x -Phase extraction -Progress 0.5` |

Um agente AI pode executar o script e obter tudo em uma única chamada
em vez de múltiplas leituras de arquivo.

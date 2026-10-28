# Pipeline Universal — 5 Fases

O pipeline core é compartilhado por todos os perfis. Cada perfil pode
**estender** fases (adicionar sub-etapas) mas nunca **remover** fases do core.

O pipeline funde o **Rigor de Evidências (REA)** com os **Papéis Cognitivos e Especificações Operacionais (Reversa)** em um ciclo leve e reproduzível.

---

## Visão Geral

```
Fase 0          Fase 1            Fase 2            Fase 3           Fase 4
TRIAGEM   →   EXTRAÇÃO    →   INTERPRETAÇÃO   →  ESTRUTURAÇÃO  →   VALIDAÇÃO
[SCOUT]     [ARCHAEOLOGIST]    [DETECTIVE/ARCH]    [SPECIFIER]    [RECONSTRUCTOR]
```

---

## Fase 0 — Triagem (`triage`)

- **Papel Cognitivo Principal:** `SCOUT`
- **Objetivo:** Classificar o alvo, identificar proteções e selecionar o perfil correto sem afundar em detalhes de código.
- **Entradas:** Binário/fonte/APK/ROM original em `Software Origin/`
- **Saídas:** `HANDOFF.md` inicial + `state.json` com perfil selecionado

### Checklist universal
- [ ] Identificar plataforma (Win32, .NET, JVM, Android, SNES, etc.)
- [ ] Identificar linguagem/compilador/obfuscador
- [ ] Identificar proteções (packing, obfuscação, DRM)
- [ ] Selecionar perfil: `legacy-system` | `game` | `app` | `documentation`
- [ ] Selecionar ferramentas de extração (Ghidra, JADX, ILSpy, etc.)
- [ ] Criar pasta `<nome>_decompiled/` e preencher `HANDOFF.md` inicial

---

## Fase 1 — Extração (`extraction`)

- **Papel Cognitivo Principal:** `ARCHAEOLOGIST`
- **Objetivo:** Obter representação legível do binário/fonte, isolar símbolos e inicializar o livro de evidências.
- **Entradas:** Original + ferramentas selecionadas
- **Saídas:** Código decompilado, strings, assets, `evidence_ledger.md` inicial

### Checklist universal
- [ ] Decompilação/desassemblagem do binário principal
- [ ] Extração de strings, constantes e endpoints
- [ ] Extração de recursos brutos (imagens, áudio, dados, schemas)
- [ ] Mapeamento de entry points e tabelas de export/import
- [ ] Inicialização do `evidence_ledger.md` (rastreabilidade de offsets/funções)
- [ ] Snapshot do estado em `state.json`

---

## Fase 2 — Interpretação (`interpretation`)

- **Papel Cognitivo Principal:** `DETECTIVE` (regras e intenções) + `ARCHITECT` (topologia)
- **Objetivo:** Entender a semântica real: regras de negócio, algoritmos proprietários, fluxo de dados e decisões históricas.
- **Entradas:** Código decompilado + recursos da Fase 1
- **Saídas:** Docs temáticos (`.md`), diagramas Mermaid, `ADR-Retroactive`, primeiro rascunho do `soul.md`

### Checklist universal
- [ ] Identificar módulos centrais e fluxo de dados (entrada → processamento → saída)
- [ ] Isolar a "Fórmula Secreta" (regras de simulação, cálculos matemáticos, RNG, parsers)
- [ ] Mapear modelo de dados (schemas de DB, estruturas de save, arquivos binários)
- [ ] Registrar decisões arquiteturais históricas em `docs/adrs/ADR-NNN.md`
- [ ] Atualizar `evidence_ledger.md` com marcações de confiança (🟢/🟡/🔴) e listar `UNK`s
- [ ] Redigir o documento de essência `soul.md`

---

## Fase 3 — Estruturação (`structuring`)

- **Papel Cognitivo Principal:** `SPECIFIER / WRITER`
- **Objetivo:** Sintetizar todo o conhecimento em especificações operacionais (SDD) prontas para permitir a modernização ou criação do novo produto.
- **Entradas:** Docs da Fase 2 + `evidence_ledger.md` + `soul.md`
- **Saídas:** Especificações executáveis (`sdd_*.md`), contratos de paridade (`parity_*.md`), `HANDOFF.md` atualizado

### Checklist universal
- [ ] Consolidar todos os `.md` temáticos no índice mestre
- [ ] Gerar contratos de tipos e DTOs nos arquivos SDD
- [ ] Criar especificações de teste de paridade (`parity_spec.md`) com casos de borda
- [ ] Fechar ou reclassificar incógnitas (`UNK`s) do `evidence_ledger.md`
- [ ] Definir a estratégia de modernização no `soul.md` (Clean-Room, Strangler Fig, Bridge ou Port)
- [ ] Atualizar métricas de cobertura no `state.json`

---

## Fase 4 — Validação & Síntese (`validation`)

- **Papel Cognitivo Principal:** `RECONSTRUCTOR`
- **Objetivo:** Provar a exatidão do conhecimento por meio de scripts de teste, réplicas isoladas ou implementação do novo produto em `Software Recreated/`.
- **Entradas:** Specs SDD + Parity Harness + binário oráculo
- **Saídas:** Suíte de paridade executada (100% pass), código reconstruído, relatório final de fechamento

### Checklist universal
- [ ] Executar o `Parity Harness` (testes automatizados comparando oráculo vs reconstrução)
- [ ] Resolver ou documentar formalmente qualquer desvio intencional de comportamento
- [ ] Promover todos os itens elegíveis de 🟡 para 🟢
- [ ] Validar compatibilidade de I/O (ex: saves gerados pelo novo produto abrem no legado e vice-versa)
- [ ] *(Opcional / Opt-In)* Executar auditoria de concorrência, idempotência e zero-trust (`core/engine/security.md`)
- [ ] Atualizar `HANDOFF.md` com estado final (ex: *DECOMPILATION CLOSED - RECONSTRUCTION READY*)
- [ ] Decisão final: Novo produto liberado / Port concluído / Arquivamento

---

## State Machine & Checkpoints

```
triage → extraction → interpretation → structuring → validation
  ↑                                                      │
  └──────────── (nova iteração se necessário) ───────────┘
```

Cada transição salva checkpoint em `state.json`. Sessões interrompidas podem ser retomadas instantaneamente através do script `Get-RESummary.ps1` ou leitura direta do `HANDOFF.md`.

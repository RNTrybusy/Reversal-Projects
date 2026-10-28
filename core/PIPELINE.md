# Pipeline Universal — 5 Fases

O pipeline core é compartilhado por todos os perfis. Cada perfil pode
**estender** fases (adicionar sub-etapas) mas nunca **remover** fases do core.

---

## Visão Geral

```
Fase 0        Fase 1          Fase 2          Fase 3         Fase 4
TRIAGEM  →  EXTRAÇÃO  →  INTERPRETAÇÃO  →  ESTRUTURAÇÃO  →  VALIDAÇÃO
```

---

## Fase 0 — Triagem (`triage`)

**Objetivo:** Classificar o alvo e selecionar o perfil correto.

**Entradas:** Binário/fonte/APK/ROM original em `Software Origin/`
**Saídas:** `HANDOFF.md` inicial + `state.json` com perfil selecionado

### Checklist universal
- [ ] Identificar plataforma (Win32, .NET, JVM, Android, SNES, etc.)
- [ ] Identificar linguagem/compilador/obfuscador
- [ ] Identificar proteções (packing, obfuscação, DRM)
- [ ] Selecionar perfil: `legacy-system` | `game` | `app` | `documentation`
- [ ] Selecionar ferramentas (Ghidra, JADX, ILSpy, etc.)
- [ ] Criar pasta `<nome>_decompiled/` e `HANDOFF.md` inicial

---

## Fase 1 — Extração (`extraction`)

**Objetivo:** Obter representação legível do binário/fonte.

**Entradas:** Original + ferramentas selecionadas
**Saídas:** Código decompilado, strings, assets extraídos

### Checklist universal
- [ ] Decompilação/desassemblagem do binário principal
- [ ] Extração de strings e constantes
- [ ] Extração de recursos (imagens, áudio, dados)
- [ ] Mapeamento de entry points
- [ ] Inventário de dependências externas
- [ ] Snapshot do estado em `state.json`

---

## Fase 2 — Interpretação (`interpretation`)

**Objetivo:** Entender o que o código faz; extrair lógica de negócio/jogo.

**Entradas:** Código decompilado + recursos
**Saídas:** Docs temáticos (`.md`), diagramas, ADRs retroativos

### Checklist universal
- [ ] Identificar módulos/componentes principais
- [ ] Documentar fluxos de dados (entrada → processamento → saída)
- [ ] Extrair regras de negócio / lógica de jogo / fluxos de UI
- [ ] Mapear modelo de dados (DB, saves, configs)
- [ ] Registrar decisões arquiteturais retroativas (ADRs)
- [ ] Marcar confiança: 🟢 CONFIRMADO / 🟡 INFERIDO / 🔴 LACUNA

---

## Fase 3 — Estruturação (`structuring`)

**Objetivo:** Organizar todo o conhecimento em formato consumível.

**Entradas:** Docs da Fase 2
**Saídas:** Especificações operacionais, mapa completo, HANDOFF atualizado

### Checklist universal
- [ ] Consolidar todos os `.md` temáticos
- [ ] Criar/atualizar mapa de arquivos no `HANDOFF.md`
- [ ] Cross-reference entre documentos
- [ ] Preencher lacunas (🔴) ou documentar como "unknowns"
- [ ] Gerar resumo executivo (`soul.md` ou equivalente)
- [ ] Atualizar `state.json` com porcentagem de cobertura

---

## Fase 4 — Validação (`validation`)

**Objetivo:** Verificar que o conhecimento extraído é correto e completo.

**Entradas:** Docs estruturados
**Saídas:** Relatório de validação, HANDOFF final

### Checklist universal
- [ ] Revisar cada 🟡 (inferido) — tentar promover a 🟢 ou rebaixar a 🔴
- [ ] Validar com testes práticos onde possível (scripts, patches, replays)
- [ ] Verificar consistência entre documentos
- [ ] Atualizar HANDOFF.md com estado final
- [ ] Decisão: projeto FECHADO ou próxima iteração

---

## State Machine

```
triage → extraction → interpretation → structuring → validation
  ↑                                                      │
  └──────────── (nova iteração se necessário) ───────────┘
```

Cada transição salva checkpoint em `state.json`. Sessões podem ser
retomadas de qualquer fase.

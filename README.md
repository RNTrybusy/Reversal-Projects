# Reversal Projects

Framework pessoal de engenharia reversa com perfis especializados por tipo de produto.

## Filosofia

> **Especializar sem fragmentar.** Pipeline core compartilhado (5 fases),
> estendido por perfis que adicionam sub-fases e checklists proporcionais
> à complexidade de cada tipo de produto.

## Quick Reference

```
Reversal Projects/
├── HANDOFF.md          ← ponto de entrada (este arquivo ↑)
├── AGENTS.md           ← regras para agentes AI
├── core/
│   ├── PIPELINE.md     ← pipeline universal (5 fases)
│   ├── CONFIDENCE.md   ← escala de confiança 🟢🟡🔴
│   └── RULES.md        ← regras universais
├── profiles/
│   ├── legacy-system/  ← VB.NET, Delphi, .NET antigo
│   ├── game/           ← ROMs, APKs de jogo, engines
│   ├── app/            ← Android, desktop, web apps
│   └── documentation/  ← consolidação de docs
├── templates/          ← templates HANDOFF, state.json
├── docs/               ← documentação do framework
│   ├── profiles/       ← docs detalhados por perfil
│   └── guides/         ← guias de uso
└── scripts/            ← utilitários de automação
```

## Inspirado por (mas não dependente de)
- **REA Framework** — tooling MCP para análise de binários (externo)
- **Reversa** — framework de documentação reversa para AI agents (externo)

## Licença
Uso pessoal.

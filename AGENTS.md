# Reversal Projects — Repository Guidelines

Workspace de engenharia reversa com framework de perfis especializados.

## Layout do Workspace

- `Software Origin/` — originais intocáveis (somente leitura)
- `<nome>_decompiled/` — processo de reversing (único lugar de escrita)
- `Software Recreated/` — reconstruções/ports
- `Reversal Projects/` — este framework (metodologia + templates + docs)
- `REA Framework/` — referência externa (não modificar)
- `reversa-main/` — referência externa (não modificar)

## Regra de economia de contexto

Todo projeto `*_decompiled/` mantém um `HANDOFF.md` curto (~40 linhas).
Sessão nova: ler HANDOFF.md primeiro. Consultar docs, não reler binários.
Nunca recriar contexto já documentado.

## Framework Reversal Projects

O framework define:
1. **Pipeline universal** de 5 fases (ver `Reversal Projects/core/PIPELINE.md`)
2. **Escala de confiança** 🟢/🟡/🔴 (ver `Reversal Projects/core/CONFIDENCE.md`)
3. **Perfis especializados** em `Reversal Projects/profiles/`:
   - `legacy-system` — sistemas legados desktop/server
   - `game` — jogos em qualquer plataforma
   - `app` — aplicativos mobile/desktop/web
   - `documentation` — geração de docs consolidados
4. **Templates** em `Reversal Projects/templates/`
5. **Regras universais** em `Reversal Projects/core/RULES.md`

Ao iniciar um novo projeto `*_decompiled/`, executar a Fase 0 (Triagem)
para selecionar o perfil correto, depois seguir o pipeline do perfil.

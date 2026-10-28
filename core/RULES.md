# Regras Universais

Regras que se aplicam a **todos** os perfis e projetos, sem exceção.

---

## 1. Imutabilidade dos Originais

```
Software Origin/ é SOMENTE LEITURA — nunca modificar, mover ou deletar.
```

Trabalho acontece exclusivamente em `<nome>_decompiled/`.

## 2. HANDOFF Obrigatório

Todo `*_decompiled/` DEVE manter um `HANDOFF.md` (~40 linhas) como ponto de
entrada. Sessão nova = ler HANDOFF primeiro, não código-fonte.

## 3. Documentação > Releitura

- Consultar docs em vez de reler binários/fontes
- Preferir scripts que imprimem resumos
- Validar com ferramentas, não inspeção manual
- Nunca recriar contexto já documentado

## 4. Escala de Confiança

Toda afirmação sobre código revertido carrega marcador: 🟢/🟡/🔴.
Ver `core/CONFIDENCE.md` para detalhes.

## 5. Economia de Tokens

- HANDOFF.md é o índice — curto, com ponteiros para docs detalhados
- Docs temáticos contêm o detalhe; não duplicar no HANDOFF
- Scripts de resumo (`scripts/`) para gerar visões condensadas
- Evitar re-derivar o que já está documentado

## 6. Nomenclatura de Arquivos

| Tipo | Padrão | Exemplo |
|------|--------|---------|
| Docs temáticos | `<tema>.md` | `save_format.md`, `match_engine.md` |
| Scripts de análise | `<verbo>_<alvo>.<ext>` | `extract_strings.py`, `verify_save.ps1` |
| Dados extraídos | `<tipo>_<contexto>.<ext>` | `strings_main.txt`, `db_schema.sql` |
| ADRs retroativos | `ADR-NNN-<titulo>.md` | `ADR-001-obfuscation-strategy.md` |

## 7. State Tracking

Cada projeto mantém `state.json` com:
```json
{
  "profile": "game",
  "phase": "interpretation",
  "phase_progress": 0.65,
  "last_checkpoint": "2026-10-28T12:00:00Z",
  "confidence": { "confirmed": 42, "inferred": 28, "gap": 15 }
}
```

## 8. Versionamento

- Commits atômicos com mensagens descritivas
- Um commit por fase concluída, no mínimo
- Tags para marcos importantes (`v0.1-triage-done`, etc.)

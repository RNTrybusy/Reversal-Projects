# Reversal Projects — HANDOFF

## O que é
Framework pessoal de engenharia reversa com perfis especializados por tipo de
produto: **legacy-system**, **game**, **app**, **documentation**. Núcleo
compartilhado (`core/`) + extensões por perfil (`profiles/`).

## Stack / Ferramentas
- Linguagem dos docs: **Markdown** (YAML front-matter nos templates)
- Controle de versão: **Git** (repositório local, sem remote por enquanto)
- Ferramentas RE: Ghidra, JADX, ILSpy/dnSpy, hex editors, Python scripts
- Contexto AI: HANDOFF.md + docs temáticos (economia de tokens)

## Mapa de Arquivos
| Caminho | Papel |
|---------|-------|
| `core/` | Pipeline universal (5 fases), regras, escala de confiança |
| `profiles/<tipo>/` | Extensões, checklists, fases extras por tipo de produto |
| `templates/` | Templates HANDOFF, state, relatórios |
| `docs/` | Documentação do framework em si |
| `scripts/` | Utilitários (init projeto, status, resumo) |

## Perfis disponíveis
- `legacy-system` — VB.NET, Delphi, .NET antigo; ênfase em desobfuscação, DB, migração
- `game` — ROMs, APKs de jogo, engines; ênfase em assets, physics, save format
- `app` — Android/desktop/web apps; ênfase em UI flows, APIs, data layer
- `documentation` — geração de docs a partir de código já analisado

## Invariantes
1. Originais (`Software Origin/`) são **somente leitura**
2. Todo projeto `*_decompiled/` DEVE ter `HANDOFF.md`
3. Docs > releitura de binários; scripts de resumo > inspeção manual
4. Escala de confiança: 🟢 CONFIRMADO / 🟡 INFERIDO / 🔴 LACUNA

## Estado atual
- **v0.1.0** — Estrutura inicial criada, docs fundacionais escritos
- Pipeline core (5 fases) definido
- 4 perfis documentados

## Próximos passos
- [ ] Criar scripts PowerShell de inicialização de projeto
- [ ] Migrar projetos existentes para usar o novo framework
- [ ] Adicionar templates de relatório por perfil
- [ ] Testar pipeline completo em um projeto real

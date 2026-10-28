# Perfil: Legacy System

> Sistemas legados desktop/server: VB.NET, Delphi, C/C++ Win32, .NET antigo,
> Java SE, COBOL, etc. Ênfase em desobfuscação, schemas de banco de dados,
> e caminhos de migração para stacks modernas.

---

## Quando usar
- Software desktop/server com código-fonte indisponível ou perdido
- Necessidade de entender para **manter, migrar ou portar**
- Presença de obfuscação (.NET ConfuserEx, Themida, etc.)
- Bancos de dados embutidos ou schemas complexos

## Ferramentas típicas
| Ferramenta | Uso |
|-----------|-----|
| ILSpy / dnSpy | Decompilação .NET |
| Ghidra | Binários nativos (C/C++, Delphi) |
| de4dot | Desobfuscação .NET |
| DB Browser SQLite | Bancos embutidos |
| x64dbg / OllyDbg | Debug dinâmico Win32 |
| Wireshark | Captura de protocolos de rede |

## Fases extras (além do pipeline core)

### Fase 1.5 — Desobfuscação (`deobfuscation`)
Entre Extração e Interpretação, quando obfuscação é detectada:
- [ ] Identificar obfuscador e versão
- [ ] Aplicar ferramentas de desobfuscação (de4dot, etc.)
- [ ] Comparar antes/depois — verificar integridade
- [ ] Documentar o que permanece ofuscado (🔴)

### Fase 2.5 — Mapeamento de Dados (`data-mapping`)
Ênfase especial no modelo de dados:
- [ ] Schema de todos os bancos de dados
- [ ] Formato de arquivos de configuração
- [ ] Formato de arquivos de save/state
- [ ] Mapeamento de registry entries (Windows)
- [ ] Protocolo de comunicação (se cliente-servidor)

## Checklist de completude (além do universal)
- [ ] Todas as telas/formulários documentados com screenshots
- [ ] Schema de DB completo com tipos e relações
- [ ] Strings decriptadas/desobfuscadas
- [ ] Caminhos de migração avaliados (port vs patch vs rewrite)
- [ ] Dependências de runtime documentadas (.NET version, COM objects, etc.)

## Artefatos específicos
| Artefato | Descrição |
|----------|-----------|
| `db_schema.md` | Schema completo de bancos de dados |
| `ui_screens.md` | Inventário de telas com função de cada uma |
| `obfuscation_report.md` | Análise do obfuscador e resultado da desobfuscação |
| `migration_paths.md` | Avaliação de opções de modernização |
| `runtime_deps.md` | Dependências de runtime e versões |

## Decisão de saída
Ao final da Fase 4, decidir entre:
1. **Manutenção** — patching binário (IL patch, hex edit)
2. **Migração** — rewrite em stack moderna preservando lógica
3. **Port** — reconstrução fiel em nova plataforma
4. **Arquivo** — documentação completa, sem ação futura

## Referências de projetos existentes
- `cm14_decompiled/` — VB.NET/ConfuserEx, modelo completo deste perfil
- `amt_mp3player_decompiled/` — Delphi nativo, hardware-adjacent

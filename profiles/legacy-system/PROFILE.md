# Perfil: Legacy System

> **Foco:** Sistemas legados desktop/server: VB.NET, Delphi, C/C++ Win32, .NET Framework antigo (2.0-4.x), Java SE, COBOL, etc.
> **Ênfase:** Desobfuscação, isolamento de regras enterradas em UI (code-behind), mapeamento de bancos de dados/arquivos proprietários, e modernização orientada a especificações limpas.

---

## 1. Quando Usar
- Software desktop/servidor com código-fonte indisponível, incompleto ou degradado.
- Necessidade de entender para **manter, migrar ou criar um novo produto** em stack moderna.
- Presença de obfuscação pesada (.NET ConfuserEx, Themida, VMProtect, etc.).
- Bancos de dados embutidos (Access, SQLite, Paradox, Firebird) ou esquemas relacionais complexos sem documentação.

---

## 2. Ferramentas Típicas de Extração
| Ferramenta | Uso Primário |
|---|---|
| **ILSpy / dnSpy / ICSharpCode** | Decompilação .NET para C# legível |
| **Ghidra / IDA** | Binários nativos Win32 (Delphi VCL, C++, C puro) |
| **de4dot / Net-Reactor-Slayer** | Desobfuscação automatizada de assemblies .NET |
| **DB Browser SQLite / DBeaver** | Análise e exportação de schemas de banco embutidos |
| **x64dbg / Process Hacker** | Depuração dinâmica em tempo de execução e inspeção de memória |
| **Wireshark / Fiddler** | Mapeamento de protocolos de comunicação de rede e RPC |

---

## 3. Sub-Fases Especializadas (Extensão do Pipeline Core)

```
Fase 1 (Extração) ──> [Fase 1.5: Desobfuscação] ──> Fase 2 (Interpretação) ──> [Fase 2.5: Mapeamento de Dados]
```

### Fase 1.5 — Desobfuscação & Normalização (`deobfuscation`)
- [ ] Atuar como `ARCHAEOLOGIST`: identificar o obfuscador e versão exata.
- [ ] Executar pipeline de limpeza (desempacotar strings criptografadas, restaurar nomes de métodos conhecidos).
- [ ] Registrar no `evidence_ledger.md` tabelas de tradução de símbolos cruciais.
- [ ] Validar que o assembly desobfuscado continua funcional (ou comparável byte-a-byte no oráculo).

### Fase 2.5 — Mapeamento do Modelo de Dados & Fronteiras (`data-mapping`)
- [ ] Atuar como `DETECTIVE`: separar a lógica de negócio do código de interface gráfica (desacoplar o *Code-Behind* do WinForms/VCL).
- [ ] Documentar o schema completo de tabelas, campos, tipos e relacionamentos.
- [ ] Identificar rotinas de persistência (queries SQL embutidas, triggers, stored procedures, serialização binária).
- [ ] Mapear arquivos de configuração (`.ini`, `.xml`, registro do Windows `HKLM/HKCU`).

---

## 4. Estratégia de Modernização e Síntese (`Software Recreated/`)

Consulte `core/engine/synthesis.md` para selecionar o padrão de modernização:

1. **Clean-Room via SDD (Recomendado):**
   - Escrever especificações formais (`docs/specs/sdd_*.md`) de cada serviço de negócio.
   - Implementar novo backend em C# .NET 9, Node.js, Go ou Rust com Clean Architecture.
2. **Strangler Fig (Para Grandes Sistemas):**
   - Substituir módulo a módulo, consumindo a mesma base de dados legada via novos repositórios desacoplados.
3. **Binary Wrapper / Bridge:**
   - Invocar DLLs nativas legadas temporariamente através de bindings modernos enquanto a UI e a API são refeitas.

---

## 5. Artefatos Obrigatórios do Perfil

| Artefato | Localização | Função |
|---|---|---|
| Handoff | `HANDOFF.md` | Resumo executivo do legado (~40 linhas) |
| Alma & Invariantes | `soul.md` | O valor central, regras inegociáveis e o que descartar |
| Livro de Evidências | `evidence_ledger.md` | Offsets, métodos desobfuscados e UNKs |
| Schema de Dados | `docs/db_schema.md` | DDL, dicionário de tipos e relacionamentos |
| Inventário de UI | `docs/ui_screens.md` | Mapeamento de formulários e suas responsabilidades |
| Decisões Históricas | `docs/adrs/ADR-*.md` | Registro de soluções de engenharia legadas |
| Specs de Implementação | `docs/specs/sdd_*.md` | Contratos para o novo produto em `Software Recreated/` |
| Testes de Paridade | `docs/specs/parity_*.md` | Casos de teste de conformidade de regras de negócio |

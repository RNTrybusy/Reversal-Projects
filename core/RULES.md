# Regras Universais

Regras que se aplicam a **todos** os perfis e projetos do **Reversal Projects**, sem exceção.
Elas combinam o rigor de prova técnica do **REA Framework** com a arquitetura e governança de especificações do **Reversa**.

---

## 1. Imutabilidade Absoluta dos Originais
```
Software Origin/ é SOMENTE LEITURA — nunca modificar, mover ou deletar.
```
- Reversão, análise e desmontagem acontecem exclusivamente em `<nome>_decompiled/`.
- Reconstruções, portas e novos produtos nascem exclusivamente em `Software Recreated/<nome>/`.

---

## 2. Rigor de Evidência Técnica (Princípio REA)
- Nenhuma conclusão crítica (algoritmo, cálculo de simulação, parser, chave criptográfica) pode ser marcada como 🟢 **CONFIRMADO** sem apontar o artefato técnico comprobatório (offset, instrução ASM, dump de bytes, chamada de syscall).
- Toda conclusão não comprovada é registrada como `UNK` no `evidence_ledger.md`.

---

## 3. Garantia de Paridade na Reconstrução (Princípio REA)
- Antes de declarar um componente recriado em `Software Recreated/` como concluído, ele **DEVE** passar por uma suíte de teste de paridade (`parity_spec.md`).
- Cálculos matemáticos, RNG e parsers exigem paridade **Bit-Exact**.
- Fluxos de tela e interações exigem paridade **Behavior-Exact**.

---

## 4. O Documento Soul como Bússola Inegociável (Princípio Reversa)
- Nenhum projeto avança para a escrita de código novo em `Software Recreated/` sem ter seu `soul.md` preenchido.
- O `soul.md` delimita as invariantes inegociáveis e lista o que é lixo histórico a ser descartado (*Discard Log*), impedindo que a IA replique erros acidentais do passado.

---

## 5. Postura Cognitiva Delimitada (Princípio Reversa)
- Prompts e sessões de IA devem adotar um dos 6 papéis especializados (`SCOUT`, `ARCHAEOLOGIST`, `DETECTIVE`, `ARCHITECT`, `SPECIFIER`, `RECONSTRUCTOR`).
- Evitar prompts genéricos como *"analise este projeto todo"*; demandar análises cirúrgicas de fatias verticais.

---

## 6. Economia Extrema de Contexto e Tokens
- **`HANDOFF.md` Obrigatório:** Índice condensado (~40 linhas) na raiz de todo projeto `*_decompiled/`. Novas sessões começam lendo o HANDOFF, nunca o código-fonte bruto.
- **Docs Temáticos:** O detalhamento vive em arquivos dedicados (`docs/*.md`); o HANDOFF apenas os aponta.
- **Scripts de Resumo:** Use `Get-RESummary.ps1` para injetar contexto condensado no chat de IA em vez de colar dumps de arquivos.
- **Nunca recriar contexto já documentado.**

---

## 7. Escala de Confiança Canônica
Toda afirmação sobre o sistema deve utilizar:
- 🟢 **CONFIRMADO:** Validado via teste, hex match ou prova de execução.
- 🟡 **INFERIDO:** Hipótese sólida baseada em padrões semânticos ou nomes.
- 🔴 **LACUNA (GAP):** Desconhecido ou contraditório (acompanhado de ID `UNK`).

---

## 8. Nomenclatura e Rastreabilidade de Artefatos

| Artefato | Padrão de Nome | Função |
|---|---|---|
| Handoff do Projeto | `HANDOFF.md` | Ponto de entrada de contexto (~40 linhas) |
| Alma & Invariantes | `soul.md` | Essência inegociável e descarte de débito |
| Livro de Evidências | `evidence_ledger.md` | Registro de offsets, hex, evidências e UNKs |
| Decisão Arquitetural | `docs/adrs/ADR-NNN-<titulo>.md` | Registro de decisões históricas descobertas |
| Especificação de Design | `docs/specs/sdd_<modulo>.md` | Contrato de implementação para novo produto |
| Especificação de Paridade | `docs/specs/parity_<modulo>.md` | Casos de teste de conformidade de saída |
| Scripts de Análise | `tools/<verbo>_<alvo>.<ext>` | Utilitários reprodutíveis em Python/PS1 |

---

## 9. Rastreamento Contínuo de Estado (`state.json`)
Cada projeto mantém na raiz o arquivo `state.json` atualizado via script `Update-REState.ps1` a cada transição de fase ou alteração relevante de cobertura.

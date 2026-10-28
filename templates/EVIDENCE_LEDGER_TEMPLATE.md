# Livro de Evidências e Incógnitas (Evidence Ledger)

> **Projeto:** {NOME_PROJETO}  
> **Última Atualização:** {DATA}  
> **Status de Cobertura:** 🟢 {N_CONFIRMED} | 🟡 {N_INFERRED} | 🔴 {N_GAPS}

---

## 1. Livro de Evidências Técnicas (Evidence Ledger)

Registre aqui observações baseadas em fatos verificáveis (bytes, offsets, disasm, chamadas de sistema).

| ID | Alvo (Offset / Símbolo / Linha) | Observação Técnica (Hex / ASM / AST) | Interpretação / Significado | Conf. | Obrigação de Reconstrução |
|---|---|---|---|---|---|
| `EV-001` | `{offset/funcao}` | `{dados_tecnicos}` | `{explicacao_semantica}` | 🟢 | `{o_que_o_novo_codigo_deve_fazer}` |
| `EV-002` | `{offset/funcao}` | `{dados_tecnicos}` | `{explicacao_semantica}` | 🟡 | `{o_que_o_novo_codigo_deve_fazer}` |

---

## 2. Rastreador de Incógnitas (Unknowns Tracker)

Pontos cegos, valores inexplicados ou áreas do binário ainda não compreendidas.

| ID | Localização / Contexto | Hipótese Atual | Teste / Experimento Proposto | Status |
|---|---|---|---|---|
| `UNK-001` | `{offset/campo}` | `{o_que_parece_ser}` | `{teste_proposto_com_ferramenta}` | 🔴 Aberto |
| `UNK-002` | `{offset/campo}` | `{o_que_parece_ser}` | `{teste_proposto_com_ferramenta}` | 🔴 Aberto |

---

## 3. Contratos de Fronteira (Boundary Contracts)

| Interface Externa | Tipo (I/O, DB, Rede, OS) | Formato / Protocolo | Tratamento de Erro Observado |
|---|---|---|---|
| `{nome_interface}` | `{tipo}` | `{detalhes_de_dados}` | `{como_o_legado_reage_a_falhas}` |

# Especificação de Teste de Paridade: {NOME_COMPONENTE}

> **Objetivo:** Provar que a nova implementação (em `Software Recreated/`) possui fidelidade estrita ao componente original (em `Software Origin/` ou código decompilado).

---

## 1. Escopo do Teste

- **Componente Legado:** `{funcao_ou_modulo_original}`
- **Componente Reconstruído:** `{funcao_ou_modulo_novo}`
- **Nível de Exigência:**
  - [ ] **Bit-Exact:** Saída numérica ou binária idêntica byte a byte (RNG, cripto, compressão, decodificação de save).
  - [ ] **Behavior-Exact:** Transições de estado e respostas idênticas sob mesmo conjunto de estímulos (lógica de UI, regras de negócio).

---

## 2. Casos de Teste Parametrizados (Oráculo vs Candidato)

| ID do Caso | Entrada(s) de Teste | Saída Esperada no Legado (Oráculo) | Saída Obtida no Novo (Candidato) | Status de Paridade |
|---|---|---|---|---|
| `TC-01` | `{entrada_a}` | `{saida_legado}` | `{saida_novo}` | 🟢 PASS / 🔴 FAIL |
| `TC-02` | `{entrada_b}` | `{saida_legado}` | `{saida_novo}` | 🟢 PASS / 🔴 FAIL |
| `TC-03` | `{edge_case_nulo_ou_max}` | `{saida_legado}` | `{saida_novo}` | 🟢 PASS / 🔴 FAIL |

---

## 3. Script ou Harness Automatizado de Validação

```python
# Exemplo de harness (ajustar conforme linguagem)
def test_parity():
    test_cases = [
        # (entrada, saida_esperada_oraculo)
    ]
    for inp, expected in test_cases:
        actual = reconstructed_function(inp)
        assert actual == expected, f"Discrepância! Entrada {inp}: esperado {expected}, obteve {actual}"
    print("Todos os casos passaram em paridade!")
```

---

## 4. Discrepâncias Conhecidas / Variações Intencionais

Se houver desvio justificado (ex: correção de bug evidente do legado, mudança de precisão de ponto flutuante):
- **Desvio 01:** `{descrever desvio e justificativa técnica}`

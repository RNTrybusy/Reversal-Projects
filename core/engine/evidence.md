# Motor de Evidências e Paridade (Evidence Engine)

> **Origem:** Destilação técnica do **REA Framework**.
> **Propósito:** Garantir rigor científico e rastreabilidade irrefutável durante a reversão, eliminando suposições e guiando a reconstrução com testes de paridade.

---

## 1. O Princípio da Evidência Irrefutável

Em engenharia reversa de alto nível, uma hipótese só se torna fato quando respaldada por um artefato de evidência verificável.

Toda conclusão deve responder a três perguntas:
1. **O que foi observado?** (Endereço, offset, bytes hexadecimais, assinatura de método, chamada de syscall).
2. **Qual é o escopo e limite da observação?** (Ex: "analisado apenas em x86-32, branch não percorrido em teste de estresse").
3. **Qual é a obrigação de reconstrução gerada?** (O que o novo produto ou spec deve implementar para replicar esse comportamento com fidelidade).

---

## 2. Evidence Ledger & Unknowns Tracker

Cada projeto mantém um livro de registros técnicos (`evidence_ledger.md` ou equivalente), estruturado em duas tabelas vitais:

### A. Livro de Evidências (Evidence Ledger)
| ID | Alvo / Função / Offset | Observação Técnica (Bytes / ASM / AST) | Interpretação | Confiança | Obrigação Gerada |
|---|---|---|---|---|---|
| `EV-001` | `sub_4011A0` (offset `0x11A0`) | Loop de 32 iterações com XOR `0x5A` | Descriptografia do save slot | 🟢 | Criar rotina compatível com XOR key `0x5A` |
| `EV-002` | `libgame.so:0x84E10` | Float mult por `0.0166667f` seguido de clamp `[-10.0, 10.0]` | Fixed time-step physics (60 FPS) | 🟢 | Motor de física do port deve usar delta fixo de 16.6ms |

### B. Rastreador de Incógnitas (Unknowns Tracker)
Itens que impedem a paridade total são categorizados como `UNK`:
| ID | Localização / Ponto Cego | Hipótese Atual | Teste / Ação para Resolução |
|---|---|---|---|
| `UNK-01` | Campo `+0x44` em `PlayerStruct` | Pode ser moral ou stamina residual | Modificar em memória via Cheat Engine/GDB e observar impacto na simulação |
| `UNK-02` | Retorno nulo em `parse_header()` | Header alternativo para versões legadas | Obter amostras de arquivos da versão v1.0 |

---

## 3. Harness de Paridade Comportamental (Parity Harness)

Quando o objetivo é recriar, modernizar ou portar um componente sem alterar a lógica original (ex: engine de física, cálculo de pontuação, gerador RNG, decodificador de arquivos):

### Estratégia de Verificação Dupla
```
[Entrada Idêntica (Seeds / Payloads)]
          ├──> [Binário Legado / Decompilado] ──> Saída A (Oráculo)
          └──> [Nova Implementação Reconstruída] ──> Saída B (Candidato)
                                                          │
                                     [Comparador: A === B?]
```

1. **Paridade Bit-Exact (Nível Matemático/Cripto/Parsers):**
   - A saída do código reconstruído deve ser **idêntica byte a byte** ou bit a bit à saída do legado (ex: RNG de `cm14`, decodificador de save de `toloveru`).
2. **Paridade Behavior-Exact (Nível UI/Simulação/Fluxos):**
   - O comportamento observável, estados de máquina e contratos de transição devem coincidir rigorosamente, mesmo que a stack interna seja moderna.

---

## 4. Fronteiras de Sistema (Boundary Contracts)

Identificar e isolar onde o legado conversa com o mundo externo:
- **System Calls / OS APIs:** (Win32 GDI/User32, Android POSIX/NDK, Linux libc).
- **Formatos de Persistência:** (Offsets em arquivos binários, SQLite, Registry, SharedPrefs).
- **Transportes de Rede:** (Headers customizados, payloads binários/JSON, handshakes).

Toda fronteira deve ser descrita como um **Contrato de Interface Neutro**, permitindo que o novo produto substitua o legado sem que clientes ou arquivos de dados quebrem.

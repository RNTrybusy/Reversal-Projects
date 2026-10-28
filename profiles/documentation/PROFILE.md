# Perfil: Documentation (Especificações e Consolidação de Conhecimento)

> **Foco:** Consolidação, auditoria de integridade e publicação de documentação reversa técnica e funcional.
> **Origem:** Inspirado no motor de documentação do **Reversa** e na precisão de relatórios do **REA**.
> **Ênfase:** Transformar anotações esparsas de engenharia reversa em especificações operacionais executáveis (SDD), glossários de domínio, mapas de dependências e documentações para consumo humano e de agentes de IA.

---

## 1. Quando Usar
- O projeto já possui análise técnica preliminar ou avançada, mas o conhecimento está disperso.
- Necessidade de preparar o projeto para **handoff** seguro para outra equipe ou agente de IA.
- Geração de documentação para embasar auditorias, recriação em `Software Recreated/` ou arquivo permanente.
- Criação de um manual técnico completo sem necessidade de manter o software original em execução.

---

## 2. Ferramentas Típicas
| Ferramenta | Uso Primário |
|---|---|
| **Markdown + GitHub Flavored Syntax** | Formato universal, leve e amigável para IA |
| **Mermaid.js** | Diagramas declarativos de arquitetura (C4, flowcharts, ERD, sequências) |
| **Scripts Python / PowerShell** | Checagem de links quebrados, contagem de tokens e métricas |
| **MkDocs Material / VitePress** | Publicação de mini-site estático navegável (opcional) |

---

## 3. Pipeline Especializado de Documentação (3 Fases)

```
Fase D1 (Inventário & Auditoria) ──> Fase D2 (Consolidação & SDD) ──> Fase D3 (Publicação & Handoff)
```

### Fase D1 — Inventário & Auditoria de Integridade (`doc-inventory`)
- [ ] Atuar como `REVIEWER`: auditar todos os arquivos de documentação existentes no projeto.
- [ ] Mapear lacunas: existem funções críticas no código que não constam em nenhum `.md`?
- [ ] Verificar inconsistências: existem contradições entre a análise estática e os logs de execução?
- [ ] Atualizar o status de cobertura no `state.json` e registrar pontos cegos no `evidence_ledger.md`.

### Fase D2 — Consolidação & Especificações Executáveis (`doc-consolidation`)
- [ ] Atuar como `SPECIFIER`: transformar análises descritivas em **Contratos Executáveis (SDD)**.
- [ ] Redigir ou refinar o documento `soul.md` (garantir invariantes inegociáveis e discard log).
- [ ] Padronizar nomenclatura em um glossário de termos (`docs/glossary.md`).
- [ ] Converter fluxos complexos em diagramas Mermaid claros e compactos.
- [ ] Atualizar o `HANDOFF.md` garantindo que não ultrapasse ~40-50 linhas.

### Fase D3 — Publicação & Validação de Consumo (`doc-publication`)
- [ ] Validar todos os links relativos e referências entre documentos.
- [ ] Testar a eficácia dos documentos com um agente de IA: o modelo consegue entender e implementar uma feature sem ler o código original?
- [ ] Se desejado, gerar mini-site estático ou consolidar em PDF único.
- [ ] Marcar o projeto como oficialmente documentado e estável.

---

## 4. O Padrão de Especificações Executáveis (SDD)

Documentos de documentação pura tendem a ser esquecidos. O Reversal Projects preconiza que a documentação deve ser **operacional**:
- Cada documento técnico deve explicar **como funciona**, **quais são os tipos de dados**, **quais são as regras de negócio** e **como testar a paridade**.
- Desta forma, a documentação serve tanto para consulta humana quanto para instruir um LLM a codificar o novo produto sem ambiguidades.

---

## 5. Artefatos Finais do Perfil

| Artefato | Localização | Função |
|---|---|---|
| Handoff Mestre | `HANDOFF.md` | O mapa resumido do projeto (~40 linhas) |
| Alma do Produto | `soul.md` | Essência irredutível e regras inegociáveis |
| Índice Geral | `docs/index.md` | Sumário navegável com links para todos os relatórios |
| Glossário de Domínio | `docs/glossary.md` | Termos técnicos, acrônimos e entidades do negócio |
| Especificações SDD | `docs/specs/sdd_*.md` | Caderno de encargos técnicos para implementação |
| Diagramas Arquiteturais | `docs/diagrams/` | Topologia em Mermaid (C4, ERD, State machines) |

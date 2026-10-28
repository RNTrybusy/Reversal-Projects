# Reversal Projects vs. Referências

Comparação com os dois frameworks usados como base de inspiração.

## REA Framework (morluto/rea)

| Aspecto | REA | Reversal Projects |
|---------|-----|-------------------|
| **Foco** | Tooling MCP — ferramentas de inspeção de binários | Metodologia — processo e organização |
| **Abordagem** | Programática (TypeScript, bridges Ghidra/Hopper) | Documental (Markdown, checklists, templates) |
| **Especialização** | Por tipo de binário (native, JS, .NET, Android) | Por tipo de produto (legacy, game, app, docs) |
| **Output** | Evidência técnica (pseudocode, assembly, symbols) | Conhecimento estruturado (specs, ADRs, maps) |
| **Uso conjunto** | Sim — REA como ferramenta dentro do Reversal Projects pipeline |

### O que absorvemos do REA
- ✅ Distinção entre observações, inferências e unknowns → nossa escala 🟢🟡🔴
- ✅ Evidence-based analysis — nunca afirmar sem evidência
- ✅ Idempotência — operações não destrutivas
- ✅ Provider-neutral contracts — docs independentes de ferramenta

### O que NÃO absorvemos
- ❌ MCP server (não precisamos — workflow pessoal manual + AI agent)
- ❌ Complexidade de build (npm, TypeScript, Vitest)
- ❌ Multi-provider orchestration (usamos ferramentas diretamente)

---

## Reversa (sandeco/reversa)

| Aspecto | Reversa | Reversal Projects |
|---------|---------|-------------------|
| **Foco** | Documentação reversa para AI agents | RE completo (extração → estruturação → decisão) |
| **Escopo** | Código-fonte disponível (legacies com fonte) | Binários sem fonte (true RE) |
| **Agentes** | 50+ agentes especializados por prompt | Perfis + checklists (humano-dirigido com AI assist) |
| **Especialização** | Genérico (mesmos agentes para tudo) | Perfis por tipo de produto |
| **Peso** | Pesado (context load alto, muitos agentes) | Leve (HANDOFF + docs temáticos, economia de tokens) |
| **Pipeline** | 5 fases discovery + forward + migrate + docs | 5 fases core + sub-fases por perfil |

### O que absorvemos do Reversa
- ✅ Pipeline de 5 fases (Reconnaissance→Excavation→Interpretation→Generation→Review)
- ✅ Escala de confiança 🟢🟡🔴
- ✅ Checkpoints e state.json para sessões resumíveis
- ✅ Imutabilidade de originais
- ✅ HANDOFF como ponto de entrada

### O que NÃO absorvemos
- ❌ 50+ agentes separados (overhead de contexto)
- ❌ CLI installer (npx, package.json)
- ❌ Engine-agnostic de 14 engines (usamos 1-2)
- ❌ Templates em português + inglês + espanhol (só pt-br)
- ❌ Hooks de Claude Code (check-legacy-policy.mjs)
- ❌ Forward/Migration/Pricing pipelines (escopo diferente)

---

## Resumo da diferenciação

```
REA Framework    = Caixa de ferramentas (MCP tools para binários)
Reversa          = Fábrica de specs (50+ agentes para documentar código)
Reversal Projects = Metodologia pessoal (pipeline + perfis para RE completo)
```

Reversal Projects pode **usar** REA como ferramenta e **seguir ideias** do
Reversa, mas é independente de ambos.

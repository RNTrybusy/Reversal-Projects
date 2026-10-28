# Perfil: Documentation

> Geração de documentação estruturada a partir de código já analisado.
> Usado APÓS a engenharia reversa (Fases 0–3 de outro perfil) para
> consolidar e publicar o conhecimento extraído.

---

## Quando usar
- Projeto já passou pelas fases de extração e interpretação
- Necessidade de documentação consumível por humanos ou agentes AI
- Preparação para migração, port, ou handoff para outro desenvolvedor
- Consolidação de conhecimento antes de arquivar um projeto

## Ferramentas típicas
| Ferramenta | Uso |
|-----------|-----|
| Markdown | Formato base de todos os docs |
| Mermaid | Diagramas (flowchart, ERD, sequence) |
| Python scripts | Conversão e extração automatizada |
| Pandoc | Geração de HTML/PDF se necessário |

## Pipeline (simplificado — 3 fases)

Este perfil tem pipeline próprio, mais curto:

```
Fase D1          Fase D2           Fase D3
INVENTÁRIO  →  CONSOLIDAÇÃO  →  PUBLICAÇÃO
```

### Fase D1 — Inventário (`doc-inventory`)
- [ ] Listar todos os `.md` temáticos existentes
- [ ] Verificar cobertura (o que falta documentar?)
- [ ] Verificar consistência (contradições entre docs?)
- [ ] Mapear relações entre documentos
- [ ] Classificar por audiência (técnico, executivo, AI agent)

### Fase D2 — Consolidação (`doc-consolidation`)
- [ ] Preencher lacunas identificadas
- [ ] Unificar nomenclatura e formatação
- [ ] Adicionar diagramas Mermaid onde ajuda
- [ ] Criar índice mestre / table of contents
- [ ] Gerar `soul.md` (resumo executivo de 1 página)
- [ ] Atualizar HANDOFF.md com estado final

### Fase D3 — Publicação (`doc-publication`)
- [ ] Escolher formato de saída (Markdown puro, HTML, PDF)
- [ ] Gerar artefato final
- [ ] Validar links internos e referências
- [ ] Review final de conteúdo

## Artefatos específicos
| Artefato | Descrição |
|----------|-----------|
| `soul.md` | Resumo executivo de 1 página do projeto |
| `index.md` | Índice mestre com links para todos os docs |
| `glossary.md` | Glossário de termos do domínio |
| `diagram_*.md` | Diagramas Mermaid temáticos |

## Notas
- Este perfil é **complementar** — sempre roda após outro perfil
- Foco em economia de tokens: docs devem ser auto-suficientes para que
  agentes AI não precisem reler código-fonte
- Formato preferido: Markdown com Mermaid (máxima portabilidade)

# Reversal Projects — HANDOFF

## O que é
Framework autônomo de engenharia reversa e síntese de novos produtos.
Incorpora diretamente no seu núcleo as maiores forças do **REA Framework** (rigor de evidências, paridade bit-exact/behavior-exact, unknown tracking) e do **Reversa** (papéis cognitivos especializados, especificações operacionais SDD, documento Soul e catálogo de migração de paradigmas), sem depender de repositórios externos.

## Stack / Ferramentas
- Formato: **Markdown estruturado** + **JSON de estado**
- Controle de versão: **Git** (repositório local independente)
- Ferramentas RE suportadas: Ghidra, JADX, ILSpy, dnSpy, Hopper, Frida, mitmproxy
- Automação: Scripts PowerShell modulares em `scripts/`
- Governança de contexto: Resumos condensados e posturas cognitivas delimitadas para máxima economia de tokens

## Mapa de Arquivos
| Caminho | Papel |
|---|---|
| `core/` | Pipeline universal (5 fases), regras universais, escala de confiança |
| `core/engine/` | Motores destilados: `evidence.md`, `roles.md`, `synthesis.md`, `soul.md`, `security.md` |
| `profiles/` | Perfis especializados: `legacy-system`, `game`, `app`, `documentation` |
| `templates/` | Templates: HANDOFF, state, evidence ledger, parity spec, retro ADR, SDD, soul, security audit |
| `scripts/` | Utilitários PowerShell (`New-REProject`, `Get-REStatus`, `Update-REState`, `Get-RESummary`) |
| `docs/` | Guias de uso, quickstarts e comparações de arquitetura |

## Invariantes
1. `Software Origin/` é **somente leitura** inegociável.
2. `Software Recreated/` é o destino de novos produtos gerados a partir das especificações.
3. Toda afirmação técnica crítica exige evidência formal e marcação de confiança 🟢🟡🔴.
4. Código reconstruído deve passar por teste de conformidade de paridade (`parity_spec.md`).
5. Antes de codificar um novo produto, seu `soul.md` deve estar preenchido.

## Estado Atual
- **v0.4.0 — Módulo Opt-In de Segurança & Resiliência Integrado**
  - `core/engine/security.md`: Os 5 Fundamentos anti-vibe coding (Race Condition, Idempotência, Zero-Trust, Separação de Responsabilidades, Testes de Integração Concorrentes) + Prompts de remediação direta no banco.
  - `templates/SECURITY_AUDIT_TEMPLATE.md`: Relatório de auditoria opt-in.
  - Motores destilados anteriores (`evidence.md`, `roles.md`, `synthesis.md`, `soul.md`) operacionais e testados.
  - `core/engine/soul.md`: Extração de essência e descarte de débito técnico.
  - Templates operacionais completos criados em `templates/`.
  - Scripts de automação integrados aos novos motores.

## Próximos Passos
- [ ] Validar o fluxo ponta a ponta com a criação de um projeto de teste
- [ ] Expandir exemplos práticos nos guias de cada perfil
- [ ] Criar catálogo de heurísticas de desassemblagem por arquitetura (x86, ARM, 65816)

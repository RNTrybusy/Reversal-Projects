# Perfil: App (Aplicativos Mobile, Desktop & Web)

> **Foco:** Aplicativos de uso geral: Android (APKs padrão com Java/Kotlin e NDK utilitário), Desktop moderno (Electron, Tauri, .NET WPF/MAUI, Qt) e PWAs/Webapps empacotados.
> **Ênfase:** Mapeamento de contratos de API REST/GraphQL, fluxo de navegação e telas, camada de persistência local, pontes de comunicação IPC e cirurgia de features (remoção segura de telemetria, ads e travas de licença).

---

## 1. Quando Usar
- Aplicativos móveis ou desktop sem motor de jogo ou arquitetura monolítica obsoleta.
- Necessidade de entender como o frontend se comunica com serviços de nuvem privados.
- Diagnóstico de segurança, auditoria de privacidade ou remoção de componentes indesejados (ad networks, trackers invasivos).
- Planejamento de port multiplataforma ou recriação de cliente alternativo livre (open source).

---

## 2. Ferramentas Típicas de Extração
| Ferramenta | Uso Primário |
|---|---|
| **JADX-GUI / apktool / Uber-APK-Signer** | Decompilação, edição de recursos e reassinatura de APKs Android |
| **mitmproxy / Charles / Burp Suite** | Interceptação de tráfego HTTPS, quebra de SSL Pinning e gravação HAR |
| **Frida / Objection** | Instrumentação dinâmica em tempo de execução e hook de métodos |
| **Chrome DevTools / asar tool** | Desempacotamento e inspeção de código-fonte de apps Electron |
| **Ghidra** | Análise de bibliotecas nativas de ponte (JNI em Android, node addons no Electron) |
| **Postman / Bruno / curl** | Reprodução e validação de contratos de API |

---

## 3. Sub-Fases Especializadas (Extensão do Pipeline Core)

```
Fase 1 (Extração) ──> [Fase 1.5: Mapeamento de APIs & Redes]
                                │
Fase 2 (Interpretação) ──> [Fase 2.5: Fluxos de UI & IPC] ──> [Fase 2.7: Cirurgia de Features]
```

### Fase 1.5 — Mapeamento de Redes & Contratos de Fronteira (`api-mapping`)
- [ ] Atuar como `SCOUT` e `ARCHAEOLOGIST`: extrair todos os endpoints HTTP/HTTPS, WebSockets e URLs de serviço.
- [ ] Mapear esquemas de autenticação (OAuth2, JWT, tokens HMAC, certificados customizados).
- [ ] Gravar payloads de requisição e resposta de exemplo em `docs/api_endpoints.md`.
- [ ] Registrar no `evidence_ledger.md` qualquer lógica de assinatura ou criptografia de payload.

### Fase 2.5 — Navegação de Telas e Comunicação IPC (`ui-flow-ipc`)
- [ ] Mapear todas as telas/atividades/páginas e criar fluxograma de navegação (Mermaid).
- [ ] Documentar canais de comunicação entre processos (Android Intents, Electron `ipcRenderer`/`ipcMain`, WebViews).
- [ ] Identificar a camada de persistência de dados local (Room/SQLite, SharedPreferences, LocalStorage, IndexedDB).

### Fase 2.7 — Cirurgia de Features & Auditoria (`feature-surgery`)
Quando a meta envolve auditar ou modificar o aplicativo:
- [ ] **Rastreamento de Bloqueios:** Identificar SDKs de monetização (Google AdMob, Unity Ads, etc.), trackers (Firebase, Adjust) e verificação de licença.
- [ ] **Planejamento de Patch Mínimo:** Especificar as alterações pontuais em bytecode (Smali ou JS) necessárias para desabilitar o código sem gerar crashes colaterais.
- [ ] **Parity & Integrity Check:** Garantir que o aplicativo modificado continue operando normalmente nas rotinas legítimas.

---

## 4. Reconstrução ou Criação de Novo Cliente (`Software Recreated/`)

Consulte `core/engine/synthesis.md` para orientar o desenvolvimento:

1. **Cliente Alternativo Moderno (Flutter, React Native, Next.js, Tauri):**
   - Implementar os contratos de API documentados em `docs/api_endpoints.md`.
   - Reutilizar fluxos de UX documentados sem carregar o débito técnico de SDKs de terceiros.
2. **Harness de Conformidade:**
   - Testar o cliente novo contra os mesmos servidores ou endpoints mockados com 100% de paridade de headers e formato de dados.

---

## 5. Artefatos Obrigatórios do Perfil

| Artefato | Localização | Função |
|---|---|---|
| Handoff | `HANDOFF.md` | Resumo de arquitetura e progresso (~40 linhas) |
| Alma & Proposta | `soul.md` | Proposta de valor central, invariantes e descartes |
| Livro de Evidências | `evidence_ledger.md` | Endpoints, assinaturas, hooks de Frida e UNKs |
| Catálogo de APIs | `docs/api_endpoints.md` | Especificação completa de requests/responses |
| Fluxo de Navegação | `docs/ui_flow.md` | Diagramas Mermaid de navegação e estados de tela |
| Camada de Dados | `docs/data_layer.md` | Estrutura de banco local e preferências |
| Cirurgia de Features | `docs/feature_surgery.md` | Registro de patches, classes de ads/licenças isoladas |
| Specs de Implementação | `docs/specs/sdd_*.md` | Especificações para recriar cliente novo em `Software Recreated/` |
| Testes de Paridade | `docs/specs/parity_*.md` | Validação de payloads e transições de tela |

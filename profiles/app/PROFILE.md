# Perfil: App (Aplicativo)

> Aplicativos de uso geral: Android, desktop, web, Electron. Não são jogos
> nem sistemas legados complexos. Ênfase em UI flows, APIs, data layer,
> e remoção de features indesejadas (ads, licenciamento).

---

## Quando usar
- Aplicativo mobile (Android APK) sem engine de jogo
- Aplicativo desktop com UI convencional
- Apps Electron / web empacotados
- Objetivo: entender, modificar, remover features, ou portar

## Ferramentas típicas
| Ferramenta | Uso |
|-----------|-----|
| JADX | APKs Android (Java/Kotlin) |
| apktool | Recursos e manifesto Android |
| Ghidra | Libs nativas dentro de APKs |
| mitmproxy / Charles | Interceptação de APIs HTTP |
| Frida | Instrumentação dinâmica |
| Chrome DevTools | Apps web/Electron |
| ILSpy | Apps .NET desktop |

## Fases extras (além do pipeline core)

### Fase 1.5 — API Mapping (`api-mapping`)
Apps modernos são frontends para APIs:
- [ ] Endpoints HTTP/HTTPS identificados
- [ ] Payload request/response documentado
- [ ] Autenticação (OAuth, JWT, API keys)
- [ ] WebSockets ou protocolos real-time
- [ ] Rate limits e headers especiais

### Fase 2.5 — UI Flow Analysis (`ui-flow`)
- [ ] Mapa de telas / activities / fragments
- [ ] Navegação entre telas (fluxograma)
- [ ] Componentes reutilizáveis identificados
- [ ] Deep links e intents
- [ ] Acessibilidade e localização

### Fase 2.7 — Feature Surgery (`feature-surgery`)
Quando o objetivo é remover ou modificar features específicas:
- [ ] Ads: identificar SDKs, classes, layouts
- [ ] Licenciamento: verificação de licença, trial logic
- [ ] Analytics/tracking: SDKs de telemetria
- [ ] Paywall: lógica de compra in-app
- [ ] Plano de remoção cirúrgica (minimal patch)

## Checklist de completude (além do universal)
- [ ] Manifesto Android analisado (permissions, components)
- [ ] APIs documentadas com exemplos de request/response
- [ ] Mapa de navegação de UI completo
- [ ] Data layer (SharedPreferences, SQLite, Room, etc.)
- [ ] SDKs de terceiros identificados e documentados
- [ ] Plano de modificação/remoção de features se aplicável

## Artefatos específicos
| Artefato | Descrição |
|----------|-----------|
| `api_endpoints.md` | Catálogo de endpoints com payloads |
| `ui_flow.md` | Mapa de navegação e telas |
| `data_layer.md` | Camada de dados (DB, prefs, cache) |
| `third_party_sdks.md` | SDKs integrados e seus efeitos |
| `feature_surgery.md` | Plano de remoção/modificação cirúrgica |
| `manifest_analysis.md` | Análise do AndroidManifest |

## Referências de projetos existentes
- `purl_player_decompiled/` — Android media player, ads, licenciamento

# Perfil: Game

> Jogos em qualquer plataforma: ROMs (SNES, GBA, NES), APKs de jogo Android,
> J2ME, PC nativo, engines proprietárias. Ênfase em engine de jogo, assets,
> formato de save, physics/simulation, e RNG.

---

## Quando usar
- Software cujo propósito principal é entretenimento interativo
- Presença de engine de jogo (proprietária ou conhecida)
- Assets gráficos/sonoros significativos
- Mecânicas de simulação, física ou aleatoriedade

## Ferramentas típicas
| Ferramenta | Uso |
|-----------|-----|
| Ghidra | ROMs, binários nativos, libs .so |
| JADX | APKs Android (Java/Kotlin) |
| Tile Molester / YY-CHR | Gráficos de ROM (tiles/sprites) |
| VGMTrans / foobar2000 | Áudio de jogo |
| Hex editors | Formato de save, tabelas de dados |
| Python scripts | Réplica de RNG, simulação, validação |
| Emuladores com debug | SNES9x debugger, mGBA, etc. |

## Fases extras (além do pipeline core)

### Fase 1.5 — Extração de Assets (`asset-extraction`)
- [ ] Sprites / tilesets / texturas
- [ ] Música / efeitos sonoros (formato + player)
- [ ] Fontes e elementos de UI
- [ ] Tabelas de dados (jogadores, itens, mapas, etc.)
- [ ] Localização / strings de texto (encoding!)

### Fase 2.5 — Engine Analysis (`engine-analysis`)
A parte mais crítica e única de jogos:
- [ ] **Loop de jogo** — identificar game loop principal
- [ ] **Rendering** — pipeline gráfico (2D tiles, GLES, sprites)
- [ ] **Physics/Simulation** — motor de física ou simulação
- [ ] **RNG** — algoritmo de aleatoriedade (LCG, Mersenne, etc.)
- [ ] **Save system** — formato, criptografia, checksum
- [ ] **Input** — mapeamento de controles/touch
- [ ] **AI** — comportamento de NPCs/oponentes
- [ ] **Audio engine** — sistema de som (mixer, canais, formatos)

### Fase 2.7 — Data Tables (`data-tables`)
Jogos são data-driven; tabelas merecem fase própria:
- [ ] Tabelas de jogadores/personagens
- [ ] Tabelas de itens/equipamentos
- [ ] Tabelas de mapas/níveis
- [ ] Balanceamento (curvas de XP, dano, etc.)
- [ ] Probabilidades (drop rates, encounter rates)

## Checklist de completude (além do universal)
- [ ] RNG replicado e validado com script
- [ ] Formato de save completamente documentado
- [ ] Assets extraídos em formatos padrão (PNG, WAV, etc.)
- [ ] Engine loop documentado com diagrama
- [ ] Tabelas de dados extraídas em formato estruturado (CSV/JSON)
- [ ] Mecânicas de simulação documentadas com fórmulas

## Artefatos específicos
| Artefato | Descrição |
|----------|-----------|
| `engine_overview.md` | Arquitetura da engine de jogo |
| `save_format.md` | Formato de save byte-a-byte |
| `rng_analysis.md` | Algoritmo RNG + script de réplica |
| `data_tables/` | Pasta com tabelas extraídas (CSV/JSON) |
| `asset_inventory.md` | Inventário de assets com formatos |
| `simulation.md` | Motor de simulação/match/physics |
| `encoding.md` | Tabela de caracteres / encoding de texto |

## Peculiaridades de jogos por plataforma

### ROMs (SNES, GBA, NES, Mega Drive)
- Endereçamento: LoROM/HiROM/mapeamento de banco
- Fixed-point math (sem FPU!)
- DMA e modos gráficos do hardware
- Tabela de interrupções / vetores

### Android NDK
- Libs nativas `.so` (ARM Thumb-2 frequente)
- JNI bridges entre Java e nativo
- OpenGL ES para rendering
- Assets em `assets/` dentro do APK

### J2ME
- ProGuard obfuscation padrão
- Canvas-based rendering
- Fixed-point math (24.8, 16.16)
- RecordStore para saves
- Limitações de memória severas

### PC Nativo (DOS, Win16, Win32)
- DOS: modo real, interrupções, VGA/SVGA
- Formatos de áudio: MIDI, MOD, S3M
- Paletas de cores indexadas

## Referências de projetos existentes
- `toloveru_puzzlegame_decompiled/` — Android NDK, ARM, GLES2
- `rfm2013_decompiled/` — J2ME, fixed-point physics, ProGuard
- `fmm20_decompiled/` — Android nativo, engine de match complexa
- `pm97_decompiled/` — SNES ROM, 65816 assembly
- `brasfoot22-23_decompiled/` — PC, simulação esportiva completa

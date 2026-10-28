# Perfil: Game (Jogos & Emulação)

> **Foco:** Jogos em qualquer plataforma: ROMs de console (SNES, GBA, NES, Mega Drive), APKs Android de jogos (NDK C++, Java, Unity/Unreal empacotados), J2ME, PC clássico (DOS, Win32) e engines proprietárias.
> **Ênfase:** Extração de assets, dissecação do game loop, fórmulas de simulação/física, geradores de aleatoriedade (RNG), formatos de save e testes de paridade bit-exact.

---

## 1. Quando Usar
- Software cujo propósito central é entretenimento interativo ou simulação gráfica/esportiva.
- Presença de engine de jogo (proprietária ou conhecida: LibGDX, Cocos2d, Godot, Unity).
- Lógica de simulação de alta complexidade matemática (ex: match engine de futebol, física 2D/3D, curvas de dano).
- Necessidade de portar o jogo para plataformas modernas (PC, Web, Mobile) preservando a jogabilidade idêntica (*game feel*).

---

## 2. Ferramentas Típicas de Extração
| Ferramenta | Uso Primário |
|---|---|
| **Ghidra / Hopper / IDA** | Binários nativos, ROMs (65816, ARM, MIPS) e bibliotecas `.so` |
| **JADX / apktool** | APKs Android (camada Java, JNI wrappers, manifestos) |
| **AssetStudio / Il2CppDumper** | Jogos Unity (extração de assets e restauração de símbolos Il2Cpp) |
| **Tile Molester / YY-CHR** | Visualização e extração de gráficos de ROMs clássicas |
| **VGMTrans / foobar2000** | Ripping e conversão de trilhas sonoras e efeitos de áudio de jogos |
| **Python / Jupyter** | Prototipação e teste de paridade de algoritmos de RNG e física |
| **Emuladores com Debugger** | Mesen, SNES9x Debugger, mGBA, PCSX-Redux |

---

## 3. Sub-Fases Especializadas (Extensão do Pipeline Core)

```
Fase 1 (Extração) ──> [Fase 1.5: Assets & Dados Brutos]
                                │
Fase 2 (Interpretação) ──> [Fase 2.5: Game Loop & Física] ──> [Fase 2.7: Tabelas & RNG]
```

### Fase 1.5 — Extração de Assets & Encodings (`asset-extraction`)
- [ ] Atuar como `ARCHAEOLOGIST`: extrair texturas, spritesheets, fontes e paletas de cores.
- [ ] Mapear arquivos de áudio (formato de som: PCM, MIDI, mod tracker, OGG, WAV).
- [ ] Mapear tabelas de texto e codificações especiais (SJIS, ASCII customizado, matriz de caracteres de ROM).
- [ ] Inventariar formatos empacotados proprietários (`.pak`, `.dat`, `.bin`, `.arc`).

### Fase 2.5 — Dissecação do Game Loop & Física (`engine-analysis`)
- [ ] Atuar como `ARCHAEOLOGIST` e `DETECTIVE`: isolar o loop de atualização (`update()`) e desenho (`render()`).
- [ ] Identificar taxa de quadros e passo de física (tempo fixo vs delta time).
- [ ] Mapear rotinas de colisão e resolução de forças (fixed-point math ou ponto flutuante).
- [ ] Registrar assinaturas e rotinas no `evidence_ledger.md`.

### Fase 2.7 — Fórmulas de Simulação, RNG e Saves (`data-tables-rng`)
- [ ] **RNG Engine:** Identificar o algoritmo de geração de números pseudo-aleatórios (LCG, Xorshift, Mersenne Twister). *Obrigatório replicar em script Python para paridade bit-exact.*
- [ ] **Formato de Save:** Mapear a struct byte-a-byte, checksums (CRC32, MD5, soma simples) e encriptação.
- [ ] **Tabelas de Dados:** Extrair listas de entidades (jogadores, atributos, inimigos, itens) para CSV ou JSON limpo.

---

## 4. Reconstrução e Portabilidade (`Software Recreated/`)

Consulte `core/engine/synthesis.md` para guiar a reconstrução:

1. **Port para Engines Modernas (Godot 4, Raylib, MonoGame, Flutter):**
   - O core de simulação/física deve ser reimplementado como biblioteca pura (sem dependência de rendering).
   - A engine moderna atua apenas como camada de visualização e entrada.
2. **Parity Harness Obrigatório:**
   - **RNG:** Testar 10.000 chamadas consecutivas com a mesma seed entre o legado e o novo código.
   - **Saves:** Salvar no novo motor e carregar com sucesso no jogo original (e vice-versa).
   - **Simulação:** Garantir que as mesmas condições de partida/partida gerem o mesmo placar/resultado.

---

## 5. Artefatos Obrigatórios do Perfil

| Artefato | Localização | Função |
|---|---|---|
| Handoff | `HANDOFF.md` | Resumo de arquitetura e progresso (~40 linhas) |
| Alma & Mecânicas | `soul.md` | O "game feel", regras inegociáveis e descartes |
| Livro de Evidências | `evidence_ledger.md` | Offsets de funções de simulação, structs e UNKs |
| Engine Overview | `docs/engine_overview.md` | Arquitetura do game loop e pipeline gráfico |
| Formato de Save | `docs/save_format.md` | Mapeamento byte-a-byte com validação de checksum |
| Análise de RNG | `docs/rng_analysis.md` | Algoritmo formal + script de replicação |
| Fórmulas de Física | `docs/simulation.md` | Cálculos de colisão, atributos e inteligência artificial |
| Tabelas Estruturadas | `resources/data_tables/` | CSVS/JSONs com dados limpos extraídos |
| Specs de Implementação | `docs/specs/sdd_*.md` | Especificações para recriar o jogo em engine moderna |
| Suíte de Paridade | `docs/specs/parity_*.md` | Casos de teste automatizados de paridade bit/behavior |

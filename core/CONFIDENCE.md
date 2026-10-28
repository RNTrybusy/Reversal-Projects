# Escala de Confiança

Toda afirmação sobre código revertido DEVE carregar um marcador de confiança.

## Níveis

| Marcador | Nível | Critério | Exemplo |
|----------|-------|----------|---------|
| 🟢 | **CONFIRMADO** | Verificado por evidência direta: teste, execução, hex match, referência cruzada com docs oficiais | "Offset 0x1A4 contém o checksum CRC32 — validado com script `verify_save.py`" |
| 🟡 | **INFERIDO** | Deduzido por padrões, nomes de variáveis, comportamento observado, mas sem prova definitiva | "Campo parece ser timestamp Unix — nome sugere `lastModified` mas formato não confirmado" |
| 🔴 | **LACUNA** | Desconhecido ou contraditório; requer investigação adicional | "Função em 0x8400 chamada frequentemente mas propósito não identificado" |

## Regras

1. **Padrão é 🔴** — tudo começa como lacuna até que evidência mude o status
2. **Promoção exige evidência** — de 🔴→🟡 basta um padrão; de 🟡→🟢 exige prova
3. **Rebaixamento é livre** — se nova evidência contradiz, rebaixe imediatamente
4. **Nunca omitir** — se não tem marcador, é um bug no documento
5. **Contexto junto** — sempre inclua 1 frase de justificativa após o marcador

## Uso em documentos

```markdown
### Campo `player_rating` (offset 0x2C)

🟢 Inteiro 16-bit little-endian representando rating do jogador (0–9999).
   Validado: alteração no hex editor refletiu corretamente no jogo.

### Campo `unknown_0x30` (offset 0x30)

🟡 Possivelmente flag de lesão — valor muda quando jogador se machuca,
   mas também muda em outras situações não identificadas.

### Bloco 0x40–0x5F

🔴 32 bytes de propósito desconhecido. Não correlacionam com nenhum
   comportamento observável no jogo.
```

## Métricas de Cobertura

Ao final de cada fase, calcular:

- **Cobertura** = (🟢 + 🟡) / total de itens documentados
- **Certeza** = 🟢 / (🟢 + 🟡 + 🔴)
- **Meta por fase:** Fase 1 ≥30% cobertura, Fase 2 ≥60%, Fase 3 ≥80%, Fase 4 ≥90%

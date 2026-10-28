# Documento Soul: Extração da Alma do Produto (Soul Engine)

> **Origem:** Destilação conceitual do **Reversa**.
> **Propósito:** Capturar a essência irredutível, as invariantes inegociáveis e a "fórmula secreta" de um software legado em um único documento de alta densidade cognitiva.

---

## 1. O que é a "Alma" (Soul) de um Software?

Todo software que sobreviveu ao tempo possui um núcleo de valor que o tornou único para seus usuários:
- No `cm14`, é a precisão e emoção matemática das 50 temporadas históricas de Fórmula 1 e sua simulação de corrida corrida-a-corrida.
- No `rfm2013` ou `brasfoot`, é a agilidade do loop de transferências, o balanceamento de atributos e a simulação de partidas instantânea.
- No `amt_mp3player`, é a estabilidade do protocolo de comunicação de baixo nível com o dispositivo físico.

Muitas vezes, desenvolvedores perdem meses tentando reescrever código legado e acabam destruindo o feeling original porque recriaram a parte errada.

O **Soul Document** (`soul.md`) impede isso. Ele é gerado preferencialmente no final da Fase 2 (Interpretação) ou início da Fase 3 (Estruturação).

---

## 2. Estrutura Canônica de um `soul.md`

Todo `soul.md` deve ter no máximo 2 páginas (ou ~80-120 linhas), contendo exatamente 5 seções:

```markdown
# Soul: {Nome do Produto}

## 1. A Proposta de Valor Fundamental
O que este software faz de forma tão satisfatória ou necessária que justifica sua reversão/reconstrução? Qual é a experiência central do usuário?

## 2. A "Fórmula Secreta" (Core Mechanics)
Quais são os 2 ou 3 algoritmos ou fluxos vitais dos quais todo o resto depende?
- Ex: O cálculo de ultrapassagem baseado em RNG determinístico.
- Ex: O algoritmo de compactação proprietário do banco de dados de jogadores.

## 3. Invariantes Inegociáveis (O que NUNCA pode quebrar)
Regras absolutas que o novo produto deve respeitar sob qualquer circunstância:
- INV-01: A compatibilidade de leitura com arquivos de save legados deve ser mantida.
- INV-02: O resultado da simulação para a mesma seed de entrada deve ser determinístico.
- INV-03: O tempo de resposta de cálculo de uma rodada não pode exceder 50ms.

## 4. O Débito Técnico & O que Pode Ser Descartado (Discard Log)
O que é lixo histórico e acidental que NÃO deve ser replicado na reconstrução:
- UI arcaica amarrada a resolução fixa de 800x600.
- Mecanismo obsoleto de proteção anticópia ou checagem de CD-ROM.
- Código de suporte a impressoras paralelas LPT1 ou Windows 98.

## 5. Diretriz de Futuro
Se fossemos reconstruir este produto hoje, qual seria a stack ideal e qual a premissa de design moderno?
```

---

## 3. Economia de Tokens com o `soul.md`

Ao iniciar uma nova sessão ou delegar uma tarefa de implementação a um modelo de IA:
- **Ao invés de:** Enviar dezenas de arquivos de código decompilado (gastando 50.000+ tokens e gerando confusão).
- **Faça isto:** Envie o `HANDOFF.md` + o `soul.md` + a especificação do componente específico (`sdd_spec.md`). O modelo entenderá o contexto completo gastando menos de 2.000 tokens com assertividade cirúrgica.

# ADR-{NUMERO}: {TITULO_DA_DECISAO_RETROATIVA}

> **Status:** 🟢 CONFIRMADO / 🟡 INFERIDO  
> **Data de Descoberta:** {DATA}  
> **Contexto Histórico:** {SISTEMA_ORIGINAL} ({ANO_OU_VERSAO_ESTIMADA})

---

## 1. Contexto & Problema Encontrado no Código

Qual problema os autores originais do software estavam tentando resolver quando escreveram este trecho?
- `{Descrever o cenário, limitações da época, hardware ou restrições}`

## 2. Decisão Arquitetural Identificada

Qual abordagem foi adotada pelo software legado?
- `{Descrever a solução encontrada no código/binário}`

Exemplos típicos:
- *"Os autores usaram aritmética de ponto fixo 24.8 porque a plataforma alvo não possuía coprocessador matemático (FPU)."*
- *"Todas as entidades foram salvas em uma única struct plana sequencial para gravação direta via fwrite."*

## 3. Evidência Técnica Suportando a Descoberta

- **Offset / Arquivo:** `{local_no_codigo}`
- **Fragmento de Código ou Desmontagem:**
```c
// Trecho relevante observado
```

## 4. Consequências & Lições para o Novo Produto

- **O que herdamos:** `{comportamento que devemos preservar}`
- **O que modernizamos:** `{como essa decisão deve ser adaptada em stack moderna, ex: substituir ponto fixo por double ou float IEEE-754}`

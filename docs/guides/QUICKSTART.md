# Como iniciar um novo projeto de RE

## Passo a passo

### 1. Obter o original
Colocar o binário/APK/ROM em `Software Origin/`. **Nunca modificar.**

### 2. Criar pasta de trabalho
```powershell
$nome = "meu_projeto"
New-Item -ItemType Directory -Path "E:\Reverse Engineering Anything\${nome}_decompiled"
```

### 3. Executar Triagem (Fase 0)
Abrir o original com ferramenta apropriada e responder:
- Que plataforma? (Win32, .NET, Android, SNES, etc.)
- Que linguagem/compilador?
- Tem obfuscação?
- É legacy system, game, app ou documentation?

### 4. Copiar templates
```powershell
$nome = "meu_projeto"
$base = "E:\Reverse Engineering Anything"
Copy-Item "$base\Reversal Projects\templates\HANDOFF_TEMPLATE.md" "$base\${nome}_decompiled\HANDOFF.md"
Copy-Item "$base\Reversal Projects\templates\state.json" "$base\${nome}_decompiled\state.json"
```

### 5. Preencher HANDOFF.md
Substituir os placeholders `{...}` com informação real do projeto.

### 6. Seguir o pipeline
Abrir o `PROFILE.md` do perfil selecionado e seguir os checklists:
- `Reversal Projects/profiles/legacy-system/PROFILE.md`
- `Reversal Projects/profiles/game/PROFILE.md`
- `Reversal Projects/profiles/app/PROFILE.md`
- `Reversal Projects/profiles/documentation/PROFILE.md`

### 7. Atualizar state.json
A cada transição de fase, atualizar o `state.json` com a fase atual e métricas.

### 8. Validar e fechar
Na Fase 4, validar tudo e tomar a decisão final (manter, migrar, portar, arquivar).

---

## Dica: economia de tokens
Ao retomar um projeto com agente AI:
1. Pedir para ler `HANDOFF.md` primeiro
2. Só ler docs temáticos quando necessário
3. Nunca pedir para "analisar todo o código" — ser específico
4. Usar scripts de resumo em vez de inspeção manual

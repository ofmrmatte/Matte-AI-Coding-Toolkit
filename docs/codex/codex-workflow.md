# Codex workflow

Este documento descreve o uso de referência do Matte AI Coding Toolkit com Codex.

## 1. Comece pelo repositório, não pelo prompt

Antes de pedir implementação, garanta que o projeto tenha instruções persistentes em `AGENTS.md` e, quando útil, `PROJECT.md`, `ARCHITECTURE.md`, `DECISIONS.md` e `TODO.md`.

O prompt da tarefa deve complementar esse contexto — não duplicá-lo inteiro.

## 2. Primeiro turno útil

Para tarefas relevantes, o Codex deve primeiro:

1. ler instruções;
2. inspecionar a estrutura do repositório;
3. localizar a implementação atual;
4. identificar comandos de verificação;
5. resumir riscos e critérios de aceite;
6. iniciar implementação apenas depois disso.

## 3. Escopo de autonomia

O Codex pode resolver ambiguidades de baixo risco usando o próprio repositório como fonte de verdade.

Perguntas são necessárias quando uma decisão:

- muda regra de negócio sem evidência;
- envolve perda de dados;
- envolve credencial ou autorização inexistente;
- cria custo relevante;
- publica ou executa uma ação externa irreversível;
- tem duas interpretações materialmente diferentes que o código não resolve.

## 4. Ferramentas

Use a ferramenta mais próxima da fonte de verdade:

- Git/GitHub para histórico e mudanças de código;
- banco/console oficial para estado de dados;
- browser automation para comportamento visual/real;
- documentação oficial para APIs atuais;
- shell para build, lint e testes.

Não copie manualmente informação que uma ferramenta confiável pode consultar de forma direta.

## 5. Trabalho longo

Em tarefas longas, mantenha o usuário informado com atualizações curtas em marcos úteis, por exemplo:

- problema reproduzido;
- causa raiz identificada;
- primeira etapa funcional;
- quality gate encontrado/falhando;
- revisão concluída.

Evite narrar cada comando.

## 6. Subagentes

Use subagentes para reduzir carga cognitiva e aumentar independência de revisão.

Boas fronteiras:

```text
principal: coordenação + decisões
agente 1: investigação do bug
agente 2: testes/regressão
agente 3: revisão final
```

Fronteira ruim:

```text
agente 1: editar componente.tsx
agente 2: editar o mesmo componente.tsx
```

## 7. Evidência

Quando houver ferramenta para testar o resultado, use-a.

Exemplos:

- UI: screenshot/render real;
- API: request real ou teste de integração;
- build: comando de produção;
- migração: banco de teste ou dry-run suportado;
- automação: fluxo controlado em sandbox/dry-run antes de produção.

## 8. Encerramento

O Codex deve diferenciar:

- implementação concluída;
- validação concluída;
- publicação concluída.

São três fatos diferentes.

Uma tarefa de código pode estar `DONE` sem estar publicada. Uma tarefa que pede publicação só está `DONE` quando a publicação e o smoke test correspondente forem confirmados.

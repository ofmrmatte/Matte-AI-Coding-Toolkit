# Como eu uso o toolkit com Codex

A parte importante acontece antes do prompt: o repositório precisa carregar as regras e o contexto que não podem depender da memória da sessão.

Por isso, em projeto que já tem alguma complexidade, eu prefiro deixar `AGENTS.md` na raiz e só adicionar `PROJECT.md`, `ARCHITECTURE.md` ou `DECISIONS.md` quando existe informação que realmente precisa sobreviver.

O prompt da tarefa então pode ser curto. Ele diz o objetivo; o repositório diz como trabalhar.

## Primeira passada: olhar antes de editar

Em tarefa relevante, a primeira resposta útil do Codex não é um patch. É uma leitura do estado atual.

Quero que ele descubra:

```text
onde a funcionalidade começa
quais módulos entram no caminho
quais scripts verificam o projeto
quais riscos estão perto da mudança
qual comportamento precisa continuar intacto
```

Depois disso, a implementação fica muito menos dependente de chute.

## Quando deixar o Codex decidir sozinho

Ambiguidade pequena pode ser resolvida olhando o próprio código.

Se existem três componentes que já seguem o mesmo padrão e a quarta tela precisa de comportamento equivalente, não faz sentido interromper a tarefa para perguntar qual convenção usar.

Eu paro para decidir com o operador quando a escolha muda regra de negócio, pode perder dados, cria custo relevante, precisa de credencial que não existe ou dispara uma ação externa difícil de desfazer.

## Ferramentas

Uso a fonte mais próxima do fato que quero verificar.

- código e Git para implementação e histórico;
- shell para testes e build;
- navegador para comportamento de UI;
- documentação atual para API que muda com versão;
- conectores/MCP para estado que vive fora do repositório.

Os guias de [MCP](mcp.md), [subagentes](agents.md) e [documentação/contexto](../tools/03-context-and-docs.md) entram quando a tarefa realmente precisa deles.

## Tarefa longa

Em trabalho longo, prefiro atualizações quando alguma coisa muda o entendimento ou reduz risco:

```text
bug reproduzido
causa encontrada
primeira parte funcionando
gate importante falhando
revisão terminou
```

Narrar cada `grep`, `cat` e `npm test` só ocupa espaço.

## Separar três fatos

No final, eu quero saber separadamente se:

1. o código foi implementado;
2. o comportamento foi validado;
3. a mudança foi publicada, quando publicação fazia parte do pedido.

Essas coisas podem acontecer na mesma sessão, mas não são o mesmo estado.

Um build local verde não prova deploy. Um deploy concluído não prova que a aplicação está saudável. E uma alteração de UI compilada não prova que o layout ficou certo.

Essa distinção simples evita muito "pronto" prematuro.
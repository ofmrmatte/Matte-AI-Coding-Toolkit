# Agentes no fluxo com Codex

O guia geral de decomposição e ondas está em [`../tools/07-subagent-orchestration.md`](../tools/07-subagent-orchestration.md). Aqui ficam só as decisões que costumo aplicar quando o agente principal está coordenando uma tarefa no Codex.

## Use o agente principal para manter a linha da decisão

Quando a tarefa é grande, o agente principal deve continuar responsável por:

- entender o pedido completo;
- escolher a fronteira entre tarefas;
- consolidar findings conflitantes;
- decidir a implementação final;
- rodar os gates integrados;
- revisar o resultado como um todo.

Delegar não significa distribuir a responsabilidade pela arquitetura sem dono.

## O melhor primeiro uso de subagente costuma ser investigação

Antes de sair paralelizando implementação, use agentes separados para levantar fatos que podem ser reunidos depois.

Exemplos:

```text
investigar causa de um bug sem editar
mapear testes existentes
auditar segurança de uma mudança pronta
revisar comportamento responsivo
ler documentação de uma integração específica
```

Essas tarefas têm saída clara e não criam conflito de branch ou arquivo.

## Passe contexto suficiente, não a sessão inteira

Uma delegação deve carregar o objetivo, a área permitida e o que precisa voltar. Não precisa copiar todo o histórico da conversa.

Exemplo:

```text
Investigue por que o filtro anual mistura Q1 e Q2.
Não edite código.
Siga o fluxo da UI até a query/agregação.
Retorne causa provável, arquivos envolvidos e testes que reproduzem.
```

## Revisão separada vale mais que duplicar implementação

Se há orçamento para um segundo agente, eu prefiro usá-lo depois da implementação para revisar o diff e os critérios de aceite.

Dois agentes construindo soluções concorrentes para o mesmo arquivo quase sempre aumentam o trabalho de integração.

## Regra prática

Se você não consegue escrever em uma frase o que um subagente pode fazer sem depender de uma decisão ainda aberta, a tarefa ainda não está pronta para delegação.
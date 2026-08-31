# Visão geral

Este toolkit nasceu de um problema simples: agentes de código conseguem produzir muita coisa rápido, mas isso não significa que entendem o projeto, preservam o que já funciona ou testam o que realmente importa.

Depois de algumas sessões longas, os mesmos problemas costumam aparecer: requisito que some no caminho, refactor que ninguém pediu, bug "corrigido" sem reprodução, interface aprovada sem abrir o navegador, decisão importante presa no chat e release feita a partir de um build que ninguém consegue rastrear depois.

A proposta deste repositório é colocar algumas dessas regras fora da conversa e dentro do projeto.

## O que fica no repositório

`AGENTS.md` contém regras de trabalho. É onde ficam coisas como "não enfraquecer teste para passar CI" e "não declarar bug corrigido sem validar o comportamento".

Os arquivos `PROJECT.md`, `ARCHITECTURE.md`, `DECISIONS.md` e `TODO.md` existem para projetos que precisam carregar contexto por várias sessões. Eles não são obrigatórios. Um script pequeno não precisa virar uma empresa de documentação.

Os workflows em `docs/workflows/` separam situações que pedem cuidados diferentes. Em projeto novo dá para escolher fundação. Em projeto existente, a primeira obrigação é entender o que já existe. Em bug, reproduzir vale mais do que planejar arquitetura. Em UI, abrir a interface é parte do teste.

Os prompts em `prompts/` são atalhos. Não quero que eles carreguem toda a inteligência do processo; essa parte deve estar nas regras e no próprio repositório, onde pode ser revisada e versionada.

## Como penso uma tarefa maior

Normalmente o caminho é este:

```text
pedido
-> inspeção do projeto
-> comportamento atual
-> mudança desejada
-> implementação
-> validação
-> revisão do diff
-> atualização de contexto, se necessário
```

Em uma tarefa pequena, várias dessas etapas cabem em poucos minutos e nem precisam virar documento. Em uma mudança arriscada, cada uma pode precisar de evidência própria.

A diferença importante é não pular direto de "entendi mais ou menos" para "comecei a editar".

## Codex-first, não Codex-only

Uso Codex como referência porque ele trabalha bem com instruções no repositório, Git, shell e ferramentas conectadas. Mas os arquivos daqui não dependem de um recurso exclusivo do Codex.

Se outro agente consegue ler contexto local, executar o projeto e respeitar as regras, ele pode usar o mesmo material.

Evito documentar comportamento de produto que muda toda semana. Quando uma tarefa depende de API ou recurso atual de uma ferramenta, a regra é consultar a documentação atual em vez de confiar na memória do agente.

## Simplicidade

"Mais simples" não significa "menos seguro".

Uma solução é mais simples quando cumpre o requisito com menos peças para manter, sem empurrar o problema para outro lugar.

Antes de adicionar serviço, fila, banco, abstração ou dependência, vale responder:

- já existe algo no projeto que resolve isso?
- a nova peça atende um requisito de agora ou um cenário imaginado?
- ela melhora o caminho de falha ou só o caminho feliz?
- se der errado, consigo voltar?

Às vezes a resposta correta é adicionar infraestrutura. Às vezes é uma função de vinte linhas. O toolkit não tenta escolher antes de olhar o caso.

## Quando uma tarefa termina

Eu evito usar apenas "done" porque ele esconde estados diferentes.

Uma entrega pode estar concluída, pode ter uma parte útil pronta com limitação conhecida, pode estar bloqueada por algo externo ou pode simplesmente ter falhado nos critérios.

O relatório final precisa deixar isso evidente. Se o E2E não rodou porque faltou ambiente, escreva isso. Se o build passou, mas a UI não foi aberta, não chame de validação visual.

Essa transparência é mais útil do que um status otimista.
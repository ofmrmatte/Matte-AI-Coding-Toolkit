# MCP sem virar coleção de plugin

MCP é útil quando coloca uma fonte ou ferramenta real dentro do fluxo do agente: banco, documentação, navegador, GitHub, design, deploy, observabilidade. O erro comum é instalar tudo que parece interessante e depois carregar contexto demais para tarefas simples.

A pergunta correta não é "qual MCP está faltando?". É "qual acesso externo reduz uma etapa manual ou uma fonte de erro desta tarefa?".

## Bons usos

Um MCP faz sentido quando o agente precisa consultar ou agir em algo que não está no repositório.

Exemplos:

- ler schema e dados de um banco de homologação;
- consultar documentação versionada;
- revisar uma tela no navegador;
- abrir issue ou PR;
- inspecionar logs de deploy;
- comparar design e implementação;
- verificar estado de infraestrutura.

## Quando não usar

Se a resposta está no código local, abra o código local.

Não consulte uma ferramenta externa para descobrir algo que `rg`, testes ou configuração do projeto resolvem mais rápido e com mais precisão.

Também evite usar MCP como forma de esconder falta de entendimento. A ferramenta traz dados; ela não substitui a decisão técnica.

## Menor conjunto útil

Para a maioria dos projetos, eu começaria com três categorias:

1. repositório e colaboração;
2. documentação/contexto;
3. ambiente real de validação.

Depois adicione banco, deploy, design ou observabilidade quando houver uma necessidade concreta.

## Credenciais e escopo

Prefira credenciais com o menor acesso necessário. Um agente que só precisa consultar produção não precisa de permissão de escrita.

Antes de qualquer ação destrutiva ou difícil de reverter:

- confirme ambiente;
- confira alvo;
- verifique se existe backup/rollback;
- não presuma que uma ferramenta conectada aponta para homologação.

Nome de conexão não é garantia de ambiente.

## Fonte externa versus fonte local

Quando existir conflito, entenda qual fonte é autoritativa.

Exemplo:

```text
migration local diz que coluna existe
banco de produção diz que não existe
```

A conclusão não é escolher uma das duas. É descobrir por que o estado divergiu antes de aplicar nova migração.

## Documente dependências realmente necessárias

Se o projeto depende de um MCP para uma rotina recorrente, registre isso no setup ou em `AGENTS.md`.

Se foi usado uma vez para uma investigação, não precisa virar requisito do projeto.

O objetivo é um ambiente de desenvolvimento que continue compreensível para quem não tem exatamente a mesma coleção de integrações instalada.

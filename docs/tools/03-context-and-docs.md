# Context, documentação e fonte de verdade

Agente de código erra bastante quando trabalha com uma lembrança aproximada de uma biblioteca. O problema fica pior em stacks que mudam rápido: framework, SDK, CLI, provedor de deploy, autenticação e infraestrutura.

A regra aqui é simples: quando a resposta depende de comportamento atual de uma ferramenta, consulte a documentação atual antes de decidir a implementação.

Isso pode ser feito por documentação oficial, Context7, MCP de documentação ou outra fonte confiável disponível no ambiente. A ferramenta importa menos do que a disciplina.

## Quando consultar

Vale consultar antes de implementar quando houver:

- API ou opção de configuração que pode ter mudado;
- versão nova de framework;
- método marcado como deprecated;
- erro de integração sem causa clara;
- dúvida entre duas APIs parecidas;
- comportamento de autenticação, segurança ou deploy;
- recurso específico de uma versão.

Não é necessário abrir documentação para lembrar como funciona um `Array.map`.

## Procure a fonte certa

Ordem de preferência:

1. documentação oficial;
2. código ou tipos da versão instalada;
3. changelog/release notes;
4. issue oficial quando o comportamento é um bug conhecido;
5. discussões de comunidade como complemento.

Blog antigo e resposta de fórum sem versão devem ser tratados como pista, não como contrato.

## Leia a versão do projeto

Antes de pesquisar "como usar X", veja qual versão de X o projeto realmente usa.

Exemplo:

```text
package.json -> next 16.x
lockfile -> versão resolvida
config -> App Router
```

A busca então precisa responder ao cenário real, e não a um tutorial genérico de três versões atrás.

## Context7 e ferramentas equivalentes

Quando houver uma ferramenta que injeta documentação diretamente no contexto do agente, use-a para reduzir pesquisa manual e evitar API inventada.

Mas não transforme isso em reflexo automático. Para uma mudança simples dentro do próprio repositório, o código local costuma ser uma fonte melhor do que documentação externa.

## Registre o que virou decisão

Não copie páginas de documentação para dentro do projeto. Registre só a consequência durável.

Exemplo em `DECISIONS.md`:

```text
2026-08-31 - Mantemos o worker separado do processo web porque o runtime
serverless usado no deploy não oferece processo persistente para jobs locais.
```

Isso explica a decisão sem duplicar documentação que ficará desatualizada.

## Para agentes

Se você precisou inferir um comportamento externo e essa inferência afeta a implementação, verifique. Se não conseguiu verificar, deixe a incerteza explícita em vez de transformá-la em fato.

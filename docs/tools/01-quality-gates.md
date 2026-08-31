# Quality gates sem teatro

Quality gate não é uma lista fixa de comandos que todo projeto precisa ter. É um conjunto de verificações que impede uma mudança de avançar quando ela quebra algo que o time considera importante.

O primeiro passo é descobrir o que o projeto já usa. Leia `package.json`, arquivos de CI, Makefile, scripts PowerShell, documentação de release e o histórico recente. Só depois defina o que realmente deve bloquear uma entrega.

## Um baseline razoável

Para uma aplicação TypeScript comum, eu costumo começar assim:

```text
lint -> typecheck -> tests -> build
```

Se existe fluxo crítico de interface ou integração externa, entra um smoke test depois do build. Se existe migração de banco, entra validação de migração e rollback antes do smoke test.

O ponto não é ter seis etapas. O ponto é saber qual risco cada etapa cobre.

| Gate | O que tenta pegar |
| --- | --- |
| lint | erros estáticos, padrões proibidos, imports inválidos |
| typecheck | contratos quebrados entre módulos |
| unit tests | regras isoladas |
| integration tests | interação entre camadas |
| build | problemas que só aparecem no empacotamento |
| smoke/E2E | fluxo real do usuário ou operador |

## PASS, FAIL e NOT RUN

O agente deve reportar cada gate como `PASS`, `FAIL` ou `NOT RUN`.

`NOT RUN` não é vergonha. Às vezes um E2E depende de credencial ou ambiente que não existe na sessão. O problema é dizer que está tudo certo sem mencionar que a verificação nunca aconteceu.

Exemplo de relatório útil:

```text
lint: PASS
unit tests: PASS (84 testes)
build: PASS
E2E: NOT RUN - ambiente de homologação indisponível
```

Exemplo ruim:

```text
Tudo validado e pronto para produção.
```

## Warning não é erro, mas também não some sozinho

Não converta todos os warnings em erro de uma vez em um projeto antigo. Isso costuma produzir uma PR enorme que mistura saneamento com funcionalidade.

Faça o contrário:

1. meça o baseline atual;
2. impeça novos warnings nas áreas tocadas;
3. reduza o estoque em lotes pequenos;
4. promova a regra para erro quando o baseline chegar a zero.

Essa abordagem deixa a migração rastreável e evita que o time simplesmente desative a regra para conseguir trabalhar.

## Quando um gate não deve bloquear

Nem toda checagem precisa ser obrigatória. Um benchmark de performance, por exemplo, pode ser informativo até existir um limite confiável e pouco ruidoso.

Um gate só deve bloquear quando:

- o sinal é estável;
- existe uma ação clara quando ele falha;
- o custo de falso positivo é aceitável;
- o projeto consegue executar a checagem de forma repetível.

Se uma verificação falha de forma aleatória, corrija a verificação antes de transformá-la em política.

## Regra para agentes

Nunca enfraqueça lint, tipos, testes ou validações apenas para produzir um build verde. Se a regra está errada, explique por quê e altere a regra em uma mudança explícita. Se o código está errado, corrija o código.

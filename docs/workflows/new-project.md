# Workflow — projeto novo

Use este fluxo quando o repositório ainda não possui uma implementação relevante.

## 1. Defina o produto antes da stack

Preencha `PROJECT.md` com:

- problema;
- usuário;
- resultado esperado;
- escopo do MVP;
- fora de escopo;
- restrições;
- critérios de aceite.

Não escolha banco, framework, fila ou arquitetura antes de saber o que o sistema precisa fazer.

## 2. Escolha a arquitetura mínima

Registre em `ARCHITECTURE.md`:

- componentes necessários agora;
- fluxo de dados;
- persistência;
- integrações externas;
- autenticação/autorização;
- deployment;
- riscos.

Prefira monólito modular até existir uma razão concreta para distribuição.

## 3. Crie um esqueleto verificável

A primeira entrega deve provar:

- projeto sobe;
- configuração funciona;
- build funciona;
- caminho principal mínimo executa;
- testes e lint estão conectados.

## 4. Implemente por fatias verticais

Prefira:

```text
UI + regra + persistência + teste de um fluxo
```

antes de:

```text
toda UI → todo backend → todo banco → integração final
```

Fatias verticais expõem erros de arquitetura cedo.

## 5. Gate de MVP

O MVP só está pronto quando os fluxos críticos possuem evidência, não quando todas as pastas planejadas existem.

## 6. Antes da primeira produção

Use `production-release.md` e confirme observabilidade, rollback, dados reais e configuração do ambiente.

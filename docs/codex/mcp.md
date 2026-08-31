# MCP e ferramentas conectadas

MCPs, conectores e APIs ampliam o que o agente consegue observar e executar. Eles também ampliam a superfície de erro e de impacto.

## Regra principal

Use uma integração quando ela aproxima o agente da fonte de verdade ou elimina uma etapa manual relevante.

Não instale uma ferramenta apenas porque ela existe.

## Classes de ferramenta

### Leitura

Exemplos: documentação, repositórios, logs, métricas, banco em modo read-only.

Risco normalmente menor, mas ainda pode haver dados sensíveis.

### Escrita reversível

Exemplos: criar branch, abrir PR, criar draft, alterar configuração com rollback simples.

Exige validação do alvo e registro do resultado.

### Escrita de alto impacto

Exemplos: produção, banco com dados reais, deploy, exclusão, envio de mensagens, mudanças de infraestrutura.

Exige escopo explícito, confirmação quando aplicável, rollback e smoke check.

## Checklist antes de conectar

1. Qual problema concreto a ferramenta resolve?
2. Qual é o menor conjunto de permissões necessário?
3. O agente precisa escrever ou apenas ler?
4. Qual ambiente será acessado?
5. Há ação irreversível?
6. Como auditar o que foi feito?
7. Como revogar a credencial?

## Fonte de verdade

Quando uma integração oficial está disponível, prefira consultar o estado atual por ela em vez de depender de documentação local potencialmente desatualizada.

Exemplos:

- GitHub para PRs e branches reais;
- provedor de deploy para status do deployment;
- banco para schema atual;
- documentação oficial para limites de API;
- navegador real para comportamento final da UI.

## Falha de ferramenta

Uma integração indisponível não deve bloquear trabalho que possa continuar com segurança.

Separe:

```text
trabalho independente da credencial → continuar
trabalho que exige a credencial → marcar bloqueio exato
```

Não invente resultado de uma operação externa que não pôde ser executada.

## Produção

Para ações de produção, registre no relatório:

- alvo;
- ação;
- resultado;
- identificador de deployment/commit quando houver;
- smoke test realizado;
- rollback disponível.

"Deploy executado" e "produção saudável" são afirmações diferentes.

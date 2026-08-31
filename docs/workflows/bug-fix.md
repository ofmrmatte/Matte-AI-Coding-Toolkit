# Workflow — correção de bug

A sequência é: **reproduzir → localizar → explicar → corrigir → provar → prevenir regressão**.

## 1. Reproduza

Antes de editar, obtenha um sinal confiável da falha:

- teste quebrando;
- erro de log;
- resposta de API incorreta;
- screenshot/estado visual;
- sequência de passos reproduzível.

Se não for possível reproduzir, registre exatamente qual evidência sustenta a hipótese.

## 2. Localize a camada

Determine se o defeito está em:

- UI;
- estado do cliente;
- regra de negócio;
- API;
- persistência;
- integração externa;
- configuração;
- ambiente.

Evite corrigir a camada que apenas exibe o erro se a causa estiver abaixo dela.

## 3. Explique a causa raiz

Uma causa raiz deve responder por que o sistema entrou naquele estado e por que os controles existentes não impediram isso.

## 4. Corrija de forma estreita

Mude o menor conjunto de regras necessário. Não aproveite o bug para reescrever módulos não relacionados.

## 5. Adicione regressão

Quando viável, transforme a reprodução em teste automatizado.

## 6. Valide

Confirme:

- falha original não ocorre;
- cenário nominal continua funcionando;
- estados de erro próximos continuam corretos;
- quality gates passam.

## 7. Relate

O relatório deve distinguir:

- sintoma;
- causa;
- correção;
- teste de regressão;
- risco residual.

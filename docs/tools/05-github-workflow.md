# GitHub como trilha de trabalho

GitHub aqui não serve só para guardar código. Ele é a trilha que permite entender o que mudou, por que mudou e em qual estado a mudança está.

Isso fica mais importante quando agentes participam do desenvolvimento, porque uma sessão pode produzir muita alteração em pouco tempo. Sem commits e diffs legíveis, revisão vira adivinhação.

## Commits pequenos o suficiente para revisar

Não existe número mágico de linhas. O critério é: o commit consegue contar uma história coerente?

Exemplos bons:

```text
fix: preserve filters when changing billing period

test: cover annual period fallback

docs: explain period normalization rules
```

Exemplo ruim:

```text
feat: update system
```

Um commit pode ser grande quando a mudança é naturalmente indivisível, mas não deve misturar refactor, bug fix, formatação e alteração funcional sem necessidade.

## Antes de abrir PR

Revise o diff como se você não tivesse escrito o código.

Procure por:

- arquivos alterados sem relação com a tarefa;
- debug esquecido;
- segredo ou dado local;
- teste removido;
- regra enfraquecida;
- rename que mascara mudança funcional;
- dependência nova sem uso claro;
- alteração de lockfile inesperada.

Essa revisão pega problemas que os testes não enxergam.

## PR como resumo verificável

Uma boa descrição de PR não repete o diff linha por linha. Ela responde:

- qual problema motivou a mudança;
- o que foi alterado em termos de comportamento;
- como foi validado;
- o que ficou fora do escopo;
- se existe risco de deploy ou migração.

Modelo curto:

```text
Problema
Ao trocar a quinzena, o filtro de mês era descartado.

Mudança
A normalização do período agora mantém mês e quinzena como dimensões independentes.

Validação
- unit tests: PASS
- build: PASS
- fluxo manual jan/Q1, jan/Q2 e anual: PASS

Fora do escopo
Não altera o parser de arquivos antigos.
```

## Branches

Use branch quando ela ajuda a isolar revisão ou risco. Para manutenção pequena em repositório individual, trabalhar direto na branch principal pode ser aceitável se houver histórico claro e possibilidade de rollback.

O toolkit não impõe GitFlow. Processo deve resolver um problema real do projeto, não criar cerimônia.

## Agentes e Git

Agente não deve fazer commit destrutivo só para "limpar" o histórico. Antes de reset, force push, rebase amplo ou remoção em massa, confirme que a operação é necessária e que o estado pode ser recuperado.

Também não deve incluir no commit mudanças que já estavam no working tree e não pertencem à tarefa sem entender de onde vieram.

## Releases

Quando o projeto gera versões distribuídas, use tags ou releases para ligar artefato a commit. Um instalador ou pacote sem referência de origem dificulta suporte e rollback.

No mínimo, consiga responder:

```text
qual commit gerou este artefato?
quais mudanças entraram?
como voltar para a versão anterior?
```

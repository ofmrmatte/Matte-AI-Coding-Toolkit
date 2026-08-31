# Exemplo: dashboard web com filtro de período inconsistente

## Cenário

O dashboard já está em produção. O usuário escolhe um mês e depois uma quinzena. Em algumas combinações, a tela mostra dados anuais ou mistura períodos.

A tentação é abrir o componente do filtro e começar a mexer no estado. O workflow de projeto existente evita isso.

## 1. Primeiro, reproduza

Casos mínimos:

```text
Janeiro + Q1 -> deve mostrar somente primeira quinzena de janeiro
Janeiro + Q2 -> deve mostrar somente segunda quinzena de janeiro
Janeiro sem quinzena -> deve mostrar o mês inteiro
Q1 sem mês -> deve considerar Q1 ao longo do ano
Sem mês e sem quinzena -> visão anual
```

Se um desses casos não consegue ser reproduzido com dados conhecidos, não existe ainda uma base confiável para corrigir.

## 2. Mapeie o caminho do dado

Antes de editar, descubra:

```text
UI do filtro
-> estado/URL
-> normalização do período
-> query ou selector
-> agregação
-> cards/gráficos
```

O bug pode estar em qualquer etapa. Trocar o componente visual porque o erro aparece nele é tratar sintoma.

## 3. Critérios de aceite

- mês e quinzena continuam sendo dimensões independentes;
- limpar mês não limpa a quinzena sem necessidade;
- visão anual continua funcionando;
- links/bookmarks com filtros existentes continuam válidos, se o projeto usa URL state;
- nenhum período anterior deixa de aparecer;
- testes cobrem as combinações acima.

## 4. Implementação

Faça a menor mudança na camada que realmente mistura os estados. Se a regra está em uma função de normalização, prefira corrigir ali e manter a UI simples.

Evite uma segunda regra paralela só para fazer o gráfico "bater". Isso cria divergência entre tabela, cards e exportação.

## 5. Validação

Relatório de entrega esperado:

```text
reprodução anterior: confirmada
root cause: normalização tratava quinzena sem mês como estado inválido
unit tests: PASS
build: PASS
fluxos manuais: jan/Q1, jan/Q2, jan/all, annual/Q1, annual/all PASS
```

Esse tipo de evidência é mais útil do que listar todos os arquivos alterados.
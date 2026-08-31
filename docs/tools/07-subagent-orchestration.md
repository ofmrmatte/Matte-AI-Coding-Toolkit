# Subagentes: use quando houver fronteira clara

Mais agentes não significam mais velocidade. Em muita tarefa pequena, significam apenas mais contexto repetido, mais coordenação e uma revisão final pior.

Subagentes começam a valer a pena quando o trabalho pode ser separado em pedaços com entradas e saídas claras.

## Um exemplo que paraleliza bem

Suponha uma mudança grande em um dashboard:

```text
Agente A -> investiga regra de período e dados
Agente B -> revisa layout responsivo
Agente C -> mapeia cobertura de testes
```

Eles podem trabalhar ao mesmo tempo porque estão produzindo diagnósticos independentes.

Depois o agente principal consolida o resultado e decide a implementação.

## Um exemplo que paraleliza mal

```text
Agente A -> altera componente de filtro
Agente B -> altera o mesmo componente de filtro
Agente C -> refatora estado global usado pelos dois
```

Mesmo que cada um faça um trabalho bom isoladamente, a integração vira o problema principal.

## Ondas

Para trabalho grande, prefira ondas curtas.

```text
onda 1: investigação
onda 2: mudanças independentes
onda 3: integração
onda 4: revisão
```

Isso cria pontos de sincronização. Se a investigação mostrar que a arquitetura entendida no início estava errada, você corrige a direção antes de três agentes produzirem implementação em cima da premissa errada.

## Contrato de delegação

Uma tarefa delegada deve dizer:

- objetivo;
- escopo;
- arquivos ou área sob responsabilidade;
- o que não deve ser alterado;
- evidência esperada;
- formato de retorno.

Exemplo:

```text
Investigue por que o filtro anual mistura Q1/Q2.
Não altere código.
Mapeie parser, normalização e query do dashboard.
Retorne causa provável, arquivos envolvidos e testes que reproduzem o problema.
```

Isso costuma funcionar melhor do que "analise esse bug".

## Revisão independente

Uma das melhores aplicações de um segundo agente é revisar uma implementação pronta sem ter participado das decisões linha a linha.

Peça para procurar:

- regressão;
- caso limite;
- simplificação indevida;
- segurança;
- inconsistência de dados;
- teste que passa sem cobrir o comportamento;
- código morto ou duplicado.

O revisor não precisa reescrever a solução. Ele precisa encontrar evidência de que algo está errado ou incompleto.

## Quando ficar com um agente só

Use um agente só quando:

- a mudança é pequena e localizada;
- a maior parte do trabalho depende da mesma decisão;
- os arquivos são compartilhados demais;
- o custo de explicar o contexto é maior que o trabalho;
- a tarefa ainda está ambígua.

Primeiro reduza a ambiguidade. Paralelismo vem depois.

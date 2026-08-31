# Agentes e orquestração

Agentes adicionais são uma ferramenta de decomposição, não um fim em si mesmos.

## Quando usar

Use agentes especializados quando houver tarefas independentes com fronteiras claras, por exemplo:

- revisar uma migração sem editar a UI;
- revisar segurança depois da implementação;
- criar testes para um módulo já estabilizado;
- avaliar UX de telas existentes;
- mapear impacto de uma mudança arquitetural.

## Quando não usar

Evite múltiplos agentes quando:

- a tarefa é pequena;
- todos precisam editar os mesmos arquivos;
- a arquitetura ainda não foi decidida;
- o custo de coordenação supera o trabalho;
- há uma sequência rígida de dependências.

## Modelo de ondas

### Onda 0 — descoberta

O agente principal mapeia o problema e define fronteiras.

### Onda 1 — trabalho independente

Agentes recebem tarefas sem colisão de arquivo ou estado.

### Onda 2 — integração

O agente principal resolve dependências, integra resultados e executa gates.

### Onda 3 — revisão

Um agente independente revisa o resultado integrado.

## Contrato de tarefa para subagente

Toda delegação deve conter:

- objetivo;
- escopo permitido;
- arquivos ou módulos sob responsabilidade;
- comportamento que não pode mudar;
- saída esperada;
- como validar;
- se pode ou não editar código.

Exemplo:

```text
Objetivo: revisar o fluxo de autenticação para regressões.
Escopo: src/auth/** e testes relacionados.
Não editar código.
Verifique: estados de erro, sessão expirada, redirects e testes ausentes.
Retorne: findings classificados por severidade com arquivo/linha e justificativa.
```

## Regra de ownership

Um arquivo só deve ter um owner de implementação por onda.

Revisores podem ler o mesmo arquivo. Dois implementadores não devem alterá-lo em paralelo sem coordenação explícita.

## Revisão independente

Para mudanças importantes, o melhor uso de um segundo agente costuma ser revisão, não implementação paralela.

O revisor deve tentar provar que a mudança está errada, incompleta ou perigosa. Findings devem ser específicos e reproduzíveis.

Não aceite "LGTM" sem análise dos critérios de aceite e do diff.

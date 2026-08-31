# Visão geral

O Matte AI Coding Toolkit organiza desenvolvimento com agentes de IA como um processo de engenharia verificável.

## O problema

Agentes conseguem escrever código rapidamente, mas velocidade de geração não é igual a qualidade de entrega. Os modos de falha mais comuns são:

- começar a implementar antes de entender o sistema;
- alterar arquitetura sem necessidade;
- perder requisitos no meio de sessões longas;
- declarar sucesso depois de compilar;
- corrigir sintomas sem reproduzir o bug;
- executar trabalho paralelo que colide nos mesmos arquivos;
- deixar decisões importantes apenas no chat;
- publicar sem um gate de release explícito.

O toolkit trata esses problemas como falhas de processo, não como falhas de prompt.

## Modelo operacional

```text
Contexto persistente
      ↓
Entendimento do pedido
      ↓
Inspeção do sistema
      ↓
Critérios de aceite
      ↓
Plano executável
      ↓
Implementação controlada
      ↓
Quality gates
      ↓
Revisão independente
      ↓
Evidência
      ↓
Registro de decisões
```

## Cinco camadas

### 1. Governança

`AGENTS.md` define como o agente trabalha, quais comportamentos são proibidos e o que significa "concluído".

### 2. Contexto persistente

`PROJECT.md`, `ARCHITECTURE.md`, `DECISIONS.md` e `TODO.md` guardam o que precisa sobreviver à conversa atual.

### 3. Workflows

Cada tipo de tarefa tem riscos diferentes. Criar um projeto, corrigir um bug, refazer UI e publicar em produção não devem usar o mesmo roteiro.

### 4. Prompts operacionais

Prompts são usados como aceleradores para iniciar um workflow, não como substitutos do workflow.

### 5. Evidência

A saída final precisa dizer o que mudou e mostrar o que foi validado. `PASS`, `FAIL` e `NOT RUN` são melhores do que "parece estar funcionando".

## Codex-first

O toolkit prioriza agentes capazes de:

- ler instruções do repositório;
- inspecionar múltiplos arquivos;
- executar shell e testes;
- trabalhar com Git;
- usar ferramentas conectadas quando disponíveis;
- operar tarefas longas com planejamento e verificação.

O Codex é a experiência de referência. Nada impede o uso com outros agentes, desde que eles respeitem o mesmo contrato operacional.

## Regra de simplicidade

Simplicidade significa menor complexidade total para cumprir requisitos reais. Não significa remover validação, observabilidade ou testes.

Antes de criar uma abstração, serviço, banco, fila, microserviço ou dependência nova, pergunte:

1. O requisito atual realmente precisa disso?
2. O projeto já possui uma solução equivalente?
3. A nova peça reduz complexidade total ou apenas move a complexidade de lugar?
4. Existe rollback claro?

## Estado de conclusão

Uma tarefa pode terminar em quatro estados:

- `DONE` — critérios atendidos e evidenciados;
- `PARTIAL` — parte útil entregue, com lacunas explícitas;
- `BLOCKED` — impedimento externo específico comprovado;
- `FAILED` — tentativa não atingiu os critérios.

Evite transformar `PARTIAL` ou `BLOCKED` em `DONE` por linguagem otimista.

# Playbook — do pedido à entrega

Este é o caminho padrão para tarefas não triviais.

## Etapa 1 — Entender

Transforme o pedido em três blocos:

- **estado atual** — o que existe hoje;
- **estado desejado** — o que deve mudar;
- **restrições** — o que não pode quebrar ou ser alterado.

Se o pedido estiver claro o suficiente para trabalhar, não interrompa o fluxo com perguntas desnecessárias. Resolva ambiguidades de baixo risco por inspeção do repositório.

## Etapa 2 — Inspecionar

Antes de editar:

1. leia `AGENTS.md` e documentação relevante;
2. identifique stack, scripts, build e testes;
3. encontre o ponto de entrada da funcionalidade;
4. siga o fluxo até persistência, integrações e UI quando aplicável;
5. procure comportamento semelhante já implementado;
6. identifique riscos de regressão.

Saída esperada: um mapa curto do sistema e uma hipótese de mudança.

## Etapa 3 — Critérios de aceite

Escreva critérios observáveis.

Ruim:

> Melhorar o login.

Melhor:

> O formulário não deve gerar scroll em 390×844, deve manter campos acessíveis com teclado aberto e deve mostrar estado de carregamento após envio.

Um critério bom pode ser testado.

## Etapa 4 — Plano

Quebre o trabalho em unidades verificáveis. Cada unidade deve indicar:

- objetivo;
- arquivos/módulos;
- dependências;
- validação.

Evite planos que apenas repetem títulos como "frontend", "backend", "testes" sem dizer o que muda.

## Etapa 5 — Delegação

Use subagentes quando houver ganho real.

Exemplo:

```text
Agente principal
├── agente A: banco/migração
├── agente B: UI isolada
└── agente C: testes/revisão
```

Se A e B precisarem editar o mesmo arquivo central, não são trabalhos paralelos.

## Etapa 6 — Implementar

Durante a implementação:

- mantenha mudanças pequenas e coerentes;
- valide cedo os pontos de maior risco;
- não empilhe cinco hipóteses sem testar nenhuma;
- preserve contratos públicos a menos que a mudança de contrato seja parte do requisito;
- atualize o plano quando a realidade divergir da hipótese inicial.

## Etapa 7 — Verificar

Use os gates reais do projeto.

Tabela recomendada no relatório interno:

| Gate | Resultado | Evidência |
|---|---|---|
| Lint | PASS/FAIL/NOT RUN | comando/erro |
| Typecheck | PASS/FAIL/NOT RUN | comando/erro |
| Tests | PASS/FAIL/NOT RUN | quantidade/erro |
| Build | PASS/FAIL/NOT RUN | artefato/erro |
| Smoke/E2E | PASS/FAIL/NOT RUN | fluxo testado |
| Visual | PASS/FAIL/NOT RUN | viewport/tela |

`NOT RUN` exige motivo.

## Etapa 8 — Revisar

Faça uma leitura do diff como se tivesse sido escrito por outra pessoa.

Perguntas mínimas:

- resolve o requisito ou apenas parte dele?
- existe caminho quebrado não testado?
- houve aumento desnecessário de complexidade?
- algum erro foi escondido?
- algum dado pode ser perdido?
- faltou atualizar documentação?

Para mudanças relevantes, um agente/revisor independente é preferível.

## Etapa 9 — Entregar

O relatório final deve ser curto e factual:

1. o que mudou;
2. o que foi testado;
3. quais gates passaram;
4. limitações conhecidas;
5. próximos passos realmente necessários.

Não use quantidade de arquivos alterados como evidência de qualidade.

## Etapa 10 — Persistir aprendizado

Atualize `ARCHITECTURE.md` ou `DECISIONS.md` apenas se algo durável mudou.

Atualize `TODO.md` se restou trabalho concreto.

Não transforme documentação em log cronológico de cada comando executado.

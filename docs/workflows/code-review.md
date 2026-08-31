# Workflow — code review

Revisão deve procurar defeitos, não validar esforço.

## Ordem recomendada

1. entenda o requisito e critérios de aceite;
2. leia o diff;
3. siga os caminhos alterados no código completo;
4. confira testes existentes e novos;
5. procure efeitos colaterais;
6. execute gates relevantes quando possível;
7. classifique findings por severidade.

## Checklist

### Correção

- O código implementa o comportamento pedido?
- Estados extremos e erros estão tratados?
- Há race condition, duplicidade ou estado inconsistente?

### Dados

- Há risco de perda, corrupção ou incompatibilidade?
- Transações e idempotência são necessárias?
- Migrações são reversíveis ou seguras?

### Segurança

- Novas entradas são validadas?
- Autorização ocorre no limite correto?
- Secrets/logs podem vazar?

### Manutenção

- A mudança duplica regra existente?
- Introduz abstração desnecessária?
- Nomes e fronteiras continuam claros?

### Testes

- Testes provam o comportamento ou apenas executam linhas?
- Falta regressão para o bug corrigido?
- Há caminhos críticos sem cobertura prática?

## Severidade

- **P0** — perda de dados, comprometimento, indisponibilidade crítica imediata.
- **P1** — bug grave ou regressão provável que bloqueia merge/release.
- **P2** — problema relevante, mas com impacto limitado ou workaround.
- **P3** — melhoria não bloqueante.

Findings devem incluir localização, cenário de falha e razão. Evite comentários puramente estilísticos quando lint/formatter já governa o tema.

## Saída

Se não houver finding material, diga isso explicitamente e mencione riscos/testes que não puderam ser verificados.

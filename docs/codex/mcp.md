# MCP no fluxo com Codex

A estratégia geral está em [`../tools/06-mcp-strategy.md`](../tools/06-mcp-strategy.md). Neste arquivo ficam só algumas regras práticas para sessões de Codex com ferramentas conectadas.

## Prefira a ferramenta que já conhece o objeto

Se a tarefa é sobre uma PR, use GitHub. Se é sobre uma tela, use navegador. Se é sobre schema atual, consulte o banco ou a fonte oficial correspondente.

Isso reduz cópia manual e evita trabalhar com um estado que já mudou.

## Leia antes de escrever

Quando a ferramenta permite leitura e escrita, comece lendo o alvo real. Antes de atualizar arquivo, configuração, issue, deploy ou banco, confirme que você está olhando o recurso certo e no ambiente certo.

Para ações com impacto alto, o estado anterior também é parte do contexto de rollback.

## Não transforme indisponibilidade em bloqueio global

Se um conector falhar, separe o que depende dele do que não depende.

Exemplo:

```text
sem acesso ao deploy -> ainda dá para corrigir código, testar e gerar build
sem acesso ao banco real -> ainda dá para revisar migration e testar em banco local
```

Bloqueie apenas a etapa que realmente precisa da ferramenta.

## Permissões

Quando houver escolha, prefira leitura para investigação e escrita apenas para o que a tarefa precisa executar.

Uma conexão ampla com produção não é um atalho de desenvolvimento.

## Evidência externa

Depois de uma ação externa, registre o identificador que permite conferência depois: commit, PR, deployment, migration, job, release ou equivalente.

"A ferramenta respondeu sucesso" é menos útil do que "deployment X do commit Y ficou saudável no smoke check Z".
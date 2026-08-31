# Memória persistente de projeto

Uma sessão de agente pode terminar no meio de um trabalho, ser retomada por outro modelo ou perder parte do contexto. O que não pode acontecer é uma decisão importante existir apenas no histórico do chat.

A solução deste toolkit é propositalmente simples: arquivos Markdown pequenos, versionados junto do código.

## O que cada arquivo guarda

`PROJECT.md` responde: o que estamos construindo, para quem, com quais restrições.

`ARCHITECTURE.md` responde: como o sistema está dividido hoje e quais invariantes não podem ser quebrados por acidente.

`DECISIONS.md` guarda decisões que seriam difíceis de reconstruir olhando apenas o código.

`TODO.md` guarda pendências reais e follow-ups conhecidos.

`AGENTS.md` define como agentes devem trabalhar naquele repositório.

Esses arquivos não precisam existir em todo projeto. Um utilitário de 200 linhas provavelmente só precisa de README e testes. O conjunto completo começa a valer a pena quando há várias sessões, integrações, deploy, regras operacionais ou mais de uma pessoa/agente mexendo no código.

## O que não registrar

Evite transformar memória em diário de sessão.

Ruim:

```text
Hoje tentei alterar o arquivo X, deu erro, depois li Y, depois rodei Z...
```

Bom:

```text
A integração mantém fila local durável porque a operação deve continuar sem internet.
Eventos pendentes são reenviados após reconexão e o envio é idempotente.
```

O primeiro texto envelhece rápido. O segundo explica uma propriedade do sistema.

## Decisões com contexto

Uma entrada curta em `DECISIONS.md` deve registrar três coisas:

```text
Data
Decisão
Motivo / trade-off
```

Exemplo:

```text
2026-08-31

Decisão: manter SQLite no processo desktop em vez de mover o estado inteiro para nuvem.

Motivo: a aplicação precisa continuar operando offline. A nuvem recebe sincronização
posterior, mas não participa do caminho crítico local.
```

Isso é suficiente para impedir que uma sessão futura "simplifique" a arquitetura removendo uma restrição que não estava visível no código.

## Atualização

Memória velha é pior do que memória curta. Ao mudar uma decisão, atualize o documento no mesmo trabalho.

Se uma entrada antiga ainda for útil para histórico, marque como superseded em vez de deixá-la parecer atual.

## Resumo para agentes

Antes de começar uma tarefa grande, leia os arquivos de contexto que existirem. Depois da implementação, atualize apenas o que mudou de forma durável.

Não grave conversa. Grave estado do projeto, regra, decisão e restrição.

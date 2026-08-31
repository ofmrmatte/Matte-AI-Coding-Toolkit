# Instalação e adoção

O Matte AI Coding Toolkit não exige um instalador próprio. Ele é um conjunto de arquivos e práticas que você incorpora ao repositório onde o agente vai trabalhar.

## Requisitos mínimos

- Git;
- um agente de desenvolvimento capaz de ler o repositório e executar comandos;
- acesso ao ambiente local ou remoto onde o projeto pode ser validado;
- scripts reais de lint, testes e build definidos pelo projeto.

## Setup mínimo para um projeto

Copie para a raiz do projeto:

```text
AGENTS.md
PROJECT.md
ARCHITECTURE.md
DECISIONS.md
TODO.md
```

Use os modelos em [`../templates/`](../templates/) como ponto de partida.

## Ordem recomendada

1. Preencha `PROJECT.md` com objetivo, escopo, restrições e critérios de sucesso.
2. Descreva a arquitetura atual em `ARCHITECTURE.md` — não a arquitetura que você gostaria de ter.
3. Adapte `AGENTS.md` para os comandos e riscos específicos do repositório.
4. Registre apenas decisões duráveis em `DECISIONS.md`.
5. Use `TODO.md` para trabalho aberto verificável.
6. Faça o agente inspecionar o projeto antes da primeira mudança relevante.

## Quality gates

Não copie comandos genéricos sem confirmar a stack. Descubra os comandos existentes no repositório e registre-os no `AGENTS.md`.

Exemplo para um projeto TypeScript:

```bash
pnpm lint
pnpm typecheck
pnpm test
pnpm build
```

Exemplo para .NET:

```powershell
dotnet format --verify-no-changes
dotnet test
dotnet build -c Release
```

Os exemplos acima não são requisitos do toolkit. O requisito é usar os gates reais do projeto.

## Codex

No Codex, mantenha `AGENTS.md` na raiz e instruções adicionais próximas do código apenas quando uma subárea realmente precisar de regras próprias.

Ao iniciar uma tarefa grande, forneça o objetivo e deixe o agente primeiro:

- ler as instruções;
- inspecionar a estrutura;
- localizar os caminhos críticos;
- definir critérios de aceite;
- só então implementar.

Veja [`codex/codex-workflow.md`](codex/codex-workflow.md).

## MCP e conectores

MCPs e conectores são opcionais. Adicione uma integração quando ela remove trabalho manual ou fornece uma fonte de verdade necessária — não apenas porque está disponível.

Antes de habilitar uma ferramenta com escrita, defina:

- escopo de acesso;
- operação permitida;
- ambiente alvo;
- confirmação necessária para ações destrutivas;
- evidência esperada depois da ação.

Veja [`codex/mcp.md`](codex/mcp.md).

## Adoção gradual

Não é necessário implantar tudo de uma vez.

### Nível 1

- `AGENTS.md`;
- critérios de aceite;
- quality gates.

### Nível 2

- `PROJECT.md`;
- `ARCHITECTURE.md`;
- workflows por tipo de tarefa.

### Nível 3

- subagentes;
- revisão independente;
- automações de release;
- integrações MCP;
- memória e documentação de decisões.

A maturidade aumenta quando o processo reduz regressões e retrabalho, não quando aumenta a quantidade de arquivos.

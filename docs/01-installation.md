# Como adotar em um projeto

Não existe uma instalação obrigatória do Matte AI Coding Toolkit. Você copia o que precisa para o repositório onde o agente vai trabalhar e adapta os arquivos ao projeto real.

Se a primeira coisa que você fizer for copiar cinco templates sem preencher nenhum, provavelmente eles vão virar ruído. Comece pequeno.

## O mínimo que costuma valer a pena

Para um projeto existente, eu começaria com `AGENTS.md`.

Copie [`../templates/AGENTS.md`](../templates/AGENTS.md) para a raiz e troque os exemplos pelos comandos reais do repositório. Registre principalmente:

- como rodar testes e build;
- quais áreas são arriscadas;
- o que o agente não deve fazer automaticamente;
- qual evidência você espera antes de considerar uma tarefa pronta.

Depois use o workflow de [`workflows/existing-project.md`](workflows/existing-project.md) na primeira tarefa maior.

## Bootstrap opcional

Se você já decidiu usar o conjunto completo de arquivos de contexto, há dois scripts em [`../scripts/`](../scripts/):

Windows / PowerShell:

```powershell
./scripts/bootstrap.ps1 C:\Projetos\MeuProjeto
```

Linux/macOS/Git Bash:

```bash
./scripts/bootstrap.sh /caminho/do/projeto
```

Eles copiam:

```text
AGENTS.md
PROJECT.md
ARCHITECTURE.md
DECISIONS.md
TODO.md
```

Arquivos existentes são preservados por padrão. O script informa o que foi copiado e o que foi ignorado. Use `-Force` no PowerShell ou `--force` no Bash somente quando a intenção for substituir os arquivos existentes pelos templates.

O bootstrap economiza a cópia manual. Ele não preenche contexto pelo projeto e não substitui a leitura dos arquivos depois da cópia.

## Quando adicionar os outros arquivos

`PROJECT.md` ajuda quando objetivo e escopo não são óbvios olhando o README.

`ARCHITECTURE.md` começa a valer a pena quando existe mais de um processo, integração, banco, worker, automação externa ou alguma invariável que um refactor pode quebrar sem perceber.

`DECISIONS.md` serve para decisões que não ficam claras no código. Não registre toda escolha de nome de variável.

`TODO.md` é útil quando há follow-ups que precisam sobreviver entre sessões e não estão sendo controlados por issue tracker.

Os templates estão em [`../templates/`](../templates/). Um exemplo já preenchido está em [`../examples/sample-project/`](../examples/sample-project/PROJECT.md).

## Quality gates

Use os comandos do projeto. Não copie uma sequência só porque aparece neste repositório.

Exemplo TypeScript:

```bash
pnpm lint
pnpm typecheck
pnpm test
pnpm build
```

Exemplo .NET:

```powershell
dotnet format --verify-no-changes
dotnet test
dotnet build -c Release
```

Se o projeto não tem um desses gates, não invente um resultado. Decida se ele faz falta e, se fizer, implemente como uma mudança separada ou explicitamente dentro do escopo.

O guia mais detalhado está em [`tools/01-quality-gates.md`](tools/01-quality-gates.md).

## Codex

Mantenha `AGENTS.md` na raiz. Se uma subpasta realmente tiver regras diferentes, coloque instruções mais próximas dela em vez de transformar o arquivo principal em um manual de 500 linhas.

Em tarefa grande, dê o objetivo e deixe a primeira passada ser de inspeção. É melhor gastar contexto entendendo o fluxo uma vez do que corrigir uma implementação feita na camada errada.

Veja [`codex/codex-workflow.md`](codex/codex-workflow.md).

## MCP e outras integrações

São opcionais.

Adicione uma integração quando o agente precisa de uma fonte que não está no repositório: banco, documentação, navegador, deploy, GitHub, observabilidade, design etc.

Para ferramenta com escrita, confira ambiente e escopo antes. Eu evito conexão com permissão ampla por padrão, principalmente quando homologação e produção ficam no mesmo provedor.

Veja [`tools/06-mcp-strategy.md`](tools/06-mcp-strategy.md).

## Um jeito razoável de começar

Em um projeto que já existe:

```text
1. adicionar e adaptar AGENTS.md
2. rodar uma inspeção com prompts/inspect-project.md
3. corrigir os comandos/gates descobertos
4. usar um workflow em uma tarefa real
5. só depois decidir se PROJECT/ARCHITECTURE/DECISIONS fazem falta
```

A adoção está funcionando quando reduz retrabalho e deixa as entregas mais fáceis de verificar. Quantidade de arquivo criado não é métrica.

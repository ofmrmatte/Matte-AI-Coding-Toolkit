# Matte AI Coding Toolkit

[![Release](https://img.shields.io/github/v/release/ofmrmatte/Matte-AI-Coding-Toolkit?label=version)](https://github.com/ofmrmatte/Matte-AI-Coding-Toolkit/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![docs-check](https://github.com/ofmrmatte/Matte-AI-Coding-Toolkit/actions/workflows/docs-check.yml/badge.svg)](https://github.com/ofmrmatte/Matte-AI-Coding-Toolkit/actions/workflows/docs-check.yml)

Um conjunto de arquivos, prompts e rotinas que uso como referência para trabalhar com agentes de código sem depender de uma conversa perfeita do começo ao fim.

O foco principal é Codex, mas quase tudo aqui é independente de modelo. Se o agente consegue ler o repositório, executar comandos, consultar ferramentas e trabalhar com Git, o fluxo continua válido.

Este não é um framework. Também não faz sentido copiar tudo para qualquer projeto. A ideia é pegar as partes que resolvem um problema real: contexto perdido entre sessões, agente alterando coisa demais, UI aprovada sem ser aberta, release sem evidência, dois agentes mexendo no mesmo arquivo, documentação externa desatualizada, esse tipo de coisa.

## Por onde começar

Se você chegou agora, eu faria assim:

1. leia [`docs/00-overview.md`](docs/00-overview.md);
2. veja o [`docs/02-playbook.md`](docs/02-playbook.md) para entender o fluxo completo;
3. escolha o workflow que combina com a tarefa em [`docs/workflows/`](docs/workflows/);
4. copie [`templates/AGENTS.md`](templates/AGENTS.md) para o projeto e adapte só o que fizer sentido;
5. use os prompts como ponto de partida, não como texto sagrado.

Se quiser ver primeiro como isso fica aplicado, vá direto para [`examples/sample-project/PROJECT.md`](examples/sample-project/PROJECT.md).

## Bootstrap

Quem já sabe que quer usar os cinco arquivos de contexto pode copiar tudo com um comando.

PowerShell:

```powershell
./scripts/bootstrap.ps1 C:\Projetos\MeuProjeto
```

Bash:

```bash
./scripts/bootstrap.sh /caminho/do/projeto
```

Os scripts copiam `AGENTS.md`, `PROJECT.md`, `ARCHITECTURE.md`, `DECISIONS.md` e `TODO.md`. Arquivos existentes não são sobrescritos por padrão.

O bootstrap só prepara a estrutura. Ainda é preciso preencher os arquivos com o projeto real.

Mais detalhes em [`docs/01-installation.md`](docs/01-installation.md).

## A regra que segura o resto

> Código escrito não é evidência de que a tarefa terminou.

Para uma mudança pequena, às vezes compilar e rodar um teste específico é suficiente. Para uma alteração de UI, quero ver a tela. Para uma automação que controla outro processo, quero ver o isolamento funcionando. Para uma release, quero saber qual artefato foi publicado e de qual commit ele saiu.

O nível de validação muda conforme o risco. A exigência de evidência, não.

## O fluxo

Na maioria das tarefas maiores, sigo esta ordem:

```text
entender o pedido
-> olhar o projeto como ele existe hoje
-> reproduzir ou mapear o comportamento atual
-> definir o que precisa mudar
-> implementar em partes pequenas
-> testar no nível certo
-> revisar o diff
-> registrar decisões que precisam sobreviver à sessão
```

Não uso planejamento longo para trocar um texto ou corrigir um typo. Também não começo uma migração, refactor amplo ou correção de bug difícil editando o primeiro arquivo que parece relacionado.

## O que tem no repositório

### `AGENTS.md`

O [`AGENTS.md`](AGENTS.md) da raiz é o contrato usado neste próprio toolkit. Em [`templates/AGENTS.md`](templates/AGENTS.md) há uma versão menor para copiar para outros projetos.

Ele define coisas que não quero renegociar a cada sessão: inspecionar antes de reescrever, reproduzir bugs, não enfraquecer teste para deixar CI verde, separar implementação de revisão quando o risco justificar e reportar o que foi realmente validado.

### Workflows

Em [`docs/workflows/`](docs/workflows/) existem fluxos diferentes para situações que parecem parecidas, mas pedem decisões diferentes:

- [`new-project.md`](docs/workflows/new-project.md) — quando ainda dá para escolher a fundação;
- [`existing-project.md`](docs/workflows/existing-project.md) — quando preservar comportamento importa tanto quanto adicionar coisa nova;
- [`bug-fix.md`](docs/workflows/bug-fix.md) — reproduzir, achar a camada errada e deixar regressão coberta;
- [`ui-rebuild.md`](docs/workflows/ui-rebuild.md) — mexer em interface olhando a interface;
- [`production-release.md`](docs/workflows/production-release.md) — gates, artefato, deploy e smoke check;
- [`code-review.md`](docs/workflows/code-review.md) — revisão independente sem reimplementar a solução inteira.

### Ferramentas e práticas

A pasta [`docs/tools/`](docs/tools/) é mais específica. Cada guia tenta responder duas perguntas: quando isso ajuda e quando só aumenta a cerimônia.

Tem material sobre:

- [quality gates](docs/tools/01-quality-gates.md);
- [validação no navegador](docs/tools/02-browser-validation.md);
- [documentação e contexto atual](docs/tools/03-context-and-docs.md);
- [memória persistente de projeto](docs/tools/04-persistent-memory.md);
- [GitHub como trilha de trabalho](docs/tools/05-github-workflow.md);
- [uso de MCP](docs/tools/06-mcp-strategy.md);
- [orquestração de subagentes](docs/tools/07-subagent-orchestration.md);
- [automação de release](docs/tools/08-release-automation.md).

### Prompts

Os arquivos em [`prompts/`](prompts/) são atalhos para tarefas recorrentes. Eu prefiro prompts que apontam para regras do repositório e pedem evidência, em vez de prompts enormes tentando prever todo caso possível.

Hoje existem prompts para inspeção de projeto, build de projeto, bug fix, revisão de UI/UX, auditoria de produção e checklist de release.

### Memória de projeto

Em [`templates/`](templates/) ficam arquivos simples que ajudam quando o projeto atravessa muitas sessões:

```text
PROJECT.md       objetivo, escopo e restrições
ARCHITECTURE.md  desenho atual e invariantes
DECISIONS.md     decisões que não são óbvias olhando só o código
TODO.md          trabalho aberto e follow-ups
AGENTS.md        regras para quem mexe no repositório
```

Não uso isso como diário. Se uma informação não vai ajudar uma sessão futura a tomar uma decisão melhor, provavelmente não precisa entrar ali.

## Exemplos

Os recortes em [`examples/`](examples/) mostram tipos diferentes de trabalho:

- [`web-dashboard.md`](examples/web-dashboard.md) — bug em filtros de mês/quinzena;
- [`desktop-automation.md`](examples/desktop-automation.md) — isolamento entre instâncias de uma automação Windows;
- [`mobile-portal.md`](examples/mobile-portal.md) — viewport e safe area em mobile;
- [`sample-project/`](examples/sample-project/PROJECT.md) — os cinco arquivos de contexto preenchidos para uma aplicação pequena de tarefas.

## Checks do próprio toolkit

O workflow [`.github/workflows/docs-check.yml`](.github/workflows/docs-check.yml) roda em `push` para `main` e em pull requests.

Ele verifica:

- presença dos arquivos obrigatórios;
- links locais dos arquivos Markdown;
- sintaxe do bootstrap Bash;
- execução real do bootstrap Bash;
- execução real do bootstrap PowerShell.

A validação principal fica em [`scripts/check_docs.py`](scripts/check_docs.py) e usa apenas a biblioteca padrão do Python.

## Releases

A versão atual fica em [`VERSION`](VERSION). Quando esse arquivo muda na `main`, [`.github/workflows/release.yml`](.github/workflows/release.yml) valida as notas correspondentes em `.github/release-notes/`, cria a tag `vX.Y.Z` e publica a GitHub Release.

A versão estável atual é [`v1.0.0`](https://github.com/ofmrmatte/Matte-AI-Coding-Toolkit/releases/tag/v1.0.0).

## Coisas que eu evito

Algumas regras apareceram porque são atalhos tentadores:

- trocar arquitetura antes de entender por que ela ficou daquele jeito;
- apagar comportamento funcional para simplificar a implementação;
- dizer que uma UI está pronta olhando só o JSX/CSS;
- rodar dois agentes em paralelo no mesmo conjunto de arquivos sem dono claro;
- transformar toda ferramenta nova em requisito do projeto;
- esconder warning, teste não executado ou limitação de ambiente;
- guardar decisão importante apenas no chat;
- usar produção como primeiro teste significativo quando existe caminho mais seguro.

## Estrutura atual

```text
Matte-AI-Coding-Toolkit/
├── .github/
│   ├── release-notes/
│   └── workflows/
│       ├── docs-check.yml
│       └── release.yml
├── docs/
├── examples/
│   └── sample-project/
├── prompts/
├── scripts/
│   ├── bootstrap.ps1
│   ├── bootstrap.sh
│   └── check_docs.py
├── templates/
├── AGENTS.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
├── NOTICE.md
├── README.md
└── VERSION
```

## Origem

Este repositório começou como uma adaptação do [Vibe Coding Toolkit](https://github.com/soumatheusgomes/vibe-coding-toolkit), de Matheus Gomes. O projeto original é distribuído sob MIT License.

Mantive a atribuição e a licença, mas reorganizei o material em torno do meu fluxo com Codex, `AGENTS.md`, validação de comportamento, workflows por tipo de tarefa e memória simples dentro do próprio repositório.

A atribuição completa está em [`NOTICE.md`](NOTICE.md).

## Licença

MIT. Veja [`LICENSE`](LICENSE).

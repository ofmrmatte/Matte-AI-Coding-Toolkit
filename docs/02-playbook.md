# Playbook

Este é o roteiro que eu uso como referência quando a tarefa já é grande o bastante para dar problema se o agente sair editando sem contexto.

Não precisa seguir cada item em mudança pequena. O objetivo é evitar três erros recorrentes: implementar na camada errada, perder requisito durante a execução e terminar sem conseguir provar que o comportamento ficou certo.

## Comece pelo estado atual

Antes de planejar, descubra o que existe.

Leia `AGENTS.md` se houver. Veja os scripts reais do projeto, os testes, o build, o caminho de deploy e a documentação que ainda parece atual. Depois siga a funcionalidade pelo código até entender onde o comportamento nasce e onde ele é exibido.

Em bug, tente reproduzir antes de discutir solução. Em projeto novo, essa etapa vira levantamento de restrições e escolhas já feitas. Em UI, abra a tela cedo.

A saída dessa fase não precisa ser um documento bonito. Precisa ser suficiente para responder:

```text
como funciona hoje?
onde está a regra?
o que não pode quebrar?
qual é a menor mudança plausível?
```

## Transforme o pedido em comportamento observável

"Melhorar login" não ajuda muito na hora de testar.

Algo como isto ajuda:

```text
em 390x844 o formulário não cria scroll desnecessário;
com teclado aberto os campos continuam acessíveis;
após submit existe estado de loading;
erro de autenticação mantém o usuário na tela e mostra feedback.
```

Nem todo requisito precisa virar tabela formal. Mas, se não dá para imaginar como verificar uma frase, provavelmente ela ainda está vaga demais.

## Planeje só o necessário

Para uma mudança localizada, um checklist de três itens costuma bastar.

Para trabalho que envolve banco, arquitetura, várias telas, release, migração ou integração externa, vale anotar:

- quais módulos devem mudar;
- em que ordem;
- qual risco deve ser validado cedo;
- como saber se cada parte funcionou;
- como voltar se a mudança for destrutiva.

Plano bom ajuda a executar. Plano que só renomeia o pedido em dez etapas é documentação ornamental.

## Use paralelismo depois de entender as fronteiras

Subagentes funcionam bem quando cada um tem um pedaço independente.

Exemplo razoável:

```text
A -> investigar regra de banco
B -> revisar comportamento responsivo
C -> mapear testes existentes
```

Exemplo ruim:

```text
A -> mexer no estado global
B -> mexer no componente que usa o mesmo estado
C -> refatorar os tipos usados pelos dois
```

Se o trabalho depende da mesma decisão ou do mesmo arquivo central, faça em sequência ou reorganize a tarefa antes de paralelizar.

## Implemente e valide cedo

Não acumule várias hipóteses antes de testar nenhuma.

Se a parte arriscada é uma migração, prove a migração cedo. Se é integração com navegador, valide conexão e comportamento mínimo antes de construir o restante. Se é layout, renderize o shell antes de refazer nove telas em cima dele.

Mudanças menores são mais fáceis de revisar e de desfazer.

## Rode os gates do projeto, não uma checklist genérica

Descubra os comandos reais. O relatório pode ser simples:

```text
lint: PASS
typecheck: PASS
tests: PASS (84)
build: PASS
E2E: NOT RUN - ambiente externo indisponível
```

`NOT RUN` é um estado legítimo. O problema é esconder que a verificação não aconteceu.

Para frontend, inclua navegação real quando a alteração for visual. Para automação, inclua o fluxo operacional. Para release, valide o artefato que será publicado.

## Revise o diff sem defender a própria solução

Depois de implementar, procure coisas que você mesmo não estava procurando enquanto codava:

- arquivo alterado sem relação com a tarefa;
- comportamento removido por simplificação;
- teste enfraquecido;
- dependência nova sem motivo forte;
- tratamento de erro perdido;
- caminho de dados duplicado;
- documentação que agora mente.

Em mudança grande, um segundo agente ou outra pessoa revisando só o estado final costuma encontrar mais do que mais uma rodada do implementador.

## Entregue o que foi provado

Um relatório final útil responde:

1. o que mudou no comportamento;
2. o que foi testado;
3. quais verificações passaram;
4. o que não pôde ser testado;
5. se ficou alguma limitação que realmente importa.

Evite usar número de arquivos, linhas alteradas ou quantidade de agentes como medida de qualidade.

## Guarde apenas o que uma sessão futura precisa saber

Se a tarefa mudou uma decisão arquitetural, atualize `ARCHITECTURE.md` ou `DECISIONS.md`.

Se sobrou trabalho concreto, atualize `TODO.md`.

Não registre uma transcrição da sessão. O histórico do Git já mostra o que mudou; a memória do projeto deve explicar o que não é óbvio olhando só o diff.
# Automação de release

Release automatizada vale a pena quando reduz trabalho repetitivo sem esconder as decisões importantes. O objetivo é tornar a entrega repetível, não transformar um deploy simples em uma plataforma interna.

## O que automatizar primeiro

Comece pelo que precisa ser igual em toda versão:

```text
quality gates
-> build
-> empacotamento
-> identificação de versão/commit
-> checksum quando aplicável
-> publicação do artefato
-> smoke check
```

Se a aplicação tem migração de banco ou infraestrutura, trate essas etapas separadamente porque o risco e o rollback são diferentes do build do aplicativo.

## Artefato rastreável

Todo artefato distribuído deveria permitir descobrir a origem.

Inclua, de alguma forma apropriada ao produto:

- versão;
- commit SHA;
- data de build;
- canal (`dev`, `staging`, `stable`) quando existir.

Isso evita a situação em que existem dois `setup-final.zip` e ninguém sabe qual está instalado.

## Release não começa no upload

Antes de publicar, valide o mesmo artefato que será distribuído. Recompilar depois dos testes cria um artefato diferente, mesmo que o código pareça igual.

Uma sequência melhor é:

```text
build uma vez
-> testa o artefato
-> publica o mesmo artefato
```

## Rollback

Automação sem rollback só automatiza metade do problema.

Para cada tipo de entrega, saiba o que voltar significa:

- web: apontar para deploy anterior;
- desktop: disponibilizar instalador anterior e garantir compatibilidade de dados;
- banco: aplicar migration reversa ou procedimento de recuperação;
- worker: restaurar versão anterior sem perder jobs pendentes.

Nem toda mudança é realmente reversível. Migração destrutiva, por exemplo, pode exigir backup e restauração. Nesse caso, documente isso antes da release.

## Aprovação manual ainda pode fazer sentido

Produção não precisa ser totalmente automática. Um pipeline pode construir e validar sozinho e parar antes do deploy para uma aprovação explícita.

Isso é útil quando:

- existe janela operacional;
- a mudança afeta dados sensíveis;
- deploy depende de comunicação com usuários;
- rollback é caro;
- ambiente ainda não tem observabilidade suficiente.

Automação deve remover passos mecânicos, não remover julgamento onde ele ainda é necessário.

## Smoke check

Depois da publicação, valide poucos sinais de alto valor:

- aplicação abre;
- autenticação funciona;
- endpoint de saúde responde;
- fluxo principal executa;
- logs não mostram erro novo evidente.

Smoke check não substitui testes anteriores. Ele responde outra pergunta: "o que foi publicado está vivo e conectado como esperado?"

## Para agentes

Não declare release concluída só porque a ação de deploy retornou sucesso. Registre o artefato, o commit, os gates executados e o resultado do smoke check. Se não houver acesso para validar produção, diga exatamente onde a evidência termina.

# Browser validation

Frontend não fica pronto quando compila. Boa parte dos bugs que chegam ao usuário não é detectada pelo TypeScript: overflow, conteúdo escondido, loading quebrado, modal fora da viewport, botão coberto, contraste ruim, layout que desloca no iPhone e estados que só aparecem depois de uma interação.

Por isso, alterações visuais relevantes precisam de uma etapa explícita de navegação e inspeção.

## O que validar

Comece pelo caminho real do usuário, não pela lista de componentes alterados.

Se a mudança foi em login:

```text
abrir página
-> preencher campos
-> enviar
-> observar loading
-> validar erro
-> validar sucesso
-> recarregar
-> conferir sessão
```

Se a mudança foi em uma tela responsiva, teste pelo menos os breakpoints que representam mudanças reais de layout. Não faz sentido abrir quinze resoluções se o CSS só muda em três faixas.

Também vale testar conteúdo que força o layout:

- nome comprido;
- número grande;
- lista vazia;
- lista grande;
- erro de rede;
- botão desabilitado;
- teclado virtual quando aplicável;
- safe areas em dispositivos móveis.

## Screenshot é evidência, não teste completo

Uma captura ajuda a comparar o resultado, mas uma interface pode parecer correta e continuar quebrada ao clicar.

Prefira uma sequência curta de ações reproduzíveis e use screenshots nos pontos em que a aparência importa.

Quando houver regressão visual recorrente, considere um teste automatizado. Quando for um ajuste pontual de alinhamento, uma inspeção manual bem documentada costuma ser suficiente.

## Não corrija só o dispositivo que apareceu no bug

Se um problema foi reportado em um iPhone específico, descubra a causa CSS antes de colocar uma exceção para aquele modelo.

Exemplo: uma barra inferior deslocada pode estar relacionada a `100vh`, `position: fixed`, `env(safe-area-inset-bottom)` ou ao comportamento do navegador com teclado. Uma regra específica para `390x844` pode esconder a causa e quebrar no próximo aparelho.

## Ambientes

Use o ambiente mais próximo do real que ainda seja seguro.

1. componentes/páginas locais para iteração rápida;
2. aplicação local com dados simulados;
3. homologação com integrações reais;
4. produção apenas para smoke check depois de uma entrega segura.

Nunca transforme produção no primeiro lugar em que a funcionalidade é realmente exercitada.

## Registro mínimo

Para uma mudança de UI importante, a entrega deve dizer:

- quais fluxos foram navegados;
- quais tamanhos de tela foram verificados;
- quais estados especiais foram testados;
- o que não pôde ser testado;
- se restou alguma limitação conhecida.

Isso vale mais do que afirmar que a tela ficou "responsiva".

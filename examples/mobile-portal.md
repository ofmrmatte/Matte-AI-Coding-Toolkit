# Exemplo: portal mobile com layout deslocado no iPhone

## Cenário

Em alguns iPhones, a parte superior da aplicação parece deslocada e a barra inferior fica mais alta do que deveria. Em Android e desktop o problema não aparece.

A correção ruim é adicionar um media query para a resolução do aparelho reportado. A correção boa começa descobrindo por que o navegador está calculando a viewport daquele jeito.

## 1. Reproduza em uma família de tamanhos

Não teste só um modelo.

Use pelo menos:

- viewport estreita com notch/safe area;
- viewport semelhante sem safe area relevante;
- orientação vertical;
- teclado aberto em uma tela com formulário, se houver;
- rolagem com barras fixas.

O objetivo é descobrir se o problema segue largura/altura, safe area, navegador ou uma combinação.

## 2. Inspecione as causas comuns

Procure por:

```text
height: 100vh
position: fixed
bottom: 0
top: 0
overflow: hidden
transform em ancestral de elemento fixed
padding manual para notch
uso de env(safe-area-inset-*)
```

Também confira meta viewport e qualquer container que tente simular altura de aplicativo.

## 3. Corrija a regra, não o aparelho

Se a causa é viewport dinâmica, use a unidade ou estratégia adequada ao layout atual. Se a causa é safe area, centralize o tratamento no shell da aplicação em vez de aplicar padding diferente em cada tela.

Evite:

```css
@media (width: 390px) and (height: 844px) {
  /* conserto específico */
}
```

A menos que exista um motivo comprovadamente específico daquele viewport.

## 4. Estados para conferir

Depois da correção:

- login sem teclado;
- login com teclado;
- tela longa com scroll;
- tela curta sem scroll;
- navegação inferior;
- modal ou sheet;
- rotação, se suportada;
- retorno do background para o app.

## 5. Evidência

Uma entrega boa registra os viewports testados e a causa encontrada.

Exemplo:

```text
causa: shell usava 100vh e barra fixa ignorava safe-area-inset-bottom
correção: altura dinâmica no shell + safe area centralizada no navigation container
390x844: PASS
393x852: PASS
430x932: PASS
Android 412x915: PASS
build: PASS
```

Isso dá confiança de que a mudança corrigiu uma classe de dispositivos, não apenas o print que abriu o bug.
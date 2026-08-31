# Workflow — UI rebuild e revisão visual

UI não é validada apenas por código compilando. O resultado final precisa ser inspecionado no navegador ou ambiente real quando isso for tecnicamente possível.

## 1. Inventário antes do redesign

Mapeie:

- telas e rotas;
- componentes compartilhados;
- estados de loading, vazio e erro;
- breakpoints;
- formulários;
- navegação;
- ações críticas;
- design tokens existentes;
- restrições de marca.

Não redesenhe uma interface complexa olhando apenas uma tela isolada.

## 2. Preserve regra de negócio

Um rebuild visual não autoriza duplicar ou reescrever regras existentes na camada de apresentação.

O fluxo recomendado é:

```text
estado/regra existente → ViewModel/store/controller → componentes → UI
```

Adapte ao framework, mantendo uma única fonte de verdade.

## 3. Defina critérios visuais

Inclua quando aplicável:

- desktop;
- tablet;
- mobile;
- áreas seguras em iOS/Android;
- zoom e densidade;
- conteúdo longo;
- teclado virtual;
- foco e navegação por teclado;
- contraste e semântica.

## 4. Implemente por tela ou fluxo

Não faça um redesign total sem checkpoints. Feche uma área, valide, extraia padrões e avance.

## 5. Teste estados

Para cada tela relevante, considere:

- normal;
- loading;
- vazio;
- erro;
- sem permissão;
- ação em andamento;
- dados extremos/longos.

## 6. Revisão visual

Use browser automation, screenshots ou inspeção manual assistida para comparar o comportamento real contra os critérios.

Teste viewports representativos. Não declare "responsivo" testando apenas a largura do seu monitor.

## 7. Gate final

A UI só está pronta quando:

- comportamento funcional passa;
- layout passa nos viewports definidos;
- não há overflow/scroll inesperado;
- estados críticos estão tratados;
- acessibilidade básica foi preservada;
- build e testes relevantes passam.

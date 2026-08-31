# Exemplo: automação desktop com isolamento operacional

## Cenário

Uma aplicação desktop automatiza outro software em Windows. Ela já funciona, mas uma nova versão precisa suportar duas instâncias do software alvo sem uma assumir a janela da outra.

Aqui o risco não é só "o código não compilar". Um erro pode operar a janela errada.

## 1. Escreva a invariável antes da mudança

Em `ARCHITECTURE.md`, algo como:

```text
Cada instância da automação fica vinculada a uma instância específica do processo alvo.
Esse vínculo não pode ser trocado silenciosamente durante a execução.
```

Depois detalhe os sinais usados para identificar a instância: PID, handle, horário de início, desktop virtual ou o conjunto que o sistema realmente tiver disponível.

## 2. Liste o comportamento proibido

Critérios negativos são importantes em automação:

- não buscar outra janela globalmente quando a atual some;
- não roubar foco da sessão do operador;
- não enviar entrada para processo não vinculado;
- não fazer auto-rebind sem regra explícita;
- falha de uma instância não interrompe a outra.

## 3. Teste com duas instâncias de verdade

Um mock ajuda a validar a lógica de binding, mas não prova comportamento de foco, HWND, desktop virtual ou ciclo de vida do processo.

O teste final precisa cobrir pelo menos:

```text
instância A inicia e vincula
instância B inicia e vincula
A executa uma operação
B permanece intacta
B executa uma operação
A permanece intacta
processo A fecha
B continua operando
A não se vincula automaticamente a B
```

## 4. Telemetria

Logue o suficiente para investigar um incidente sem guardar dados desnecessários:

```text
instance_id
process_id
window_handle
binding_timestamp
action
result
```

Se o binding mudar, isso precisa aparecer como evento explícito.

## 5. Release

Uma versão dessas não deveria ir direto para todos os operadores. Faça piloto com duas instâncias controladas, valide logs e só então amplie.

O toolkit não decide qual tecnologia de automação usar. Ele força a explicitar a propriedade mais importante: uma instância nunca pode agir sobre o alvo de outra por conveniência.
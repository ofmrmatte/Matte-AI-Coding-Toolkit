# Workflow — projeto existente

Projetos existentes têm uma restrição adicional: comportamento atual é patrimônio até prova em contrário.

## 1. Não comece reescrevendo

Antes de propor mudanças:

- leia instruções e docs;
- inspecione a estrutura;
- identifique stack e versões;
- descubra scripts de build/teste;
- localize o fluxo atual;
- leia histórico recente quando relevante;
- identifique integrações e persistência.

## 2. Crie um mapa do sistema

Responda:

- onde o comportamento começa?
- quais módulos participam?
- onde o estado é persistido?
- quais contratos externos existem?
- quais testes já cobrem o fluxo?
- quais invariantes não podem mudar?

## 3. Compare atual x desejado

Use uma tabela simples:

| Aspecto | Atual | Desejado | Gap |
|---|---|---|---|
| comportamento | ... | ... | ... |
| dados | ... | ... | ... |
| UI | ... | ... | ... |
| integração | ... | ... | ... |

## 4. Escolha a menor mudança segura

Prefira adaptar o caminho existente antes de criar um caminho paralelo.

Se a arquitetura atual for realmente insuficiente, documente:

- limitação concreta;
- impacto;
- alternativa;
- migração;
- rollback.

## 5. Preserve compatibilidade

Verifique consumidores, schemas, rotas, eventos, arquivos e contratos antes de alterar nomes ou formatos.

## 6. Teste regressão

Além do novo comportamento, valide pelo menos os caminhos adjacentes que compartilham o mesmo módulo ou estado.

## 7. Atualize documentação

Se a mudança alterou arquitetura, contrato ou regra durável, atualize os arquivos persistentes correspondentes.

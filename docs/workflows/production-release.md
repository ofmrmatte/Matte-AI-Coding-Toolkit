# Workflow — release de produção

Publicar é uma etapa própria. "Build passou" não significa "produção está saudável".

## 1. Pré-release

Confirme:

- commit/branch exatos;
- quality gates aprovados;
- configuração do ambiente;
- secrets presentes sem exposição;
- migrações necessárias;
- compatibilidade de schema;
- estratégia de rollback;
- impacto em integrações externas.

## 2. Dados e migrações

Para qualquer mudança persistente, documente:

- operação;
- ordem;
- backward compatibility;
- risco de lock/perda;
- backup quando necessário;
- rollback ou roll-forward.

Nunca trate migração destrutiva como detalhe do deploy.

## 3. Artefato

Use um artefato reproduzível e associe-o a um commit identificável.

## 4. Deploy

Registre alvo, identificador do deployment e resultado da plataforma.

## 5. Smoke test

Depois do deploy, verifique os fluxos que comprovam saúde real:

- aplicação responde;
- autenticação crítica funciona;
- leitura/escrita principal funciona;
- integrações essenciais respondem;
- logs não mostram erro novo relevante.

Adapte a lista ao sistema.

## 6. Observação curta pós-release

Cheque métricas e erros suficientes para detectar regressão imediata. Não confunda ausência de alerta com prova de sucesso se o sistema não possui observabilidade adequada.

## 7. Falha

Se um critério crítico falhar:

1. pare novas mudanças;
2. avalie rollback versus correção direta;
3. preserve evidência;
4. restaure serviço primeiro;
5. faça análise de causa depois.

## Relatório mínimo

```text
Commit:
Ambiente:
Deploy:
Migração:
Smoke test:
Observabilidade:
Rollback:
Estado final: HEALTHY / DEGRADED / ROLLED BACK / FAILED
```

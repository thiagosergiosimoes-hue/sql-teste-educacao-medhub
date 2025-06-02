# Desafio SQL · MedHub Educação

Olá! Obrigada pelo seu interesse em participar deste desafio :) 

Aqui você vai encontrar um **mini data warehouse fictício** de uma plataforma de educação médica. A missão é criar consultas SQL que respondam às perguntas listadas na pasta `questions/`.

## Por onde começar

1. **Fork** este repositório para sua conta no GitHub.
2. Clone o fork no seu computador.
3. Carregue o schema (SQL Server 2022 ou compatível):

   ```bash
   sqlcmd -S localhost -d master -i schema/setup_schema.sql
   sqlcmd -S localhost -d medhub  -i schema/load_data.sql

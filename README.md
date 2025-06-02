# Desafio SQL + Power BI · MedHub Educação

Olá! Obrigada pelo seu interesse em participar deste desafio :) 

Você encontrará aqui um pequeno _data warehouse_ fictício com dados de uma empresa de educação médica e um conjunto de perguntas para demonstrar suas habilidades em SQL e visualização de dados.

> **O que esperamos**  
> 1. **Consultas SQL** para responder às 5 questões listadas.  
> 2. **Um painel simples** (3+ visuais) desenvolvido em Power BI, usando o arquivo `dashboard_kpis.csv`.


## Por onde começar

1. **Fork** este repositório e clone no seu computador.
2. Importe os cinco arquivos CSV para um banco SQL *de sua preferência*  
   (SQL Server, PostgreSQL, MySQL, SQLite… você escolhe).
   - Fique livre para definir tipos de dados, PK/FK e índices como achar melhor.
3. Resolva cada questão da pasta `questions/`.  
   Crie um arquivo com o mesmo nome dentro da pasta **answers/** contendo somente seu `SELECT` (e, se precisar, CTEs/temp tables).
4. Faça **commit + push** e abra um **pull request**


### Sobre os principais CSVs:

- Desafio SQL
  
| Arquivo | Principais colunas |
|---------|-------------------|
| **alunos.csv** | id_aluno, nome, email, data_cadastro |
| **cursos.csv** | id_curso, nome, nível, carga_horaria, obrigatorio |
| **inscricoes.csv** | id_inscricao, id_aluno, id_curso, data_insc, status |
| **modulos.csv** | id_modulo, id_curso, titulo, ordem, duracao_min |
| **progresso.csv** | id_progresso, id_aluno, id_modulo, porcentagem, ultima_atividade |

- Desafio Power BI
  
| Arquivo | Principais colunas |
|---------|-------------------|
| **dashboard_kpis.csv** | ano_mes, inscrições, conclusões, horas assistidas, alunos ativos 30 d |

Boa sorte e qualquer dúvida, abra uma **Issue** ou mencione **@MoniqueSquadraDigital** no seu Pull Request. 
Obrigada :)

/* -----------------------------------------------------------
   load_data.sql
   Carrega os CSVs do desafio
------------------------------------------------------------*/

-- Altere para o caminho onde você clonou este repositório
:setvar rootdir "C:\sql-teste-educacao-medhub"

BULK INSERT alunos
FROM '$(rootdir)\alunos.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', CODEPAGE = '65001');

BULK INSERT cursos
FROM '$(rootdir)\cursos.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', CODEPAGE = '65001');

BULK INSERT inscricoes
FROM '$(rootdir)\inscricoes.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', CODEPAGE = '65001');

BULK INSERT modulos
FROM '$(rootdir)\modulos.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', CODEPAGE = '65001');

BULK INSERT progresso
FROM '$(rootdir)\progresso.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', CODEPAGE = '65001');
GO

PRINT 'Dados carregados com sucesso!';
GO

/* -----------------------------------------------------------
   setup_schema.sql
   Banco: medhub
   Cria as tabelas do Desafio SQL · MedHub Educação
------------------------------------------------------------*/

IF DB_ID('medhub') IS NULL
    CREATE DATABASE medhub;
GO

USE medhub;
GO

/* ---------- Tabela de alunos ---------- */
IF OBJECT_ID('dbo.alunos', 'U') IS NOT NULL DROP TABLE dbo.alunos;
GO
CREATE TABLE dbo.alunos (
    id_aluno      INT           NOT NULL PRIMARY KEY,
    nome          NVARCHAR(120) NOT NULL,
    email         NVARCHAR(150) NOT NULL UNIQUE,
    data_cadastro DATE          NOT NULL
);
GO

/* ---------- Tabela de cursos ---------- */
IF OBJECT_ID('dbo.cursos', 'U') IS NOT NULL DROP TABLE dbo.cursos;
GO
CREATE TABLE dbo.cursos (
    id_curso      INT           NOT NULL PRIMARY KEY,
    nome          NVARCHAR(120) NOT NULL,
    nivel         NVARCHAR(30)  NOT NULL,   -- Ex.: Básico, Avançado
    carga_horaria INT           NOT NULL,   -- Horas totais
    obrigatorio   BIT           NOT NULL    -- 1 = faz parte do currículo obrigatório
);
GO

/* ---------- Tabela de módulos ---------- */
IF OBJECT_ID('dbo.modulos', 'U') IS NOT NULL DROP TABLE dbo.modulos;
GO
CREATE TABLE dbo.modulos (
    id_modulo   INT           NOT NULL PRIMARY KEY,
    id_curso    INT           NOT NULL,
    titulo      NVARCHAR(150) NOT NULL,
    ordem       INT           NOT NULL,     -- Ordem dentro do curso
    duracao_min INT           NOT NULL,     -- Duração estimada (min)
    CONSTRAINT fk_modulos_curso
        FOREIGN KEY (id_curso) REFERENCES dbo.cursos(id_curso)
);
GO

/* ---------- Tabela de inscrições ---------- */
IF OBJECT_ID('dbo.inscricoes', 'U') IS NOT NULL DROP TABLE dbo.inscricoes;
GO
CREATE TABLE dbo.inscricoes (
    id_inscricao INT           NOT NULL PRIMARY KEY,
    id_aluno     INT           NOT NULL,
    id_curso     INT           NOT NULL,
    data_insc    DATE          NOT NULL,
    status       NVARCHAR(20)  NOT NULL,    -- ativa, concluída, cancelada
    CONSTRAINT fk_insc_aluno
        FOREIGN KEY (id_aluno) REFERENCES dbo.alunos(id_aluno),
    CONSTRAINT fk_insc_curso
        FOREIGN KEY (id_curso) REFERENCES dbo.cursos(id_curso)
);
GO

/* ---------- Tabela de progresso ---------- */
IF OBJECT_ID('dbo.progresso', 'U') IS NOT NULL DROP TABLE dbo.progresso;
GO
CREATE TABLE dbo.progresso (
    id_progresso    INT           NOT NULL PRIMARY KEY,
    id_aluno        INT           NOT NULL,
    id_modulo       INT           NOT NULL,
    porcentagem     DECIMAL(5,2)  NOT NULL, -- 0 a 100
    ultima_atividade DATETIME     NULL,
    CONSTRAINT fk_prog_aluno
        FOREIGN KEY (id_aluno)  REFERENCES dbo.alunos(id_aluno),
    CONSTRAINT fk_prog_modulo
        FOREIGN KEY (id_modulo) REFERENCES dbo.modulos(id_modulo)
);
GO

/* ---------- Índices auxiliares ---------- */
CREATE INDEX idx_insc_aluno        ON dbo.inscricoes(id_aluno);
CREATE INDEX idx_insc_curso_status ON dbo.inscricoes(id_curso, status);
CREATE INDEX idx_prog_aluno_modulo ON dbo.progresso(id_aluno, id_modulo);
GO

PRINT 'Schema criado com sucesso!';
GO

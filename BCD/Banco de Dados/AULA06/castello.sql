create DATABASE castellovers;

use castellovers;

CREATE Table if not exists alunos (
    id_aluno BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (60) not NULL,
    cpf char (14) not null UNIQUE,
    status_aluno ENUM ('ATIVO', 'INATIVO', 'CONCLUIDO') DEFAULT 'ATIVO',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

-- Visualizar todos os BD
show SCHEMAS;

show TABLES;

-- Descrição de atributos da tabela aluno

DESCRIBE alunos;

-- Apagar BD

DROP DATABASE castellovers;
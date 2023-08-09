CREATE DATABASE curso_sql;

USE curso_sql;

DROP DATABASE curso_sql;

CREATE TABLE funcionarios 
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45) not null,
    PRIMARY KEY (id)
    );
    
DESCRIBE funcionarios;

DROP TABLE funcionarios;

CREATE TABLE veiculos
(
	id int unsigned not null auto_increment,
    funcionario_id int unsigned default null,
    veiculo varchar(45) not null default '',
    placa varchar(10) not null default '',
    PRIMARY KEY (id),
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
);

DESCRIBE veiculos;

DROP TABLE veiculos;

CREATE TABLE salarios
(
	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);

DROP TABLE salarios;

DESCRIBE salarios;

ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(50) not null;

ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null;

CREATE INDEX departamentos ON funcionarios (departamento);

CREATE INDEX nomes ON funcionarios (nome(6));


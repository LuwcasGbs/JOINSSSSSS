CREATE DATABASE GER_JOIN_1e;
use GER_JOIN_1e;

CREATE TABLE funcionarios(
COD int auto_increment primary key not null,
NOME varchar(255) not null,
ESPECIALIDADE varchar(255) not null
);

CREATE TABLE dependentes(
COD int auto_increment primary key not null,
NOME varchar(255) not null,
COD_FUNC int,
foreign key(COD_FUNC) references funcionarios(COD)
);

insert into funcionarios (NOME, ESPECIALIDADE)
values
	("JOSÉ","ENGENHEIRO"),
    ("JOÃO","MESTRE DE OBRAS"),
    ("MARIA","CONTABILISTA");
    
insert into dependentes (NOME, COD_FUNC)
values
	("PEDRO",1),
    ("ALICE",1),
    ("LUANA",3);
    
    insert into dependentes (NOME)
values
	("PAULO");
    
    SELECT * FROM funcionarios;
    SELECT * FROM dependentes;
    
    DROP TABLE dependentes;
    
    
    SELECT FUNC.NOME NOME_FUNC, DEP.NOME NOME_DEP
    FROM funcionarios FUNC
    INNER JOIN dependentes DEP
    ON FUNC.COD = DEP.COD_FUNC;
    
    SELECT funcionarios.NOME NOME_DEP, dependentes.NOME NOME_FUNC
    FROM funcionarios
    INNER JOIN dependentes
    ON funcionarios.COD = dependentes.COD_FUNC
    WHERE funcionarios.COD = 1;
    
    SELECT funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
    FROM funcionarios
    LEFT JOIN dependentes
    ON funcionarios.COD = dependentes.COD_FUNC;
    
    SELECT funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
    FROM funcionarios
    LEFT JOIN dependentes
    ON funcionarios.COD = dependentes.COD_FUNC
    WHERE dependentes.NOME is null;
    
    SELECT funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
    FROM funcionarios
    RIGHT JOIN dependentes
    ON funcionarios.COD = dependentes.COD_FUNC;
    
    SELECT funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
    FROM funcionarios
    RIGHT JOIN dependentes
    ON funcionarios.COD = dependentes.COD_FUNC
	WHERE funcionarios.NOME is null;
    
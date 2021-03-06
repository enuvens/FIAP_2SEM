-- SCRIPT PARA CRIA��O DO BD IMPLANTACAO DE PROJETOS
-- SCRIPT_DDL_IMPLANTACAO_DE_PROJETOS.SQL

-- COMANDO DROP TABLE -> ELIMINA AS TABELAS (CONTE�DO E ESTRUTURA)
-- OP��O CASCADE CONSTRAINTS ELIMINA OS RELACIONAMENTOS
/*
DROP TABLE T_SIP_IMPLANTACAO    CASCADE CONSTRAINTS;
DROP TABLE T_SIP_PROJETO        CASCADE CONSTRAINTS;
DROP TABLE T_SIP_DEPENDENTE     CASCADE CONSTRAINTS;
DROP TABLE T_SIP_ESTADO         CASCADE CONSTRAINTS;
DROP TABLE T_SIP_CIDADE         CASCADE CONSTRAINTS;
DROP TABLE T_SIP_BAIRRO         CASCADE CONSTRAINTS;
DROP TABLE T_SIP_TIPO_LOG       CASCADE CONSTRAINTS;
DROP TABLE T_SIP_ENDERECO       CASCADE CONSTRAINTS;
DROP TABLE T_SIP_FUNC_ENDE      CASCADE CONSTRAINTS;
DROP TABLE T_SIP_FUNCIONARIO    CASCADE CONSTRAINTS;
DROP TABLE T_SIP_DEPARTAMENTO   CASCADE CONSTRAINTS;
*/

-- CRIA��O DAS TABELAS
-- TABELA DEPARTAMENTO
CREATE TABLE T_SIP_DEPARTAMENTO
(
  cd_depto    NUMBER(2)     NOT NULL ,
  nm_depto    VARCHAR2(30)  NOT NULL
);
-- CONTRAINTS (REGRAS OU RESTRI��ES)
-- CHAVE PRIM�RIA
    ALTER TABLE T_SIP_DEPARTAMENTO
 ADD CONSTRAINT PK_SIP_DEPARTAMENTO
    PRIMARY KEY (cd_depto); 
-- UNIQUE (VALORES SEM REPETI��O)
    ALTER TABLE T_SIP_DEPARTAMENTO
 ADD CONSTRAINT UN_SIP_DEPTO_NOME
         UNIQUE (nm_depto);

-- TABELA FUNCIONARIO
CREATE TABLE T_SIP_FUNCIONARIO
(
  nr_matricula      NUMBER(5)    NOT NULL ,
  cd_depto          NUMBER(2)    NOT NULL ,
  nm_funcionario    VARCHAR2(50) NOT NULL ,
  dt_nascimento     DATE             NULL ,
  dt_admissao       DATE         NOT NULL ,
  vl_salario        NUMBER(7,2)  NOT NULL  
);
-- CHAVE PRIM�RIA
   ALTER TABLE T_SIP_FUNCIONARIO
ADD CONSTRAINT PK_SIP_FUNCIONARIO
   PRIMARY KEY (nr_matricuLA);
-- CHECK
   ALTER TABLE T_SIP_FUNCIONARIO
ADD CONSTRAINT CK_SIP_FUNC_SALARIO
         CHECK (VL_SALARIO >= 937);

-- TABELA DEPENDENTE
CREATE TABLE T_SIP_DEPENDENTE
(
  nr_matricula      NUMBER(5)     NOT NULL ,
  cd_dependente     NUMBER(2)     NOT NULL ,
  nm_dependente     VARCHAR2(50)  NOT NULL ,
  dt_nascimento     DATE          NOT NULL
);
-- CHAVE PRIM�RIA
   ALTER TABLE T_SIP_DEPENDENTE
ADD CONSTRAINT PK_SIP_DEPENDENTE
   PRIMARY KEY (nr_matricula, cd_dependente);

-- TABELA PROJETO
CREATE TABLE T_SIP_PROJETO
(
  cd_projeto        NUMBER(5)     NOT NULL ,
  nm_projeto        VARCHAR2(40)  NOT NULL ,
  dt_inicio         DATE          NOT NULL ,
  dt_termino        DATE              NULL
);
-- CHAVE PRIMARIA
   ALTER TABLE T_SIP_PROJETO
ADD CONSTRAINT PK_SIP_PROJETO
   PRIMARY KEY ( cd_projeto );
-- UNIQUE
   ALTER TABLE T_SIP_PROJETO
ADD CONSTRAINT UN_SIP_PROJETO_NOME
        UNIQUE ( nm_projeto );
-- CHECK        
   ALTER TABLE T_SIP_PROJETO
ADD CONSTRAINT CK_SIP_PROJETO_DATA
         CHECK ( dt_termino > dt_inicio );

-- TABELA IMPLANTACAO
CREATE TABLE T_SIP_IMPLANTACAO
(
  cd_implantacao      NUMBER(6)    NOT NULL ,
  nr_matricula        NUMBER(5)    NOT NULL , 
  cd_projeto          NUMBER(5)    NOT NULL ,
  dt_entrada          DATE         NOT NULL ,
  dt_saida            DATE             NULL
);
-- CHAVE PRIM�RIA
   ALTER TABLE T_SIP_IMPLANTACAO
ADD CONSTRAINT PK_SIP_IMPLANTACAO
   PRIMARY KEY (cd_implantacao);
-- CHECK
   ALTER TABLE T_SIP_IMPLANTACAO
ADD CONSTRAINT CK_SIP_IMPLANT_DATA
         CHECK (dt_saida > dt_entrada);


-- TABELA ESTADO
CREATE TABLE T_SIP_ESTADO
(
  cd_estado       NUMBER(2)       NOT NULL ,
  nm_estado       VARCHAR2(25)    NOT NULL ,
  sg_estado       CHAR(2)         NOT NULL
);
-- CHAVE PRIMARIA
   ALTER TABLE T_SIP_ESTADO
ADD CONSTRAINT PK_SIP_ESTADO
   PRIMARY KEY (cd_estado);
-- UNIQUE
   ALTER TABLE T_SIP_ESTADO
ADD CONSTRAINT UN_SIP_ESTADO_NOME_SIGLA
        UNIQUE (nm_estado, sg_estado);

-- TABELA CIDADE
CREATE TABLE T_SIP_CIDADE
(
  cd_cidade     NUMBER(5)     NOT NULL ,
  cd_estado     NUMBER(2)     NOT NULL ,
  nm_cidade     VARCHAR2(30)  NOT NULL
);
-- CHAVE PRIMARIA
   ALTER TABLE T_SIP_CIDADE
ADD CONSTRAINT PK_SIP_CIDADE
   PRIMARY KEY (cd_cidade);

-- TABELA BAIRRO
CREATE TABLE T_SIP_BAIRRO
(
  cd_bairro     NUMBER(5)     NOT NULL ,
  cd_cidade     NUMBER(5)     NOT NULL ,
  nm_bairro     VARCHAR2(25)  NOT NULL
);
-- CHAVE PRIMARIA
   ALTER TABLE T_SIP_BAIRRO
ADD CONSTRAINT PK_SIP_BAIRRO
   PRIMARY KEY (cd_bairro);
   
-- TABELA TIPO LOGRADOURO
CREATE TABLE T_SIP_TIPO_LOG
(
  cd_tipo_log     NUMBER(2)     NOT NULL ,
  ds_tipo_log     VARCHAR2(20)  NOT NULL
);
-- CHAVE PRIMARIA
   ALTER TABLE T_SIP_TIPO_LOG
ADD CONSTRAINT PK_SIP_TIPO_LOG
   PRIMARY KEY (cd_tipo_log);

-- TABELA ENDERECO
CREATE TABLE T_SIP_ENDERECO
(
  nr_cep        NUMBER(8)     NOT NULL ,
  cd_tipo_log   NUMBER(2)     NOT NULL ,
  cd_bairro     NUMBER(5)     NOT NULL ,
  ds_endereco   VARCHAR2(50)  NOT NULL
);
-- CHAVE PRIMARIA
   ALTER TABLE T_SIP_ENDERECO
ADD CONSTRAINT PK_SIP_ENDERECO
   PRIMARY KEY (nr_cep);
   
-- TABELA FUNCIONARIO_ENDERECO
CREATE TABLE T_SIP_FUNC_ENDE
(
  nr_cep          NUMBER(8)     NOT NULL ,
  nr_matricula    NUMBER(5)     NOT NULL ,
  nr_logradouro   NUMBER(5)     NOT NULL ,
  ds_complemento  VARCHAR2(20)      NULL
);
-- CHAVE PRIMARIA
   ALTER TABLE T_SIP_FUNC_ENDE
ADD CONSTRAINT PK_SIP_FUNC_ENDE
   PRIMARY KEY (nr_cep, nr_matricula);

-- CHAVES ESTRANGEIRAS
-- RELACIONAMENTO ENTRE FUNCIONARIO E DEPARTAMENTO
   ALTER TABLE T_SIP_FUNCIONARIO
ADD CONSTRAINT FK_SIP_FUNC_DEPTO
   FOREIGN KEY (cd_depto)
    REFERENCES T_SIP_DEPARTAMENTO (cd_depto);
    
-- RELACIONAMENTO ENTRE DEPENDENTE E FUNCIONARIO    
    ALTER TABLE T_SIP_DEPENDENTE
ADD CONSTRAINT FK_SIP_DEPENDENTE_FUNC
   FOREIGN KEY (nr_matricula)
    REFERENCES T_SIP_FUNCIONARIO (nr_matricula);

-- RELACIONAMENTO ENTRE IMPLANTACAO E FUNCIONARIO
   ALTER TABLE T_SIP_IMPLANTACAO
ADD CONSTRAINT FK_SIP_IMPLANT_FUNC
   FOREIGN KEY (nr_matricula)
    REFERENCES T_SIP_FUNCIONARIO (nr_matricula);
    
-- RELACIONAMENTO ENTRE IMPLANTACAO E PROJETO
   ALTER TABLE T_SIP_IMPLANTACAO
ADD CONSTRAINT FK_SIP_IMPLANT_PROJETO
   FOREIGN KEY (cd_projeto)
    REFERENCES T_SIP_PROJETO (cd_projeto);

-- RELACIONAMENTO ENTRE CIDADE E ESTADO
   ALTER TABLE T_SIP_CIDADE
ADD CONSTRAINT FK_SIP_CIDADE_ESTADO
   FOREIGN KEY (cd_estado)
    REFERENCES T_SIP_ESTADO (cd_estado);

-- RELACIONAMENTO ENTRE BAIRRO E CIDADE
   ALTER TABLE T_SIP_BAIRRO
ADD CONSTRAINT FK_SIP_BAIRRO_CIDADE
   FOREIGN KEY (cd_cidade)
    REFERENCES T_SIP_CIDADE (cd_cidade);

-- RELACIONAMENTO ENTRE ENDERECO E TIPO LOGRADOURO
   ALTER TABLE T_SIP_ENDERECO
ADD CONSTRAINT FK_SIP_ENDE_TIPO_LOG
   FOREIGN KEY (cd_tipo_log)
    REFERENCES T_SIP_TIPO_LOG (cd_tipo_log);
    
-- RELACIONAMENTO ENTRE ENDERECO E BAIRRO
   ALTER TABLE T_SIP_ENDERECO
ADD CONSTRAINT FK_SIP_ENDE_BAIRRO
   FOREIGN KEY (cd_bairro)
    REFERENCES T_SIP_BAIRRO (cd_bairro);

-- RELACIONAMENTO ENTRE FUNC_ENDE E ENDERECO   
   ALTER TABLE T_SIP_FUNC_ENDE
ADD CONSTRAINT FK_SIP_FUNC_ENDE_ENDE
   FOREIGN KEY (nr_cep)
    REFERENCES T_SIP_ENDERECO (nr_cep);

-- RELACIONAMENTO ENTRE FUNC_ENDE E FUNCIONARIO
   ALTER TABLE T_SIP_FUNC_ENDE
ADD CONSTRAINT FK_SIP_FUNC_ENDE_FUNC
   FOREIGN KEY (nr_matricula)
    REFERENCES T_SIP_FUNCIONARIO (nr_matricula);
    
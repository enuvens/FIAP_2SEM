----------------------------------------------------------
-- EXEMPLO - RELACIONAMENTO NAO OBRIGATÓRIO - SCRIPT DDL
----------------------------------------------------------

/*
DROP TABLE T_SCA_INSTITUICAO CASCADE CONSTRAINT;
DROP TABLE T_SCA_ALUNO       CASCADE CONSTRAINT;
*/

CREATE TABLE T_SCA_INSTITUICAO 
    ( 
     cd_instituicao NUMBER (5)  NOT NULL , 
     ds_razao_social VARCHAR2 (30)  NOT NULL , 
     nr_cnpj NUMBER (15)  NOT NULL ,        
     ds_email VARCHAR2 (60) , 
     nr_telefone NUMBER (9)  NOT NULL , 
     nm_contato VARCHAR2 (30)  NOT NULL , 
     vl_percentual_desconto NUMBER (5,2)  NOT NULL 
    );

ALTER TABLE T_SCA_INSTITUICAO 
    ADD CONSTRAINT PK_SCA_INSTITUICAO PRIMARY KEY ( cd_instituicao ) ;


CREATE TABLE T_SCA_ALUNO 
    ( 
     nr_matricula NUMBER (5)  NOT NULL , 
     cd_instituicao NUMBER (5) , 
     nm_aluno VARCHAR2 (60)  NOT NULL , 
     nr_cpf NUMBER (11)  NOT NULL , 
     nr_rg CHAR (10)  NOT NULL ,      
     dt_nascimento DATE  NOT NULL , 
     ds_sexo CHAR (1)  NOT NULL , 
     dt_matricula DATE  NOT NULL 
    );

ALTER TABLE T_SCA_ALUNO 
    ADD CONSTRAINT PK_SCA_ALUNO PRIMARY KEY ( nr_matricula ) ;

ALTER TABLE T_SCA_ALUNO 
    ADD CONSTRAINT FK_SCA_INST_ALUNO FOREIGN KEY 
    ( 
     cd_instituicao
    ) 
    REFERENCES T_SCA_INSTITUICAO 
    ( 
     cd_instituicao
    ) 
    ON DELETE SET NULL 
;


/*
DELETE FROM T_SCA_INSTITUICAO;
DELETE FROM T_SCA_ALUNO;
*/

-- INSERT´s PARA POPULAR A TABELA
INSERT INTO T_SCA_INSTITUICAO 
       ( cd_instituicao, ds_razao_social , nr_cnpj, ds_email, nr_telefone, nm_contato, vl_percentual_desconto )
VALUES ( 1, 'EMPRESA XYZ LTDA.' , 12345678901,'XYZ@XYZ.COM.BR', 12345789, 'MARIA APARECIDA', 3.5);    
INSERT INTO T_SCA_INSTITUICAO 
       ( cd_instituicao, ds_razao_social , nr_cnpj, ds_email, nr_telefone, nm_contato, vl_percentual_desconto )
VALUES ( 2, 'EMPRESA ABC LTDA.' , 12345678912,'ABC@ABC.COM.BR', 12121121, 'JOAO XAVIER', 1.8);   
INSERT INTO T_SCA_INSTITUICAO 
       ( cd_instituicao, ds_razao_social , nr_cnpj, ds_email, nr_telefone, nm_contato, vl_percentual_desconto )
VALUES ( 3, 'EMPRESA BCD LTDA.' , 12345678923,'BCD@BCD.COM.BR', 31313331, 'CARMEM MIRANDA', 5.25);   
INSERT INTO T_SCA_INSTITUICAO 
       ( cd_instituicao, ds_razao_social , nr_cnpj, ds_email, nr_telefone, nm_contato, vl_percentual_desconto )
VALUES ( 4, 'EMPRESA EFG LTDA.' , 12345678943,'EFG@EFG.COM.BR', 43235686, 'DOMINGUINHOS', 3.9);   
COMMIT;
SELECT * FROM T_SCA_INSTITUICAO;


INSERT INTO T_SCA_ALUNO 
    ( nr_matricula, cd_instituicao, nm_aluno, nr_cpf, nr_rg, dt_nascimento, ds_sexo, dt_matricula )
VALUES
    ( 12345, 1,'MARIA DAS FLORES', 125612345,12347890,TO_DATE('02/04/1985','DD/MM/YYYY'),'F',TO_DATE('10/08/2013','DD/MM/YYYY'));
INSERT INTO T_SCA_ALUNO 
    ( nr_matricula, cd_instituicao, nm_aluno, nr_cpf, nr_rg, dt_nascimento, ds_sexo, dt_matricula )
VALUES
    ( 12346, 1,'JOÃO ROSA', 3223412345,32347890,TO_DATE('12/04/1980','DD/MM/YYYY'),'M',TO_DATE('12/08/2013','DD/MM/YYYY'));   
INSERT INTO T_SCA_ALUNO 
    ( nr_matricula, cd_instituicao, nm_aluno, nr_cpf, nr_rg, dt_nascimento, ds_sexo, dt_matricula )
VALUES
    ( 12347, NULL,'CAROLINA FERRAZ', 4223412345,42347890,TO_DATE('27/09/1980','DD/MM/YYYY'),'F',TO_DATE('20/07/2013','DD/MM/YYYY'));     
INSERT INTO T_SCA_ALUNO 
    ( nr_matricula, cd_instituicao, nm_aluno, nr_cpf, nr_rg, dt_nascimento, ds_sexo, dt_matricula )
VALUES
    ( 12348, 2,'ROBERTO CARLOS', 5223452345,52345690,TO_DATE('15/05/1990','DD/MM/YYYY'),'M',TO_DATE('20/04/2013','DD/MM/YYYY'));  
INSERT INTO T_SCA_ALUNO 
    ( nr_matricula, cd_instituicao, nm_aluno, nr_cpf, nr_rg, dt_nascimento, ds_sexo, dt_matricula )
VALUES
    ( 12349, NULL,'SILVIO SANTOS', 6225612345,62345890,TO_DATE('19/11/1970','DD/MM/YYYY'),'M',TO_DATE('25/07/2013','DD/MM/YYYY'));     
COMMIT;
SELECT * FROM T_SCA_ALUNO;

-- CONSULTAS SEPARADAS EM CADA TABELA
SELECT * FROM T_SCA_INSTITUICAO;
SELECT * FROM T_SCA_ALUNO;

-- FULL OUTER JOIN
  SELECT I.CD_INSTITUICAO   ,
         I.DS_RAZAO_SOCIAL  ,
         AL.NR_MATRICULA    ,
         AL.NM_ALUNO        ,
         AL.CD_INSTITUICAO
    FROM T_SCA_INSTITUICAO I FULL OUTER JOIN T_SCA_ALUNO AL
         ON ( I.CD_INSTITUICAO = AL.CD_INSTITUICAO )
   WHERE I.CD_INSTITUICAO IS NULL OR
         AL.CD_INSTITUICAO IS NULL
         ;
         
    
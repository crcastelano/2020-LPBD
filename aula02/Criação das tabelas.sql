-- DROP DAS TABELAS

DROP TABLE CLIENTE_TELEFONE;
DROP TABLE TELEFONE;
DROP TABLE TELEFONE_TIPO;
DROP TABLE VENDA_PRODUTO;
DROP TABLE VENDA;
DROP TABLE CLIENTE;
DROP TABLE PRODUTO;

CREATE TABLE CLIENTE 
(
	CLI_CODIGO SERIAL NOT NULL,
	CLI_CPF VARCHAR (15),
	CLI_RG VARCHAR (15),
	CLI_NOME VARCHAR (80),
	CLI_ENDE VARCHAR (80),
	CLI_ENDENUM VARCHAR (10),
	CLI_ENDECOMPL VARCHAR (30),
	CLI_BAIRRO VARCHAR (80),
	CLI_ESTADO CHAR (2),
	CLI_CEP VARCHAR (9),
	CLI_NASCIMENTO DATE
);

CREATE TABLE TELEFONE 
(
	TEL_CODIGO SERIAL NOT NULL,
	TT_CODIGO INTEGER NOT NULL,
	TEL_DDD INTEGER,
	TEL_FONE VARCHAR (9)
);

CREATE TABLE PRODUTO 
(
	PRO_CODIGO SERIAL NOT NULL,
	PRO_NOME VARCHAR (80),
	PRO_ESTOQUE NUMERIC (12,4),
	PRO_VENDA NUMERIC (12,2),
	PRO_COMPRA NUMERIC (12,2),
	PRO_UNIDADE VARCHAR(3)
);

CREATE TABLE VENDA 
(
	VEN_CODIGO SERIAL NOT NULL,
	CLI_CODIGO INTEGER NOT NULL,
	VEN_DATA DATE,
	VEN_TOTAL NUMERIC (8,2),
	VEN_OBS TEXT
);

CREATE TABLE CLIENTE_TELEFONE  
(
	CLI_CODIGO INTEGER NOT NULL ,
	TEL_CODIGO INTEGER NOT NULL
);

CREATE TABLE TELEFONE_TIPO
(
	TT_CODIGO SERIAL NOT NULL,
	TT_NOME 	 VARCHAR (40)
);

CREATE TABLE VENDA_PRODUTO
(
	VEN_CODIGO 	INTEGER NOT NULL,
	PRO_CODIGO 	INTEGER NOT NULL,
	VP_VALOR 	NUMERIC (14,2),
	VP_QTDE 		NUMERIC (14,2)
);

-- PRIMARY KEYS--
ALTER TABLE CLIENTE       ADD CONSTRAINT PK_CLIENTE 		 PRIMARY KEY (CLI_CODIGO);
ALTER TABLE TELEFONE      ADD CONSTRAINT PK_TELEFONE 		 PRIMARY KEY (TEL_CODIGO);
ALTER TABLE PRODUTO 		  ADD CONSTRAINT PK_PRODUTO 		 PRIMARY KEY (PRO_CODIGO);
ALTER TABLE VENDA 		  ADD CONSTRAINT PK_VENDA         PRIMARY KEY (VEN_CODIGO);
ALTER TABLE TELEFONE_TIPO ADD CONSTRAINT PK_TELEFONE_TIPO PRIMARY KEY (TT_CODIGO);

------------------------------------------------------

-- SECUNDARIA TELEFONE_TIPO --
ALTER TABLE TELEFONE 
    ADD CONSTRAINT FK_TELEFONE_TELEFONE_TIPO
    FOREIGN KEY (TT_CODIGO)
    REFERENCES TELEFONE_TIPO (TT_CODIGO)
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;
   
--SECUNDARIA VENDA	--
ALTER TABLE VENDA 
    ADD CONSTRAINT FK_VENDA_CLIENTE
    FOREIGN KEY (CLI_CODIGO)
    REFERENCES CLIENTE (CLI_CODIGO)
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;   

-- SECUNDÁRIA VENDA_PRODUTO
ALTER TABLE VENDA_PRODUTO
    ADD CONSTRAINT FK_VENDA_PRODUTO_PRODUTO
    FOREIGN KEY (PRO_CODIGO)
    REFERENCES PRODUTO (PRO_CODIGO)
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;
   
ALTER TABLE VENDA_PRODUTO
    ADD CONSTRAINT FK_VENDA_PRODUTO_VENDA
    FOREIGN KEY (VEN_CODIGO)
    REFERENCES VENDA (VEN_CODIGO)
    ON UPDATE NO ACTION
    ON DELETE RESTRICT;

-- SECUNDÁRIA CLIENTE_TELEFONE
ALTER TABLE CLIENTE_TELEFONE
	 ADD CONSTRAINT FK_CLIENTE_TELEFONE_CLIENTE
	 FOREIGN KEY (CLI_CODIGO)
	 REFERENCES CLIENTE (CLI_CODIGO)
	 ON UPDATE NO ACTION
	 ON DELETE RESTRICT;

ALTER TABLE CLIENTE_TELEFONE
	 ADD CONSTRAINT FK_CLIENTE_TELEFONE_TELEFONE
	 FOREIGN KEY (TEL_CODIGO)
	 REFERENCES TELEFONE (TEL_CODIGO)
	 ON UPDATE NO ACTION
	 ON DELETE RESTRICT;

-- FIM -------------------------------------------------------
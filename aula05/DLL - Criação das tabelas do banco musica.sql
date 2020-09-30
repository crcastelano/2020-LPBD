-- criar tabela gravadora
CREATE TABLE Gravadora 
( 
	grav_id 			serial NOT NULL, 
   grav_nome 		varchar(50), 
   grav_tel 		numeric(25), 
   grav_contato 	varchar(50) 
);

-- criar tabela CD
CREATE TABLE CD 
( 
	cd_id					integer NOT NULL, 
   cd_nome 				varchar(100), 
   cd_preco_venda 	numeric(5,2), 
   cd_dt_lancamento 	date, 
   grav_id 				integer 
); 

-- criar tabela Música  
CREATE TABLE Musica
( 
	mus_id			integer NOT NULL, 
	mus_nome 		varchar(50), 
	mus_duracao    numeric(5,2) 
);

-- criar tabela Autor
CREATE TABLE Autor 
(
	aut_id			integer NOT NULL,
	aut_nome 		varchar(50) 
); 

-- criar tabela mus_autor; 
CREATE TABLE mus_autor
( 
	mus_id			integer NOT NULL,
   aut_id 			integer NOT NULL
);

-- criar tabela item_cd
CREATE TABLE item_cd
( 
	item_faixa 		integer NOT NULL,
	cd_id				integer NOT NULL,
   mus_id 			integer NOT NULL
); 

-- chaves primárias
ALTER TABLE Gravadora	ADD CONSTRAINT PK_GRAVADORA 	PRIMARY KEY(grav_id);
ALTER TABLE CD 			ADD CONSTRAINT PK_CD 			PRIMARY KEY(cd_id);
ALTER TABLE musica 		ADD CONSTRAINT PK_MUSICA		PRIMARY KEY(mus_id);
ALTER TABLE autor 		ADD CONSTRAINT PK_AUTOR			PRIMARY KEY(aut_id);
ALTER TABLE mus_autor 	ADD CONSTRAINT PK_MUS_AUTOR 	PRIMARY KEY(mus_id, aut_id); --chave composta
ALTER TABLE item_cd 		ADD CONSTRAINT PK_ITEM_CD 		PRIMARY KEY(item_faixa);

-- chaves secundárias
ALTER TABLE CD 
	ADD CONSTRAINT fk_cd_gravadora
	FOREIGN KEY (grav_id) 
	REFERENCES Gravadora(grav_id); 

ALTER TABLE mus_autor 
  	ADD CONSTRAINT fk_mus_autor_musica 
   FOREIGN KEY (mus_id) 
   REFERENCES Musica (mus_id); 
  
ALTER TABLE mus_autor
   ADD CONSTRAINT fk_mus_autor_autor 
   FOREIGN KEY (mus_id) 
   REFERENCES Musica (mus_id); 

ALTER TABLE item_cd 
	ADD CONSTRAINT fk_item_cd_musica 
	FOREIGN KEY (mus_id) 
	REFERENCES Musica (mus_id); 
	
ALTER TABLE item_cd 
	ADD CONSTRAINT fk_item_cd_cd
	FOREIGN KEY (cd_id) 
	REFERENCES CD(cd_id);






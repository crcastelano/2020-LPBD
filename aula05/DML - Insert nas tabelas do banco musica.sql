INSERT INTO gravadora (grav_nome, grav_tel, grav_contato)
VALUES ('EMI', '112233445', 'Jose Vitor'),
		 ('Poligram', '368879000', 'Joaquim'),
		 ('Sony', '564545777', 'Pedro'),
		 ('Globo', '113232444', 'Josefina');

INSERT INTO CD (cd_nome, cd_preco_venda, cd_dt_lancamento, grav_id)
VALUES ('Mais do Mesmo', 20.50, '21.12.98', 1),
		 ('Bate Boca', 19.00, '12.12.79', 1),
		 ('Perfil', 17.50, '23.06.99', 3),
		 ('Essa Mulher', 23.10, '01.07.85', 2),
		 ('Perfil 2', 18.00, '20.02.2001', 3),
		 ('Grande Encontro', 30.00, '30.12.2002', 2);

INSERT INTO Autor (aut_nome)
VALUES ('Renato Russo'),
		 ('Ton Jobim'),
		 ('Elis Regina');

INSERT INTO Musica (mus_nome, mus_duracao)
VALUES ('Será', 2.0),
		 ('Ainda é Cedo', 3.02),
		 ('A Violeira', 2.30),
		 ('Anos Dourados', 2.11),
		 ('Imagina', 1.40);

INSERT INTO item_cd (cd_id, mus_id, item_faixa)
VALUES (1, 1, 1),
		 (1, 2, 2),
		 (2, 5, 6);

INSERT INTO mus_autor (mus_id, aut_id)
VALUES (1, 1),
		 (2, 1),
		 (3, 3),
		 (4, 3),
		 (5, 2);

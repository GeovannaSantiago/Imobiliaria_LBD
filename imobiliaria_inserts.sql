INSERT INTO tb_cargo VALUES (1, 'secretario', 1500.00);
INSERT INTO tb_cargo VALUES (2, 'corretor', 2600.00);
INSERT INTO tb_cargo VALUES (3, 'consultor', 2200.00);

INSERT INTO tb_unidade_federativa VALUES (1, 'MS');
INSERT INTO tb_unidade_federativa VALUES (2, 'MT');
INSERT INTO tb_unidade_federativa VALUES (3, 'SP');

INSERT INTO tb_documentacao_venda VALUES (1, 'a1.png','b1.png', 'c1.png', 'd1.png', 'e1.png', 'f1.png', 'g1.png');
INSERT INTO tb_documentacao_venda VALUES (2, 'a2.png','b2.png', 'c2.png', 'd2.png', 'e2.png', 'f2.png', 'g2.png');
INSERT INTO tb_documentacao_venda VALUES (3, 'a3.png','b3.png', 'c3.png', 'd3.png', 'e3.png', 'f3.png', 'g3.png');

INSERT INTO tb_estado VALUES (1, 'Mato Grosso do Sul');
INSERT INTO tb_estado VALUES (2, 'Mato Grosso');
INSERT INTO tb_estado VALUES (3, 'São Paulo');

INSERT INTO tb_cidade VALUES (1, 'Campo Grande', 1);
INSERT INTO tb_cidade VALUES (2, 'Cuiabá', 2);
INSERT INTO tb_cidade VALUES (3, 'Santos', 3);

INSERT INTO tb_bairro VALUES (1, 'Centro', 1);
INSERT INTO tb_bairro VALUES (2, 'Los Angeles', 2);
INSERT INTO tb_bairro VALUES (3, 'Marapé', 3);

INSERT INTO tb_logradouro (cd_logradouro, nm_logradouro, cd_bairro) VALUES (1, 'Rua A', 1);
INSERT INTO tb_logradouro (cd_logradouro, nm_logradouro, cd_bairro) VALUES (2, 'Rua B', 2);
INSERT INTO tb_logradouro (cd_logradouro, nm_logradouro, cd_bairro) VALUES (3, 'Rua C', 3);

INSERT INTO tb_pessoa VALUES ('14725639855', 'Maria Fernanda', 'F', 'Solteira', 1);
INSERT INTO tb_pessoa VALUES ('52148575963', 'Gabriel Guedes', 'M', 'Casado',  2);
INSERT INTO tb_pessoa VALUES ('52147859632', 'Juliana Oliveira', 'F', 'Casada', 3);
INSERT INTO tb_pessoa VALUES ('25410236522', 'Vilma Silva', 'F', 'Solteira', 1);
INSERT INTO tb_pessoa VALUES ('25415242856', 'André Andrade', 'M', 'Casado', 2);
INSERT INTO tb_pessoa VALUES ('56235124766', 'Joana Vilhena', 'F', 'Casada', 3);
INSERT INTO tb_pessoa VALUES ('36589574125', 'Guilherme Pires', 'M', 'Casado', 1);
INSERT INTO tb_pessoa VALUES ('23585475123', 'Heitor Barreto', 'M', 'Casado', 2);
INSERT INTO tb_pessoa VALUES ('26589654125', 'Giulia Lourenço', 'F', 'Casada', 3);
INSERT INTO tb_pessoa VALUES ('65236974221', 'Clara Viana', 'F', 'Solteira', 2);

INSERT INTO tb_proprietario VALUES (1, 'maria.fernanda@email.com', 'Consultora', '14725639855');
INSERT INTO tb_proprietario VALUES (2, 'gabriel.guedes@email.com', 'Secretário', '52148575963');
INSERT INTO tb_proprietario VALUES (3, 'juliana.oliveira@email.com', 'Corretora', '52147859632');

INSERT INTO tb_funcionario VALUES(1, '2015-03-01', '2200.60', 'vilma.silva', '123mf456', '25410236522', 1);
INSERT INTO tb_funcionario VALUES(2, '2016-06-03', '2150.00', 'andre.andrade', '789gg1011', '25415242856', 2);
INSERT INTO tb_funcionario VALUES(3, '2018-08-17', '1980.50', 'joana.vilhena', '121314jo15', '56235124766', 3);

INSERT INTO tb_comprador VALUES(1, 'anônimo', 1, '36589574125');
INSERT INTO tb_comprador VALUES(2, 'público', 2, '23585475123');
INSERT INTO tb_comprador VALUES(3, 'público', 3, '26589654125');
INSERT INTO tb_comprador VALUES(4, 'público', 1, '65236974221');

INSERT INTO tb_indicacao VALUES(1, 'Eu, João Moreira atesto que o locatário é de confiança', 1);
INSERT INTO tb_indicacao VALUES(2, 'Eu, Pedro Arthur atesto que o locatário é de confiança', 1);
INSERT INTO tb_indicacao VALUES(3, 'Eu, Carlos Vieira atesto que o locatário é de confiança', 2);
INSERT INTO tb_indicacao VALUES(4, 'Eu, Amanda Nascimento atesto que o locatário é de confiança', 2);
INSERT INTO tb_indicacao VALUES(5, 'Eu, Priscila Alves atesto que o locatário é de confiança', 3);
INSERT INTO tb_indicacao VALUES(6, 'Eu, Fernanda Karla atesto que o locatário é de confiança', 3);

INSERT INTO tb_fiador VALUES(1, 'solidário', 1, 1);
INSERT INTO tb_fiador VALUES(2, 'solidário', 2, 2);
INSERT INTO tb_fiador VALUES(3, 'subsidiário', 3, 3);

INSERT INTO tb_seguro_fianca VALUES(1, '541256396', 'ir1.png', 'holerite1.png', 50.000, 1);
INSERT INTO tb_seguro_fianca VALUES(2, '236985632', 'ir2.png', 'holerite2.png', 20.000, 2);
INSERT INTO tb_seguro_fianca VALUES(3, '663245265', 'ir3.png', 'holerite3.png', 35.000, 3);

INSERT INTO tb_imovel VALUES(201612, '2005-06-25', 123.000, '2015-06-13', 'disponível', 'venda', 150, 'a1.png', '25415242856');
INSERT INTO tb_imovel VALUES(201713, '2000-01-08', 200.000, '2018-04-04', 'disponível', 'locação', 160, 'b1.png', '56235124766');
INSERT INTO tb_imovel VALUES(201814, '1990-06-06', 423.000, '2019-01-26', 'indisponível', 'venda', 600, 'c1.png', '52147859632');

INSERT INTO tb_moradia VALUES(1, 4, 2, 1, 1, 2, true, 'casa no campo', 201612);
INSERT INTO tb_moradia VALUES(2, 4, 2, 1, 1, 2, false, 'vista pro mar', 201713);
INSERT INTO tb_moradia VALUES(3, 6, 3, 2, 2, 3, true, 'casa no lago', 201814);

INSERT INTO tb_apartamento VALUES(1, 3, true, 200, 1);
INSERT INTO tb_apartamento VALUES(2, 10, true, 200, 2);
INSERT INTO tb_apartamento VALUES(3, 23, true, 500, 3);

INSERT INTO tb_sala_comercial VALUES(1, 1, 3, 201612);
INSERT INTO tb_sala_comercial VALUES(2, 2, 4, 201713);
INSERT INTO tb_sala_comercial VALUES(3, 3, 4, 201814);

INSERT INTO tb_terreno VALUES(1, 25.6, 56.5, true, 201612);
INSERT INTO tb_terreno VALUES(2, 52.56, 856.4, false, 201713);
INSERT INTO tb_terreno VALUES(3, 256.45, 488.45, true, 201814);

INSERT INTO tb_transacao VALUES(1, 120000.00, '2016-06-23', 10, 3500.00, '14725639855', 201612, 1);
INSERT INTO tb_transacao VALUES(2, 150000, '2017-02-03', 5, 2700.00, '25410236522', 201713, 2);
INSERT INTO tb_transacao VALUES(3, 100000, '2019-05-03', 7, 1956.00, '36589574125', 201814, 3);

INSERT INTO tb_forma_pagamento VALUES(1,'crédito');
INSERT INTO tb_forma_pagamento VALUES(2, 'cheque');
INSERT INTO tb_forma_pagamento VALUES(3, 'débito');

INSERT INTO tb_item_transacao_pagamento VALUES(1, 3);
INSERT INTO tb_item_transacao_pagamento VALUES(2, 1);
INSERT INTO tb_item_transacao_pagamento VALUES(3, 2);
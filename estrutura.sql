CREATE SCHEMA imobiliaria;
SET search_path TO imobiliaria;

CREATE TABLE tb_cargo (
	cd_cargo SERIAL NOT NULL,
	nm_cargo TEXT NOT NULL,
	vl_salario_base NUMERIC NOT NULL,
	CONSTRAINT pk_cargo PRIMARY KEY(cd_cargo)
);

CREATE TABLE tb_unidade_federativa (
	cd_unidade_federativa SERIAL NOT NULL,
	sg_unidade_federativa CHAR(2) NOT NULL,
	CONSTRAINT pk_unidade_federativa PRIMARY KEY(cd_unidade_federativa)
);

CREATE TABLE tb_documentacao_venda (
	cd_documentacao_venda SERIAL NOT NULL,
	img_registro_compra_venda TEXT NOT NULL,
	img_certidao_nasc_proprietario TEXT NOT NULL,
	img_certidao_interdicao_tutela TEXT NOT NULL,
	img_certidao_registro_imovel TEXT NOT NULL,
	img_certidao_onus_reais TEXT NOT NULL,
	img_certidao_quitacao_fiscal TEXT NOT NULL,
	img_registro_escritura TEXT NOT NULL,
	CONSTRAINT pk_documentacao_venda PRIMARY KEY (cd_documentacao_venda)
);

CREATE TABLE tb_forma_pagamento (
	cd_forma_pagamento SERIAL NOT NULL,
	nm_forma_pagamento TEXT NOT NULL,
	CHECK (nm_forma_pagamento IN ('crédito', 'débito', 'dinheiro', 'cheque')),
	CONSTRAINT pk_forma_pagamento PRIMARY KEY(cd_forma_pagamento)
);

CREATE TABLE tb_estado (
	cd_estado SERIAL NOT NULL,
	nm_estado TEXT NOT NULL,
	cd_unidade_federativa INTEGER,
	CONSTRAINT pk_estado PRIMARY KEY(cd_estado),
	CONSTRAINT fk_estado_uf FOREIGN KEY (cd_unidade_federativa) REFERENCES tb_unidade_federativa
);

CREATE TABLE tb_cidade (
	cd_cidade SERIAL NOT NULL,
	nm_cidade TEXT NOT NULL,
	cd_estado INTEGER,
	CONSTRAINT pk_cidade PRIMARY KEY(cd_cidade),
	CONSTRAINT fk_cidade_estado FOREIGN KEY (cd_estado) REFERENCES tb_estado
);

CREATE TABLE tb_bairro (
	cd_bairro SERIAL NOT NULL,
	nm_bairro TEXT NOT NULL,
	cd_cidade INTEGER,
	CONSTRAINT pk_bairro PRIMARY KEY(cd_bairro),
	CONSTRAINT fk_bairro_cidade FOREIGN KEY (cd_cidade) REFERENCES tb_cidade
);

CREATE TABLE tb_logradouro (
	cd_logradouro SERIAL NOT NULL,
	nm_logradouro TEXT NOT NULL,
	cd_bairro INTEGER,
	cd_matricula_imovel INTEGER,
	CONSTRAINT pk_logradouro PRIMARY KEY(cd_logradouro),
	CONSTRAINT fk_logradouro_bairro FOREIGN KEY (cd_bairro) REFERENCES tb_bairro
);

CREATE TABLE tb_pessoa (
	cd_cpf CHARACTER VARYING(11) NOT NULL,
	nm_pessoa TEXT NOT NULL,
	sg_sexo CHAR(1) NOT NULL,
	nm_estado_civil TEXT NOT NULL,
	cd_logradouro INTEGER,
	CHECK (sg_sexo IN ('F', 'M')),
	CONSTRAINT pk_pessoa PRIMARY KEY(cd_cpf),
	CONSTRAINT fk_pessoa_logradouro FOREIGN KEY (cd_logradouro) REFERENCES tb_logradouro
);

CREATE TABLE tb_proprietario (
	cd_proprietario SERIAL NOT NULL,
	nm_email TEXT NOT NULL,
	nm_profissao TEXT NOT NULL,
	cd_cpf CHARACTER VARYING(11),
	CONSTRAINT pk_proprietario PRIMARY KEY (cd_proprietario),
	CONSTRAINT fk_proprietario_pessoa FOREIGN KEY (cd_cpf) REFERENCES tb_pessoa
);

CREATE TABLE tb_funcionario (
	cd_funcionario SERIAL NOT NULL,
	dt_ingresso DATE NOT NULL,
	vl_salario NUMERIC NOT NULL,
	nm_login TEXT NOT NULL,
	nm_senha CHARACTER VARYING(128) NOT NULL,
	cd_cpf CHARACTER VARYING(11),
	cd_cargo INTEGER,
	CONSTRAINT pk_funcionario PRIMARY KEY (cd_funcionario),
	CONSTRAINT fk_funcionario_pessoa FOREIGN KEY (cd_cpf) REFERENCES tb_pessoa,
	CONSTRAINT fk_funcionario_cargo FOREIGN KEY (cd_cargo) REFERENCES tb_cargo
);

CREATE TABLE tb_comprador (
	cd_comprador SERIAL NOT NULL,
	ic_comprador TEXT NOT NULL,
	cd_proprietario INTEGER,
	cd_cpf CHARACTER VARYING(11),
	CHECK (ic_comprador IN ('anônimo', 'público')),
	CONSTRAINT pk_comprador PRIMARY KEY (cd_comprador),
	CONSTRAINT fk_comprador_proprietario FOREIGN KEY (cd_proprietario) REFERENCES tb_proprietario,
	CONSTRAINT fk_comprador_pessoa FOREIGN KEY (cd_cpf) REFERENCES tb_pessoa
);


CREATE TABLE tb_indicacao (
	cd_indicacao SERIAL NOT NULL,
	ds_indicacao TEXT NOT NULL,
	cd_comprador INTEGER,
	CONSTRAINT pk_indicacao PRIMARY KEY (cd_indicacao),
	CONSTRAINT fk_indicacao_comprador FOREIGN KEY (cd_comprador) REFERENCES tb_comprador
);

CREATE TABLE tb_fiador (
	cd_fiador SERIAL NOT NULL,
	ic_tipo_fiador TEXT NOT NULL,
	cd_proprietario INTEGER,
	cd_comprador INTEGER,
	CHECK (ic_tipo_fiador IN ('solidário', 'subsidiário')),
	CONSTRAINT pk_fiador PRIMARY KEY (cd_fiador),
	CONSTRAINT fk_fiador_proprietario FOREIGN KEY (cd_proprietario) REFERENCES tb_proprietario,
	CONSTRAINT fk_fiador_comprador FOREIGN KEY (cd_comprador) REFERENCES tb_comprador
);

CREATE TABLE tb_seguro_fianca (
	cd_seguro_fianca SERIAL NOT NULL,
	nm_rg CHARACTER VARYING(9) NOT NULL,
	img_ir TEXT NOT NULL,
	img_holerite TEXT NOT NULL,
	vl_seguro NUMERIC NOT NULL,
	cd_comprador INTEGER,
	CONSTRAINT cd_seguro_fianca PRIMARY KEY (cd_seguro_fianca),
	CONSTRAINT fk_seguro_comprador FOREIGN KEY (cd_comprador) REFERENCES tb_comprador
);
 
CREATE TABLE tb_imovel (
	cd_matricula_imovel INTEGER NOT NULL,
	dt_construcao DATE NOT NULL,
	vl_imovel NUMERIC NOT NULL,
	dt_disponivel DATE NOT NULL,
	ic_status TEXT NOT NULL,
	ic_finalidade TEXT NOT NULL,
	qt_area_m2 DECIMAL NOT NULL,
	img_imovel TEXT NOT NULL,
	cd_cpf CHARACTER VARYING(11),
	CHECK (ic_status IN ('disponível', 'indisponível', 'inativo')),
	CHECK (ic_finalidade IN ('locação', 'venda')),
	CONSTRAINT pk_imovel PRIMARY KEY(cd_matricula_imovel),
	CONSTRAINT fk_imovel_pessoa FOREIGN KEY (cd_cpf) REFERENCES tb_pessoa
);

CREATE TABLE tb_moradia (
	cd_moradia SERIAL NOT NULL,
	qt_quartos INTEGER NOT NULL,
	qt_suites INTEGER NOT NULL,
	qt_sala_estar INTEGER NOT NULL,
	qt_sala_jantar INTEGER NOT NULL,
	qt_vagas_garagem INTEGER NOT NULL,
	ic_armario_embutido BOOLEAN NOT NULL,
	ds_casa TEXT NOT NULL,
	cd_matricula_imovel INTEGER,
	CONSTRAINT pk_casa PRIMARY KEY(cd_moradia),
	CONSTRAINT fk_moradia_imovel FOREIGN KEY (cd_matricula_imovel) REFERENCES tb_imovel
);

CREATE TABLE tb_apartamento (
	cd_apartamento SERIAL NOT NULL,
	cd_andar INTEGER NOT NULL,
	ic_portaria BOOLEAN NOT NULL,
	vl_condominio NUMERIC NOT NULL,
	cd_moradia INTEGER,
	CONSTRAINT pk_apartamento PRIMARY KEY(cd_apartamento),
	CONSTRAINT fk_apartamento_moradia FOREIGN KEY (cd_moradia) REFERENCES tb_moradia
);

CREATE TABLE tb_sala_comercial (
	cd_sala_comercial SERIAL NOT NULL,
	qt_banheiros INTEGER NOT NULL,
	qt_comodos INTEGER NOT NULL,
	cd_matricula_imovel INTEGER,
	CONSTRAINT pk_sala_comercial PRIMARY KEY(cd_sala_comercial),
	CONSTRAINT fk_sala_comercial_imovel FOREIGN KEY (cd_matricula_imovel) REFERENCES tb_imovel
);

CREATE TABLE tb_terreno (
	cd_terreno SERIAL NOT NULL,
	qt_largura DECIMAL NOT NULL,
	qt_comprimento DECIMAL NOT NULL,
	ic_inclinacao BOOLEAN NOT NULL,
	cd_matricula_imovel INTEGER,
	CONSTRAINT pk_terreno PRIMARY KEY(cd_terreno),
	CONSTRAINT fk_terreno_imovel FOREIGN KEY (cd_matricula_imovel) REFERENCES tb_imovel
);

CREATE TABLE tb_contato (
	cd_contato SERIAL NOT NULL,
	nm_telefone_casa CHARACTER VARYING(8) NOT NULL,
	nm_telefone_celular CHARACTER VARYING(9) NOT NULL,
	nm_telefone_extra CHARACTER VARYING(9),
	cd_cpf CHARACTER VARYING(11),
	CONSTRAINT pk_contato PRIMARY KEY(cd_contato),
	CONSTRAINT fk_contato_pessoa FOREIGN KEY (cd_cpf) REFERENCES tb_pessoa
);

CREATE TABLE tb_transacao (
	cd_contrato INTEGER NOT NULL,
	vl_transacao NUMERIC NOT NULL,
	dt_transacao DATE NOT NULL,
	pc_imobiliaria DECIMAL NOT NULL,
	vl_comissao NUMERIC NOT NULL,
	cd_cpf CHARACTER VARYING(11),
	cd_matricula_imovel INTEGER,
	cd_documentacao_venda INTEGER,
	CONSTRAINT pk_transacao PRIMARY KEY(cd_contrato),
	CONSTRAINT fk_transacao_pessoa FOREIGN KEY (cd_cpf) REFERENCES tb_pessoa,
	CONSTRAINT fk_transacao_imovel FOREIGN KEY (cd_matricula_imovel) REFERENCES tb_imovel,
	CONSTRAINT fk_transacao_documentacao FOREIGN KEY (cd_documentacao_venda) REFERENCES tb_documentacao_venda
);


CREATE TABLE tb_item_transacao_pagamento (
	cd_contrato INTEGER,
	cd_forma_pagamento INTEGER,
	CONSTRAINT fk_item_transacao FOREIGN KEY (cd_contrato) REFERENCES tb_transacao,
	CONSTRAINT fk_item_pagamento FOREIGN KEY (cd_forma_pagamento) REFERENCES tb_forma_pagamento
);

ALTER TABLE tb_logradouro ADD CONSTRAINT fk_logradouro_imovel FOREIGN KEY (cd_matricula_imovel) REFERENCES tb_imovel;


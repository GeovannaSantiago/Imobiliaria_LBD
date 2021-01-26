
-- ---------------------------------------
-- 1. Imóveis do tipo sala comercial com mais de 3 cômodos
SELECT SC.cd_matricula_imovel
	FROM tb_imovel I JOIN tb_sala_comercial SC
		ON I.cd_matricula_imovel = SC.cd_matricula_imovel
			AND SC.qt_comodos > 3;

-- 2. Endereço completo do proprietário da profissão Consultor
SELECT nm_logradouro, nm_bairro, nm_cidade, nm_estado, sg_unidade_federativa
	FROM tb_logradouro L, tb_bairro B, tb_cidade C, tb_estado E, tb_unidade_federativa UF, tb_proprietario PR, tb_pessoa P
		WHERE PR.cd_cpf = P.cd_cpf
		AND P.cd_logradouro = L.cd_logradouro
		AND L.cd_bairro = B.cd_bairro
		AND B.cd_cidade = C.cd_cidade
		AND C.cd_estado = E.cd_estado
		AND E.cd_unidade_federativa = UF.cd_unidade_federativa
		AND PR.nm_profissao LIKE '%M';  


-- 3. Imóveis construídos depois da data 31/12/19999
SELECT cd_matricula_imovel
	FROM tb_imovel
		WHERE dt_construcao > '1999-12-31'

--4. Imóveis do tipo terreno sem inclinação
SELECT T.cd_matricula_imovel
	FROM tb_imovel I JOIN tb_terreno T
		ON I.cd_matricula_imovel = T.cd_matricula_imovel
		AND T.ic_inclinacao = false
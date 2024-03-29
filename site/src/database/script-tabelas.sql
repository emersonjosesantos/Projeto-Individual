-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!
/* para workbench - local - desenvolvimento */
CREATE DATABASE ponto_nerd;

USE ponto_nerd;

CREATE TABLE personagem (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50)
	);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	question VARCHAR(50),
	fk_personagem INT,
	FOREIGN KEY (fk_personagem) REFERENCES personagem(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

	select * from usuario;
    select * from personagem;
    
    insert into personagem(nome) values
    ('Shazam'),
    ('Thor'),
    ('Caçador de Marte'),
    ('Hulk');
    
    SELECT * FROM personagem;
	
	CREATE TABLE votoPersonagem (
    
		id INT PRIMARY KEY AUTO_INCREMENT,
        fk_personagem INT,
        FOREIGN KEY (fk_personagem) REFERENCES personagem(id),
        fk_usuario INT,
        FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
    );
    

    
    SELECT * FROM votoPersonagem;
    
	INSERT INTO votoPersonagem VALUES
    (null, fk_personagem, fk_usuario); 
    
	SELECT 
		personagem.nome, round(count(votoPersonagem.fk_personagem) / (SELECT count(*) FROM votoPersonagem) * 100, 1) as porcentagem
			FROM votoPersonagem
				JOIN personagem
					ON votoPersonagem.fk_personagem = personagem.id
				JOIN usuario
					ON votoPersonagem.fk_usuario = usuario.id
                        GROUP BY votoPersonagem.fk_personagem;
                        
	SELECT * FROM votoPersonagem;

-- create table aquario (
-- /* em nossa regra de negócio, um aquario tem apenas um sensor */
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	descricao VARCHAR(300)
-- );

-- /* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */

-- create table medida (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	dht11_umidade DECIMAL,
-- 	dht11_temperatura DECIMAL,
-- 	luminosidade DECIMAL,
-- 	lm35_temperatura DECIMAL,
-- 	chave TINYINT,
-- 	momento DATETIME,
-- 	fk_aquario INT,
-- 	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
-- );


-- /* para sql server - remoto - produção */
-- CREATE TABLE usuario (
-- 	id INT PRIMARY KEY IDENTITY(1,1),
-- 	nome VARCHAR(50),
-- 	email VARCHAR(50),
-- 	senha VARCHAR(50),
-- );

-- CREATE TABLE aviso (
-- 	id INT PRIMARY KEY IDENTITY(1,1),
-- 	titulo VARCHAR(100),
-- 	descricao VARCHAR(150),
-- 	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
-- );

-- create table aquario (
-- /* em nossa regra de negócio, um aquario tem apenas um sensor */
-- 	id INT PRIMARY KEY IDENTITY(1,1),
-- 	descricao VARCHAR(300)
-- );

-- /* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */

-- CREATE TABLE medida (
-- 	id INT PRIMARY KEY IDENTITY(1,1),
-- 	dht11_umidade DECIMAL,
-- 	dht11_temperatura DECIMAL,
-- 	luminosidade DECIMAL,
-- 	lm35_temperatura DECIMAL,
-- 	chave TINYINT,
-- 	momento DATETIME,
-- 	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
-- );

INSERT INTO votoPersonagem VALUES (null, 4, 1);

SELECT * FROM personagem;
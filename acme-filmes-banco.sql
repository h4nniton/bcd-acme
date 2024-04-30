CREATE SCHEMA IF NOT EXISTS `db_acme_filmes_turma_aa` DEFAULT CHARACTER SET utf8 ;
USE `db_acme_filmes_turma_aa` ;

-- -----------------------------------------------------
-- Table tbl_genero
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_genero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(15) NULL,
  PRIMARY KEY (`id`));
  
  insert into tbl_genero (nome) values (
  'Ação') , ('Aventura'), ('Comédia'), ('Documetário'), ('Drama'), ('Fantasia'),
  ('Ficção'), ('Musical'), ('Mistério'), ('Romance'), ('Suspense'),
  ('Terror');


-- -----------------------------------------------------
-- Table tbl_classificacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_classificacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `imagem` VARCHAR(200) NULL,
  PRIMARY KEY (`id`));
  
  insert into tbl_classificacao (nome, imagem) values (
	'Livre', 'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_L.svg'),
    ('10 anos', 'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_10.svg'),
    ('12 anos', 'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_12.svg'),
    ('14 anos', 'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_14.svg'),
    ('16 anos', 'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_16.svg'),
    ('18 anos', 'https://pt.wikipedia.org/wiki/Ficheiro:DJCTQ_-_18.svg');


-- -----------------------------------------------------
-- Table tbl_nacionalidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_nacionalidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL,
  `bandeira` VARCHAR(200) NULL,
  PRIMARY KEY (`id`));
  
  insert into tbl_nacionalidade (nome, bandeira) values (
  'Uruguaiano', 'https://pt.wikipedia.org/wiki/Ficheiro:Flag_of_Uruguay.svg'),
  ('Espanhol', 'https://pt.wikipedia.org/wiki/Ficheiro:Flag_of_Spain.svg'),
  ('Americano', 'https://pt.wikipedia.org/wiki/Ficheiro:Flag_of_the_United_States.svg');

-- -----------------------------------------------------
-- Table tbl_filmes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS`tbl_filmes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sinopse` VARCHAR(800) NULL,
  `data_lancamento` DATE NULL,
  `valor_unitario` FLOAT NULL,
  `titulo` VARCHAR(100) NULL,
  `genero_id` INT NOT NULL,
  `classificacao_id` INT NOT NULL,
  `nacionalidade_id` INT NOT NULL,
  `imagem` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_filmes_genero`
    FOREIGN KEY (`genero_id`)
    REFERENCES `tbl_genero` (`id`),
  CONSTRAINT `fk_filmes_classificacao`
    FOREIGN KEY (`classificacao_id`)
    REFERENCES `tbl_classificacao` (`id`),
  CONSTRAINT `fk_filmes_nacionalidade`
    FOREIGN KEY (`nacionalidade_id`)
    REFERENCES `tbl_nacionalidade` (`id`));
    
    insert into tbl_filmes (sinopse, data_lancamento, valor_unitario, titulo, genero_id,
						    classificacao_id, nacionalidade_id, imagem) values
	('Em 1972, um voo vindo do Uruguai colide com uma geleira nos Andes. Apenas 29 dos seus 45 passageiros sobreviveram ao acidente. Presos em um dos ambientes mais hostis do planeta, eles são forçados a lutar pelas suas vidas.',
    '2023-12-15', '29.00', 'A Sociedade da Neve', '4', '4', '1', 'https://www.adorocinema.com/filmes/filme-267338/trailer-19569028/'),
    ('Em 1959 na Welton Academy, uma tradicional escola preparatória, um ex-aluno (Robin Williams) se torna o novo professor de literatura, mas logo seus métodos de incentivar os alunos a pensarem por si mesmos cria um choque com a ortodoxa direção do colégio, principalmente quando ele fala aos seus alunos sobre a "Sociedade dos Poetas Mortos".',
    '1989-02-28', '29.00', 'Sociedade dos Poetas Mortos', '4', '2', '2', 'https://www.adorocinema.com/filmes/filme-5280/trailer-19312963/');


-- -----------------------------------------------------
-- Table tbl_diretores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_diretores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NULL,
  `nome_artistico` VARCHAR(60) NULL,
  `data_nascimento` DATE NULL,
  PRIMARY KEY (`id`));
  
  insert into tbl_diretores (nome, nome_artistico, data_nascimento) values
  ('Juan Antonio Bayona', null, '1975-05-09'),
  ('Peter Lindsay Weir', null, '1944-08-21');


-- -----------------------------------------------------
-- Table tbl_atores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_atores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NULL,
  `nome_artistico` VARCHAR(60) NULL,
  `data_nascimento` DATE NULL,
  PRIMARY KEY (`id`));
  
  insert into tbl_atores (nome, nome_artistico, data_nascimento) values 
  ('Enzo Vogrincic Roldán', 'Enzo Vogrincic', '1993-03-22'),
  ('Ethan Green Hawke', 'Ethan Hawke', '1970-11-06');


-- -----------------------------------------------------
-- Table tbl_nacionalidade_ator
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_nacionalidade_ator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nacionalidade_id` INT NOT NULL,
  `atores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_nacionalidade_ator_nacionalidade`
    FOREIGN KEY (`nacionalidade_id`)
    REFERENCES `tbl_nacionalidade` (`id`),
  CONSTRAINT `fk_nacionalidade_ator_atores`
    FOREIGN KEY (`atores_id`)
    REFERENCES `tbl_atores` (`id`));
    
    insert into tbl_nacionalidade_ator (nacionalidade_id, atores_id) values
    ('1', '1'),
    ('3', '2');


-- -----------------------------------------------------
-- Table tbl_filme_diretor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS`tbl_filme_diretor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `filmes_id` INT NOT NULL,
  `diretores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_filme_diretor_filmes`
    FOREIGN KEY (`filmes_id`)
    REFERENCES `tbl_filmes` (`id`),
  CONSTRAINT `fk_filme_diretor_diretores`
    FOREIGN KEY (`diretores_id`)
    REFERENCES `tbl_diretores` (`id`));
    
	insert into tbl_filme_diretor (filmes_id, diretores_id) values
    ('1', '1'),
    ('2', '2');


-- -----------------------------------------------------
-- Table tbl_nacionalidade_diretor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_nacionalidade_diretor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nacionalidade_id` INT NOT NULL,
  `filme_diretor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_nacionalidade_diretor_nacionalidade`
    FOREIGN KEY (`nacionalidade_id`)
    REFERENCES `tbl_nacionalidade` (`id`),
  CONSTRAINT `fk_nacionalidade_diretor_filme_diretor`
    FOREIGN KEY (`filme_diretor_id`)
    REFERENCES `tbl_filme_diretor` (`id`));
    
	insert into tbl_nacionalidade_diretor (nacionalidade_id, filme_diretor_id) values
    ('2', '1'),
    ('3', '1');


-- -----------------------------------------------------
-- Table tbl_filme_ator
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_filme_ator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `filmes_id` INT NOT NULL,
  `atores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_filme_ator_filmes`
    FOREIGN KEY (`filmes_id`)
    REFERENCES `tbl_filmes` (`id`),
  CONSTRAINT `fk_filme_ator_atores`
    FOREIGN KEY (`atores_id`)
    REFERENCES`tbl_atores` (`id`));
    
	insert into tbl_filme_ator (filmes_id, atores_id) values
    ('1', '1'),
    ('2', '2');


-- -----------------------------------------------------
-- Table tbl_usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `icone` VARCHAR(200) NULL,
  `email` VARCHAR(50) NULL,
  `senha` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
	insert into tbl_usuario (nome, icone, email, senha) values
    ('Emily Crepaldi', 'https://i.pinimg.com/736x/2a/00/cc/2a00cc3276a3241324db4bd13744716c.jpg',
    'emilycrepaldi@gmail.com', 'emily123'),
    ('Julieta Maria', 'https://i.pinimg.com/564x/88/2f/65/882f652c8275ce0d89d150436601106d.jpg',
    'julietamaria@gmail.com', 'julieta123');


-- -----------------------------------------------------
-- Table `tbl_filme_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_filme_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `filmes_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_filme_usuario_filmes`
    FOREIGN KEY (`filmes_id`)
    REFERENCES `tbl_filmes` (`id`),
  CONSTRAINT `fk_filme_usuario_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `tbl_usuario` (`id`));
    
    insert into tbl_filme_usuario (filmes_id, usuario_id) values
    ('1', '1'),
    ('2', '2');


-- -----------------------------------------------------
-- Table tbl_carrinho
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS`tbl_carrinho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor_pedido` FLOAT NULL,
  `usuario_id` INT NOT NULL,
  `filmes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_carrinho_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `tbl_usuario` (`id`),
  CONSTRAINT `fk_carrinho_filmes`
    FOREIGN KEY (`filmes_id`)
    REFERENCES `tbl_filmes` (`id`));
    
    insert into tbl_carrinho (valor_pedido, usuario_id, filmes_id) values
    ('29.00', '1', '1'),
    ('29.00', '2','2');
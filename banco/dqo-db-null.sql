-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dqo-db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dqo-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dqo-db` DEFAULT CHARACTER SET utf8 ;
USE `dqo-db` ;

-- -----------------------------------------------------
-- Table `dqo-db`.`musico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dqo-db`.`musico` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_artistico` VARCHAR(100) NULL,
  `nome_completo` VARCHAR(100) NOT NULL,
  `data_nascimento` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dqo-db`.`banda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dqo-db`.`banda` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dqo-db`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dqo-db`.`album` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `ano` VARCHAR(10) NOT NULL,
  `capa` VARCHAR(100) NOT NULL,
  `contracapa` VARCHAR(100) NULL,
  `arranjo` VARCHAR(200) NULL,
  `producao` VARCHAR(200) NULL,
  `direcao` VARCHAR(200) NULL,
  `fotografia` VARCHAR(100) NULL,
  `gravadora` VARCHAR(50) NOT NULL,
  `ficha_tecnica` VARCHAR(900) NULL,
  `curiosidade` VARCHAR(900) NULL,
  `referencia` VARCHAR(900) NOT NULL,
  `analise` VARCHAR(3000) NULL,
  `lista_musicas` VARCHAR(1000) NOT NULL,
  `lista_reproducao` VARCHAR(3000) NOT NULL,
  `duracao` INT NULL,
  `musico_id` INT UNSIGNED NOT NULL,
  `banda_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `musico_id`, `banda_id`),
  INDEX `fk_album_musico_idx` (`musico_id` ASC),
  INDEX `fk_album_banda1_idx` (`banda_id` ASC),
  CONSTRAINT `fk_album_musico`
    FOREIGN KEY (`musico_id`)
    REFERENCES `dqo-db`.`musico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_banda1`
    FOREIGN KEY (`banda_id`)
    REFERENCES `dqo-db`.`banda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dqo-db`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dqo-db`.`genero` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dqo-db`.`musico_has_banda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dqo-db`.`musico_has_banda` (
  `musico_id` INT UNSIGNED NOT NULL,
  `banda_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`musico_id`, `banda_id`),
  INDEX `fk_musico_has_banda_banda1_idx` (`banda_id` ASC),
  INDEX `fk_musico_has_banda_musico1_idx` (`musico_id` ASC),
  CONSTRAINT `fk_musico_has_banda_musico1`
    FOREIGN KEY (`musico_id`)
    REFERENCES `dqo-db`.`musico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_musico_has_banda_banda1`
    FOREIGN KEY (`banda_id`)
    REFERENCES `dqo-db`.`banda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dqo-db`.`musico_has_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dqo-db`.`musico_has_genero` (
  `musico_id` INT UNSIGNED NOT NULL,
  `genero_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`musico_id`, `genero_id`),
  INDEX `fk_musico_has_genero_genero1_idx` (`genero_id` ASC),
  INDEX `fk_musico_has_genero_musico1_idx` (`musico_id` ASC),
  CONSTRAINT `fk_musico_has_genero_musico1`
    FOREIGN KEY (`musico_id`)
    REFERENCES `dqo-db`.`musico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_musico_has_genero_genero1`
    FOREIGN KEY (`genero_id`)
    REFERENCES `dqo-db`.`genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dqo-db`.`banda_has_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dqo-db`.`banda_has_genero` (
  `banda_id` INT UNSIGNED NOT NULL,
  `genero_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`banda_id`, `genero_id`),
  INDEX `fk_banda_has_genero_genero1_idx` (`genero_id` ASC),
  INDEX `fk_banda_has_genero_banda1_idx` (`banda_id` ASC),
  CONSTRAINT `fk_banda_has_genero_banda1`
    FOREIGN KEY (`banda_id`)
    REFERENCES `dqo-db`.`banda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_banda_has_genero_genero1`
    FOREIGN KEY (`genero_id`)
    REFERENCES `dqo-db`.`genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

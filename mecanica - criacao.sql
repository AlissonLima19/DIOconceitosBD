-- MySQL Script generated by MySQL Workbench
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL,
  `nomecliente` VARCHAR(100) NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipe_ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipe_ordem_servico` (
  `idequipe_ordem_servico` INT NOT NULL,
  `dsequipe_ordem_servicocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idequipe_ordem_servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mao_de_obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mao_de_obra` (
  `idmao_de_obra` INT NOT NULL,
  `valormao_de_obra` FLOAT NULL,
  PRIMARY KEY (`idmao_de_obra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mecanico` (
  `idmecanico` INT NOT NULL,
  `nomemecanico` VARCHAR(100) NULL,
  `endereço` VARCHAR(200) NULL,
  `especialidade` VARCHAR(100) NULL,
  PRIMARY KEY (`idmecanico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mecanico_equipe_ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mecanico_equipe_ordem_servico` (
  `idequipe_ordem_servico` INT NOT NULL,
  `idmecanico` INT NOT NULL,
  PRIMARY KEY (`idequipe_ordem_servico`, `idmecanico`),
  CONSTRAINT `fk_equipe_ordem_servico_has_mecanico_equipe_ordem_servico1`
    FOREIGN KEY (`idequipe_ordem_servico`)
    REFERENCES `mydb`.`equipe_ordem_servico` (`idequipe_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipe_ordem_servico_has_mecanico_mecanico1`
    FOREIGN KEY (`idmecanico`)
    REFERENCES `mydb`.`mecanico` (`idmecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_equipe_ordem_servico_has_mecanico_mecanico1_idx` ON `mydb`.`mecanico_equipe_ordem_servico` (`idmecanico` ASC) VISIBLE;

CREATE INDEX `fk_equipe_ordem_servico_has_mecanico_equipe_ordem_servico1_idx` ON `mydb`.`mecanico_equipe_ordem_servico` (`idequipe_ordem_servico` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ordem_servico` (
  `idordem_servico` INT NOT NULL,
  `idveiculo` VARCHAR(45) NULL,
  `tpservico` VARCHAR(45) NULL,
  `tipo_servico_idtipo_servico` INT NOT NULL,
  `veiculo_idveiculo` INT NOT NULL,
  `veiculo_cliente_idcliente` INT NOT NULL,
  `idequipe_ordem_servico` VARCHAR(45) NULL,
  `equipe_ordem_servico_idequipe_ordem_servico` INT NOT NULL,
  `dt_entrega` DATE NULL,
  `ordem_servicocol` VARCHAR(45) NULL,
  `mao_de_obra_idmao_de_obra` INT NOT NULL,
  `snautorizado` VARCHAR(1) NULL,
  `numeroos` REAL NULL,
  `dataemissao` DATE NULL,
  `valoros` FLOAT NULL,
  `status` VARCHAR(1) NULL,
  `dataconclusao` DATE NULL,
  PRIMARY KEY (`idordem_servico`, `tipo_servico_idtipo_servico`, `veiculo_idveiculo`, `veiculo_cliente_idcliente`, `equipe_ordem_servico_idequipe_ordem_servico`, `mao_de_obra_idmao_de_obra`),
  CONSTRAINT `fk_ordem_servico_tipo_servico1`
    FOREIGN KEY (`tipo_servico_idtipo_servico`)
    REFERENCES `mydb`.`tipo_servico` (`idtipo_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_veiculo1`
    FOREIGN KEY (`veiculo_idveiculo` , `veiculo_cliente_idcliente`)
    REFERENCES `mydb`.`veiculo` (`idveiculo` , `cliente_idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_equipe_ordem_servico1`
    FOREIGN KEY (`equipe_ordem_servico_idequipe_ordem_servico`)
    REFERENCES `mydb`.`equipe_ordem_servico` (`idequipe_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_mao_de_obra1`
    FOREIGN KEY (`mao_de_obra_idmao_de_obra`)
    REFERENCES `mydb`.`mao_de_obra` (`idmao_de_obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ordem_servico_tipo_servico1_idx` ON `mydb`.`ordem_servico` (`tipo_servico_idtipo_servico` ASC) VISIBLE;

CREATE INDEX `fk_ordem_servico_veiculo1_idx` ON `mydb`.`ordem_servico` (`veiculo_idveiculo` ASC, `veiculo_cliente_idcliente` ASC) VISIBLE;

CREATE INDEX `fk_ordem_servico_equipe_ordem_servico1_idx` ON `mydb`.`ordem_servico` (`equipe_ordem_servico_idequipe_ordem_servico` ASC) VISIBLE;

CREATE INDEX `fk_ordem_servico_mao_de_obra1_idx` ON `mydb`.`ordem_servico` (`mao_de_obra_idmao_de_obra` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`peça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`peça` (
  `idpeça` INT NOT NULL,
  `nomepeça` VARCHAR(100) NULL,
  `valorpeça` FLOAT NULL,
  PRIMARY KEY (`idpeça`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`peça_ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`peça_ordem_servico` (
  `idordem_servico` INT NOT NULL,
  `idpeça` INT NOT NULL,
  PRIMARY KEY (`idordem_servico`, `idpeça`),
  CONSTRAINT `fk_ordem_servico_has_peça_ordem_servico1`
    FOREIGN KEY (`idordem_servico`)
    REFERENCES `mydb`.`ordem_servico` (`idordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_has_peça_peça1`
    FOREIGN KEY (`idpeça`)
    REFERENCES `mydb`.`peça` (`idpeça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ordem_servico_has_peça_peça1_idx` ON `mydb`.`peça_ordem_servico` (`idpeça` ASC) VISIBLE;

CREATE INDEX `fk_ordem_servico_has_peça_ordem_servico1_idx` ON `mydb`.`peça_ordem_servico` (`idordem_servico` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_servico` (
  `idtipo_servico` INT NOT NULL,
  `dstipo_servico` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idtipo_servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculo` (
  `idveiculo` INT NOT NULL,
  `placa_veiculo` VARCHAR(7) NOT NULL,
  `id_cliente` INT NOT NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idveiculo`, `cliente_idcliente`),
  CONSTRAINT `fk_veiculo_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_veiculo_cliente1_idx` ON `mydb`.`veiculo` (`cliente_idcliente` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

CREATE SCHEMA `playground`;
CREATE TABLE `playground`.`categorias` (
`idCategoria` INT NOT NULL,
`nombre` VARCHAR(100) NULL,
PRIMARY KEY (`idCategoria`)
);
CREATE TABLE `playground`.`usuarios` (
`idUsuario` INT NOT NULL,
`nombre` VARCHAR(100) NULL,
`apellido` VARCHAR(100) NULL,
`email` VARCHAR(50) NULL,
`categoria` INT NULL,
PRIMARY KEY (`idUsuario`), 
INDEX (`categoria` ASC) VISIBLE, 
CONSTRAINT `FKcategoria` 
    FOREIGN KEY (`categoria`) 
    REFERENCES `playground`.`categorias` (`idCategoria`) 
    ON UPDATE CASCADE 
    ON DELETE SET NULL
);

CREATE TABLE `playground`.`carrera` (
`idCarrera` INT NOT NULL,
`titulo` VARCHAR(45) NULL,
`descripcion` VARCHAR(100) NULL,
PRIMARY KEY (`idCarrera`));

CREATE TABLE `playground`.`usuarios_carrera` (
`id` INT NOT NULL,
`usuario` INT NULL,
`carrera` INT NULL,
`fechaInscripcion` DATE NULL,
PRIMARY KEY (`id`), 
INDEX `usuario_idx`(`usuario_idx` ASC) VISIBLE, 
INDEX `carrera_idx`(`carrera_idx` ASC) VISIBLE, 
CONSTRAINT `usuario` 
    FOREIGN KEY (`usuario`) 
    REFERENCES `playground`.`usuarios` (`idUsuario`),
CONSTRAINT `carrera` 
    FOREIGN KEY (`carrera`) 
    REFERENCES `playground`.`carrera` (`idCarrera`));
CREATE DATABASE veterinaria;


USE veterinaria;


CREATE TABLE animales
(
idanimal	INT AUTO_INCREMENT PRIMARY KEY,
nombreanimal	VARCHAR(30) NOT NULL,
create_at 		DATETIME NOT NULL DEFAULT NOW(),
update_at		DATETIME NULL,
inactive_at		DATETIME NULL,

CONSTRAINT uk1 UNIQUE (nombreanimal)
)ENGINE = INNODB;

INSERT INTO animales (nombreanimal)VALUES
('Perro'),
('Gato'),
('Iguana'),
('Cerdo')

CREATE TABLE razas
(
idraza INT AUTO_INCREMENT PRIMARY KEY,
idanimal INT NOT NULL,
nombreraza	VARCHAR(30) NOT NULL,
create_at 		DATETIME NOT NULL DEFAULT NOW(),
update_at		DATETIME NULL,
inactive_at		DATETIME NULL,

CONSTRAINT uk2 UNIQUE (idanimal, nombreraza),
CONSTRAINT fk1	FOREIGN KEY (idanimal) REFERENCES animales (idanimal)
)ENGINE = INNODB;

INSERT INTO razas (idanimal, nombreraza) VALUES
(1,'Chihuahua'),
(1,'Gran Danés'),
(1,'Bichón maltés'),
(1,'Caniche'),
(1,'Shar Pei'),
(1,'Dalmata'),
(2,'Abisinio'),
(2,'Asiático'),
(2,'Azul ruso'),
(2,'Balinés'),
(2,'Bengalí'),
(2,'Birmano'),
(2,'Bombay'),
(2,'Bosque de Noruega'),
(3,'Conolophus pallidus'),
(3,'Del Caribe'),
(3,'Crestada de Fiyi'),
(3,'Bulabula'),
(3,'Negra de cola espinosa'),
(4,'Poland China'),
(4,'Hampshire'),
(4,'Duroc'),
(4,'Pietrain'),
(4,'Landrace'),
(4,'Chester white')

SELECT * FROM razas ORDER BY idraza DESC

CREATE TABLE clientes
(
idcliente INT AUTO_INCREMENT PRIMARY KEY,
apellidos	VARCHAR(50) NOT NULL,
nombres		VARCHAR(50) NOT NULL,
dni 			CHAR(9) NOT NULL,
claveacceso	VARCHAR(100) NOT NULL,
create_at 		DATETIME NOT NULL DEFAULT NOW(),
update_at		DATETIME NULL,
inactive_at		DATETIME NULL,

CONSTRAINT uk3 UNIQUE (dni),
CONSTRAINT uk4 UNIQUE (dni, claveacceso)
)ENGINE = INNODB;

INSERT INTO clientes (apellidos, nombres, dni, claveacceso)VALUES
('Quiroz Ccaulla','Alex Edú','72680725','tMEChynHz9MY3fSbO6VNy0WKtYJZl1vX5nI6BRjJ4K8'),
('Mateo Quispe','Jean Luis','76542123','tMEChynHz9MY3fSbO6VNy0WKtYJZl1vX5nI6BRjJ4K8')


CREATE TABLE mascotas
(
idmascota	INT AUTO_INCREMENT PRIMARY KEY,
idcliente	INT NOT NULL,
idraza		INT NOT NULL,
nombre		VARCHAR(50) NOT NULL,
fotografia	VARCHAR(200) DEFAULT NULL,
color 		VARCHAR(30) NOT NULL,
genero 		VARCHAR(10) NOT NULL,
create_at 		DATETIME NOT NULL DEFAULT NOW(),
update_at		DATETIME NULL,
inactive_at		DATETIME NULL,

CONSTRAINT fk2	FOREIGN KEY (idraza) REFERENCES razas (idraza),
CONSTRAINT fk3	FOREIGN KEY (idcliente) REFERENCES clientes (idcliente)
)ENGINE = INNODB;

INSERT INTO mascotas(idcliente, idraza, nombre, color, genero) VALUES
(1, 2, 'Scoby', 'Marron', 'Macho'),
(1, 4, 'Chock', 'Negro', 'Macho'),
(2, 8, 'Tom', 'Gris', 'Hembra')


																									-- Procedimiento--
																									
																									
-- Buscador de cliente
DELIMITER $$
CREATE PROCEDURE spu_clientes_buscar(IN _dni CHAR(9))
BEGIN 
		SELECT  CONCAT(apellidos, ' ' , nombres )AS Cliente, nombre AS Nombre, animales.nombreanimal AS Animal, razas.nombreraza AS Raza, color AS Color, genero AS Genero, fotografia AS Fotografia
		FROM mascotas
		INNER JOIN clientes ON clientes.idcliente = mascotas.idcliente
		INNER JOIN razas ON razas.idraza = mascotas.idraza
		INNER JOIN animales ON animales.idanimal = razas.idanimal
		WHERE dni = _dni
		ORDER BY idmascota;
END$$

	
	CALL spu_clientes_buscar(72680725)
	

-- Registrar cliente
DELIMITER $$
CREATE PROCEDURE spu_clientes_registrar
(IN _apellidos VARCHAR(50),
IN _nombres VARCHAR(50),
IN _dni	CHAR(9),
IN _claveacceso VARCHAR(100))
BEGIN 
	INSERT INTO clientes (apellidos, nombres, dni, claveacceso)VALUES
	(_apellidos, _nombres, _dni, _claveacceso);
END$$
	SELECT * FROM mascotas
-- registrar nueva mascota a un cliente

DELIMITER $$
CREATE PROCEDURE spu_mascotas_registrar
(
IN _idcliente INT,
IN _idraza INT,
IN _nombre VARCHAR(50),
IN _fotografia VARCHAR(200),
IN _color VARCHAR(30),
IN _genero VARCHAR(10)
)
BEGIN
	IF _fotografia= '' THEN SET _fotografia = NULL; END IF;
	
	INSERT INTO mascotas(idcliente, idraza, nombre, fotografia, color, genero)VALUES
	(_idcliente, _idraza, _nombre, _fotografia, _color, _genero);
END $$
	
	CALL spu_mascotas_registrar(3,3,'Firulais','','Negro', 'Macho'  )
	
DELIMITER $$
CREATE PROCEDURE spu_login_user 
(
	IN _dni CHAR(9)
)
BEGIN
	SELECT clientes.`idcliente`,
		clientes.nombres, clientes.apellidos,
		clientes.dni, clientes.claveacceso
	FROM clientes
	WHERE dni = _dni;
END $$

CALL spu_login_user('76542123')
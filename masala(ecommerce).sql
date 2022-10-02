DROP SCHEMA IF EXISTS Masala;
CREATE DATABASE IF NOT EXISTS Masala;
USE Masala;

CREATE TABLE cliente (
cliente_id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
apellido VARCHAR(50),
tipo_documento VARCHAR(50) NOT NULL,
numero_docuento INT NOT NULL UNIQUE,
email VARCHAR(50) NOT NULL UNIQUE,
calle_nombre VARCHAR(50),
numero INT,
piso VARCHAR(10),
dpto VARCHAR(10),
ciudad VARCHAR(50),
codigo_postal VARCHAR(50),
PRIMARY KEY (cliente_id)
);

CREATE TABLE empresa_entrega (
empresa_entrega_id INT NOT NULL AUTO_INCREMENT,
nombre_empresa VARCHAR(50),
precio_km DECIMAL(9,2),
fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
PRIMARY KEY (empresa_entrega_id)
);

CREATE TABLE compra (
compra_id INT NOT NULL AUTO_INCREMENT,
cliente_id INT NOT NULL,
fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
total DECIMAL (9,2),
PRIMARY KEY (compra_id),
FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE envio (
envio_id INT NOT NULL AUTO_INCREMENT,
empresa_entrega_id INT NOT NULL,
compra_id INT NOT NULL,
kilometros INT NOT NULL,
fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
total_envio DECIMAL (9,2) NOT NULL,
PRIMARY KEY (envio_id),
FOREIGN KEY (empresa_entrega_id)
	REFERENCES empresa_entrega (empresa_entrega_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (compra_id)
	REFERENCES compra (compra_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE producto (
producto_id INT NOT NULL AUTO_INCREMENT,
nombre_producto VARCHAR(50) NOT NULL,
descripcion VARCHAR(500),
precio_producto DECIMAL(9,2) NOT NULL,
stock INT NOT NULL,
stock_minimo INT NOT NULL,
fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
PRIMARY KEY (producto_id)
);

CREATE TABLE lista_compra (
lista_compra_id INT NOT NULL AUTO_INCREMENT,
compra_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad_producto INT NOT NULL,
sub_total DECIMAL (9,2) NOT NULL,
PRIMARY KEY (lista_compra_id),
FOREIGN KEY (compra_id)
	REFERENCES compra(compra_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (producto_id)
	REFERENCES producto(producto_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE proveedor (
proveedor_id INT NOT NULL AUTO_INCREMENT,
nombre_proveedor VARCHAR(150),
fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
direccion VARCHAR(150),
email VARCHAR(50),
ciudad VARCHAR(150),
provincia VARCHAR(150),
telefono INT,
PRIMARY KEY (proveedor_id)
);

CREATE TABLE producto_x_proveedor (
producto_proveedor_id INT NOT NULL AUTO_INCREMENT,
proveedor_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad_producto INT NOT NULL,
fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
sub_total DECIMAL (9,2),
PRIMARY KEY (producto_proveedor_id),
FOREIGN KEY (proveedor_id)
	REFERENCES proveedor(proveedor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (producto_id)
	REFERENCES producto(producto_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE master_table_audit 
(
master_table_id INT AUTO_INCREMENT,
table_audit_name VARCHAR(50) NOT NULL,
user_name VARCHAR(100) NOT NULL,
date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
deletes BOOLEAN DEFAULT NULL,
updates BOOLEAN DEFAULT NULL,
inserts BOOLEAN DEFAULT NULL,
cliente_id INT DEFAULT NULL,
compra_id INT DEFAULT NULL,
empresa_entrega_id INT DEFAULT NULL,
envio_id INT DEFAULT NULL,
lista_compra_id INT DEFAULT NULL,
producto_id INT DEFAULT NULL,
producto_proveedor_id INT DEFAULT NULL,
proveedor_id INT DEFAULT NULL,
PRIMARY KEY (master_table_id)
);



/*ALTER TABLE envio ADD CONSTRAINT FK_envio_empresaentrega
FOREIGN KEY (empresa_entrega_id)
	REFERENCES empresa_entrega (empresa_entrega_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE compra ADD CONSTRAINT 
FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE lista_compra ADD CONSTRAINT
FOREIGN KEY (compra_id)
	REFERENCES compra(compra_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
ALTER TABLE lista_compra ADD CONSTRAINT
FOREIGN KEY (producto_id)
	REFERENCES producto(producto_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE producto_x_proveedor ADD CONSTRAINT
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor(proveedor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
ALTER TABLE producto_x_proveedor ADD CONSTRAINT
FOREIGN KEY (producto_id)
	REFERENCES producto(producto_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;*/
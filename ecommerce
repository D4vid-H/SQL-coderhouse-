CREATE DATABASE IF NOT EXISTS Masala;
USE Masala;

CREATE TABLE cliente (
cliente_id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
tipo_documento VARCHAR(50) NOT NULL,
numero_docuento INT NOT NULL UNIQUE,
email VARCHAR(50) NOT NULL UNIQUE,
calle_nombre VARCHAR(50),
numero INT,
piso VARCHAR(10),
dpto VARCHAR(10),
codigo_postal VARCHAR(50)
);

CREATE TABLE entrega (
entrega_id INT NOT NULL PRIMARY KEY,
nombre_empresa VARCHAR(50),
precio_km DECIMAL(9.2),
precio_bulto DECIMAL(9.2),
precio_peso DECIMAL(9.2)
);

CREATE TABLE envio (
envio_id INT NOT NULL PRIMARY KEY,
entrega_id INT NOT NULL,
kilometros INT NOT NULL,
peso INT NOT NULL,
bulto INT NOT NULL,
total_envio DECIMAL (9.2),
FOREIGN KEY (entrega_id)
	REFERENCES entrega(entrega_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE compra (
compra_id INT NOT NULL PRIMARY KEY,
cliente_id INT NOT NULL,
envio_id INT NOT NULL,
fecha_compra TIMESTAMP NOT NULL,
total DECIMAL (9.2),
FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (envio_id)
	REFERENCES envio(envio_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE producto (
producto_id INT NOT NULL PRIMARY KEY,
nombre_producto VARCHAR(50),
stock INT NOT NULL,
stock_minimo INT NOT NULL,
descripcion VARCHAR(500),
precio_producto DECIMAL(9.2)
);

CREATE TABLE lista_compra (
lista_compra_id INT NOT NULL PRIMARY KEY,
compra_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad_producto INT NOT NULL,
sub_total DECIMAL (9.2),
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
proveedor_id INT NOT NULL PRIMARY KEY,
nombre_proveedor VARCHAR(150),
direccion VARCHAR(150),
email VARCHAR(50)
);

CREATE TABLE producto_x_proveedor (
producto_proveedor_id INT NOT NULL PRIMARY KEY,
proveedor_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad_producto INT NOT NULL,
sub_total DECIMAL (9.2),
FOREIGN KEY (proveedor_id)
	REFERENCES proveedor(proveedor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (producto_id)
	REFERENCES producto(producto_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

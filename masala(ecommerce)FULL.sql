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
kilometros DECIMAL NOT NULL,
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

/* -Table Audit-*/

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

/*Functions*/

DELIMITER //
CREATE FUNCTION f_aleatoio (min INT, max INT)
	RETURNS INT
    DETERMINISTIC
    BEGIN
		DECLARE aleatorio INT;
        SET aleatorio = (SELECT FLOOR(RAND() * (max - min)) + min );
        
        RETURN aleatorio ;
    END //
    
DELIMITER ;

DELIMITER $$
CREATE FUNCTION f_iva(precio DECIMAL(7,2)) 
RETURNS decimal(7,2)
DETERMINISTIC
BEGIN
	DECLARE iva DECIMAL(3,2);
    DECLARE precio_con_iva DECIMAL(7,2);
    SET iva = 1.21;
    SET precio_con_iva = precio * iva;
RETURN precio_con_iva ;
END$$

/*
Se crea una funcion simple que recibe un DECIMAL como parametro y se lo multiplica
por el porcentaje del IVA de argentina, es el 21%.
*/
DELIMITER ;

DELIMITER $$

CREATE FUNCTION f_nombreCompleto(nombre VARCHAR(50), apellido VARCHAR(50)) 
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN

	DECLARE nombre_completo VARCHAR(200);
    SET nombre_completo = CONCAT(nombre, ',', apellido);

RETURN nombre_completo;
END$$
/*
Se crea una funcion simple que concatena 2 string, el nombre y apellido de un cliente.
*/
DELIMITER ;

DELIMITER $$
CREATE FUNCTION precio_X_mayor(precio DECIMAL(7,2)) 
RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE mayor DECIMAL(3,2);
    DECLARE precio_por_mayor DECIMAL(7,2);
    SET mayor = 1.16 ;
    SET precio_por_mayor = precio * mayor;

RETURN precio_por_mayor;
END$$
/*
Se crea una funcion simple que recibe un parametro y lo multiplica por
un porcentaje adecuado para la venta de productos por mayor.
*/
DELIMITER ;

DELIMITER $$

CREATE FUNCTION precio_X_menor(precio DECIMAL(7,2)) 
RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE menor DECIMAL(3,2);
    DECLARE precio_por_menor DECIMAL(7,2);
    SET menor = 1.31 ;
    SET precio_por_menor = precio * menor;

RETURN precio_por_menor;
END$$
/*
Se crea una funcion simple que recibe un parametro y lo multiplica por
un porcentaje adecuado para la venta de productos por menor.
*/
DELIMITER ;

DELIMITER $$
CREATE FUNCTION f_total_compra(in_producto_id INT, cantidad_producto INT)
RETURNS DECIMAL(7,2)
READS SQL DATA
BEGIN
	DECLARE precio_producto DECIMAL(7,2);
    DECLARE total DECIMAL(7,2);
    SET precio_producto = (SELECT p.precio_producto FROM producto AS p WHERE p.producto_id = in_producto_id);
    SET total = precio_producto * cantidad_producto;
   
	RETURN total ;
END $$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION f_total_delivery(in_empresa_entrega_id INT, kilometros DECIMAL)
RETURNS DECIMAL(7,2)
READS SQL DATA
BEGIN
	DECLARE precio_km DECIMAL(7,2);
    DECLARE total DECIMAL(7,2);
    SET precio_km = (
		SELECT emp.precio_km 
		FROM empresa_entrega AS emp 
		WHERE emp.empresa_entrega_id = in_empresa_entrega_id
    );
    SET total = kilometros * precio_km;
   
	RETURN total ;
END $$

DELIMITER ;

/* -VIEWS- */

CREATE VIEW v_lista_precios AS
    SELECT 
        producto.nombre_producto AS nombre_producto,
        f_iva(producto.precio_producto) AS precio_lista,
        precio_X_mayor(f_iva(producto.precio_producto)) AS precio_mayorista,
        precio_X_menor(f_iva(producto.precio_producto)) AS precio_minorista
    FROM
        producto        
/*
Se crea una vista donde se puede leer la lista de precios.
La misma es una vista sensilla con 3 funciones para proporcionar los precios
con IVA, Mayorista y Minorista.
*/
;

CREATE VIEW v_ofertas_vendida_cliente AS
    SELECT 
        lc.producto_id AS producto_id,
        lc.cantidad_producto AS cantidad_producto,
        p.nombre_producto AS nombre_producto,
        co.fecha_compra AS fecha_compra,
        f_nombrecompleto(cl.nombre, cl.apellido) AS Cliente
    FROM
        (((lista_compra lc
        JOIN compra AS co ON (lc.compra_id = co.compra_id))
        JOIN cliente AS cl ON (co.cliente_id = cl.cliente_id))
        JOIN producto AS p ON (lc.producto_id = p.producto_id))
    WHERE
        p.producto_id = 1
            AND lc.cantidad_producto MOD 2 = 0            
/*
Se crea vista donde se muestra la promociones vendidas de un producto, por ejemplo podria ser un 2X1 de cualquier producto.
La vista cuenta con la informacion de la tabla lista_compra y 3 tablas a traves de JOINS para agregar la informacion pertinente a
la tabla.
Tambien hay una funcion para concatenar el nombre completo del cliente.
*/
;

CREATE OR REPLACE VIEW v_producto_cliente AS
SELECT 
	prod.nombre_producto AS productos,
    lc.cantidad_producto AS cantidad,    
    co.fecha_compra AS fecha,
    f_nombreCompleto(cl.nombre, cl.apellido) AS cliente,
    lc.sub_total AS total
FROM lista_compra AS lc
JOIN compra AS co ON lc.compra_id = co.compra_id
JOIN producto AS prod ON lc.producto_id = prod.producto_id
JOIN cliente AS cl ON co.cliente_id = cl.cliente_id
WHERE co.cliente_id >= 1 
AND co.fecha_compra BETWEEN '2022-10-01' AND '2022-10-31'
/*
Se crea una vista para visualizar los productos adquiridos por un cliente particular en el mes.
La vista contempla informacion desde la tabla lista_compra y a traves de 3 JOINs
trae los datos necesarios para mostrar de otras 3 tablas.
*/
;

CREATE OR REPLACE VIEW v_producto_proveedor AS
SELECT 
	pxp.producto_id AS codigo,
	prod.nombre_producto AS productos,
    prov.nombre_proveedor AS proveedor,    
    pxp.fecha_compra AS fecha
FROM producto_x_proveedor AS pxp
JOIN proveedor AS prov ON pxp.proveedor_id = prov.proveedor_id
JOIN producto AS prod ON pxp.producto_id = prod.producto_id
WHERE pxp.producto_id >= 1
/*
Se crea una vista para visualizar los productos por proveedor.
La vista contempla informacion desde la tabla producto_x_proveedor y a traves de 2 JOINs
trae los datos necesarios para mostrar la informacion.
*/
;

CREATE VIEW v_ofertas_vendidas_mes AS
    SELECT 
        lc.producto_id AS producto_id,
        SUM(lc.cantidad_producto) AS cantidad_producto,
        p.nombre_producto AS nombre_producto,
        co.fecha_compra AS fecha_compra
    FROM lista_compra AS lc
        JOIN compra AS co ON lc.compra_id = co.compra_id
        JOIN producto AS p ON lc.producto_id = p.producto_id
    WHERE
        p.producto_id = 1
            AND co.fecha_compra BETWEEN '2022-10-01' AND '2022-10-31'
/*
Se crea vista donde podemos ver la cantidad de un producto que se vendio entre un determinado periodo
de tiempo por ejemplo un mes.
Para la vista se utilizo la tabla lista_compra con 2 JOIN para agregar informacion relevante.
*/
;

/* -Store Procedures- */

DELIMITER $$

CREATE PROCEDURE sp_carga_stock (IN producto_id INT, IN cantidad_producto INT)
BEGIN
	UPDATE masala.producto AS p
		SET p.stock = p.stock + cantidad_producto
        WHERE p.producto_id = producto_id;	

END $$
/*
Se crea un SP sencillo para agregar al stock de un producto una cantidad pasados por parametros.
El SP se debe llamar pasando los siguientes parametros.
(producto_id , cantidad_producto (debe ser un numero entero positivo))
Ej: CALL sp_carga_stock(3, 25);
*/
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_order_by_param (IN column_param VARCHAR(50), in table_param VARCHAR(50), IN order_param BOOLEAN)
BEGIN
	SET @ascendent = 'ASC';
    SET @descendent = 'DESC';
	IF order_param = 1 THEN
		SET @order_by = CONCAT('ORDER BY ',column_param, ' ', @ascendent);
        SELECT @order_by;
	ELSE 
		SET @order_by = CONCAT('ORDER BY ', column_param, ' ', @descendent);        
	END IF;
	
    SET @consult = CONCAT('SELECT * FROM ', table_param, ' ', @order_by);
		SELECT @consult;
    
    PREPARE querySQL FROM @consult;
    EXECUTE querySQL;
    
    DEALLOCATE PREPARE querySQL;
END $$
/*
Se crea un SP para ordenar una tabla por campo en forma ascendente o descendente, se necesitan pasar por parametro
los siguientes datos.
Siempre se debe pasar como primer parametro el nombre de la columna que vamos a ordenar, segundo parametro se pasa la tabla
de la cual queremos ordenar y por ultimo en formato BOOLEAN (0, 1) 0-descendente y 1-ascendente.
(column_param limite(50)caracteres, table_param limite(50)caracteres, order_param BOOLEAN (0, 1) 0-descendente y 1-ascendente)
Ej: CALL sp_order_by_param ('nombre_producto', 'producto', 0);
*/
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_verificacion_stock (IN compra_id INT, IN in_producto_id INT, IN cantidad_producto INT)
BEGIN
	SET @stock = (SELECT p.stock FROM producto AS p WHERE producto_id = in_producto_id);
    SET @stock_minimo = (SELECT p.stock_minimo FROM producto AS p WHERE producto_id = in_producto_id);
    
    IF @stock <= @stock_minimo THEN
		INSERT INTO producto_x_proveedor (proveedor_id, producto_id, cantidad_producto, sub_total)
			VALUES (f_aleatorio(1,2), in_producto_id, 25, f_total_compra(in_producto_id, 25));		
	ELSEIF (@stock - cantidad_producto) >= 0 THEN
		
        INSERT INTO lista_compra (compra_id, producto_id, cantidad_producto, sub_total) 
        VALUE (compra_id, in_producto_id, cantidad_producto, f_total_compra(in_producto_id, cantidad_producto));
        
        UPDATE producto AS p SET p.stock = @stock_update WHERE p.producto_id = in_producto_id;
        
		IF @stock <= @stock_minimo THEN
			INSERT INTO producto_x_proveedor (proveedor_id, producto_id, cantidad_producto, sub_total)
			VALUES (f_aleatorio(1,3), in_producto_id, 25, f_total_compra(in_producto_id, 25));
		END IF;
    ELSE 
		SELECT 'ERROR: no se pudo crear la compra indicado' AS message FROM DUAL;    
    END IF;
    
END$$
/*
Se crea un SP para verificar si hay stock del producto que se desea comprar. Ademas si el stock esta o queda por debajo del stock minimo luego de la compra,
se genera una orden de compra para reponer stock del producto. Si no hay stock para la compra se muestra el mensaje -ERROR: no se pudo crear la compra indicado-.
El SP se debe llamar pasando los siguientes parametros.
(compra_id , producto_id, cantidad_producto (debe ser un numero entero positivo))
Ej: CALL sp_verificacion_stock (2, 6, 3);
*/
DELIMITER ;

/*-Triggers-*/

DELIMITER $$

CREATE TRIGGER tr_audit_table_d_cliente
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	cliente_id)
    VALUES
    (
    'cliente', 
    USER(), 
    TRUE, 
    old.cliente_id    
    );
END$$

CREATE TRIGGER tr_audit_table_d_compra
AFTER DELETE ON compra
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes,
    cliente_id,
	compra_id)
    VALUES
    (
    'compra', 
    USER(), 
    TRUE, 
    old.cliente_id,
    old.compra_id
    );
END$$

CREATE TRIGGER tr_audit_table_d_empresa_entrega
AFTER DELETE ON empresa_entrega
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	empresa_entrega_id)
    VALUES
    (
    'empresa_entrega', 
    USER(), 
    TRUE, 
    old.empresa_entrega_id    
    );
END$$

CREATE TRIGGER tr_audit_table_d_envio
AFTER DELETE ON envio
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	envio_id,
    empresa_entrega_id)
    VALUES
    (
    'envio', 
    USER(), 
    TRUE, 
    old.envio_id,
    old.empresa_entrega_id
    );
END$$

CREATE TRIGGER tr_audit_table_d_lista_compra
AFTER DELETE ON lista_compra
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes,
    lista_compra_id,
	compra_id,
    producto_id)
    VALUES
    (
    'lista_compra', 
    USER(), 
    TRUE, 
    old.lista_compra_id,
    old.compra_id,
    old.producto_id
    );
END$$

CREATE TRIGGER tr_audit_table_d_producto
AFTER DELETE ON producto
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	producto_id)
    VALUES
    (
    'producto', 
    USER(), 
    TRUE, 
    old.producto_id    
    );
END$$

CREATE TRIGGER tr_audit_table_d_producto_x_proveedor
AFTER DELETE ON producto_x_proveedor
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	producto_proveedor_id,
    proveedor_id,
    producto_id)
    VALUES
    (
    'producto_x_proveedor', 
    USER(), 
    TRUE, 
    old.producto_proveedor_id,
    old.proveedor_id,
    old.producto_id
    );
END$$

CREATE TRIGGER tr_audit_table_d_proveedor
AFTER DELETE ON proveedor
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	proveedor_id)
    VALUES
    (
    'proveedor', 
    USER(), 
    TRUE, 
    old.proveedor_id    
    );
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER tr_audit_table_cliente
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	cliente_id)
    VALUES
    (
    'cliente', 
    USER(), 
    TRUE, 
    new.cliente_id    
    );
END$$

CREATE TRIGGER tr_audit_table_compra
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts,
    cliente_id,
	compra_id)
    VALUES
    (
    'compra', 
    USER(), 
    TRUE, 
    new.cliente_id,
    new.compra_id
    );
END$$

CREATE TRIGGER tr_audit_table_empresa_entrega
AFTER INSERT ON empresa_entrega
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	empresa_entrega_id)
    VALUES
    (
    'empresa_entrega', 
    USER(), 
    TRUE, 
    new.empresa_entrega_id    
    );
END$$

CREATE TRIGGER tr_audit_table_envio
AFTER INSERT ON envio
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	envio_id,
    empresa_entrega_id)
    VALUES
    (
    'envio', 
    USER(), 
    TRUE, 
    new.envio_id,
    new.empresa_entrega_id
    );
END$$

CREATE TRIGGER tr_audit_table_lista_compra
AFTER INSERT ON lista_compra
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts,
    lista_compra_id,
	compra_id,
    producto_id)
    VALUES
    (
    'lista_compra', 
    USER(), 
    TRUE, 
    new.lista_compra_id,
    new.compra_id,
    new.producto_id
    );
END$$

CREATE TRIGGER tr_audit_table_producto
AFTER INSERT ON producto
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	producto_id)
    VALUES
    (
    'producto', 
    USER(), 
    TRUE, 
    new.producto_id    
    );
END$$

CREATE TRIGGER tr_audit_table_producto_x_proveedor
AFTER INSERT ON producto_x_proveedor
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	producto_proveedor_id,
    proveedor_id,
    producto_id)
    VALUES
    (
    'producto_x_proveedor', 
    USER(), 
    TRUE, 
    new.producto_proveedor_id,
    new.proveedor_id,
    new.producto_id
    );
END$$

CREATE TRIGGER tr_audit_table_proveedor
AFTER INSERT ON proveedor
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	proveedor_id)
    VALUES
    (
    'proveedor', 
    USER(), 
    TRUE, 
    new.proveedor_id    
    );
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER update_table_compra
AFTER INSERT ON lista_compra
FOR EACH ROW
BEGIN
	UPDATE masala.compra
		SET total = (SELECT SUM(sub_total) FROM lista_compra
	WHERE compra_id = new.compra_id)
			WHERE compra_id = new.compra_id
    ;
END$$
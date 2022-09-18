USE masala_prueba;

SELECT @@AUTOCOMMIT;

SET AUTOCOMMIT = 0;

START TRANSACTION;
DELETE FROM cliente
WHERE cliente_id >= 5;

-- ROLLBACK;

/*
INSERT INTO cliente (nombre, apellido, tipo_documento, numero_docuento, email, calle_nombre, numero, piso, dpto, ciudad, codigo_postal) 
VALUES
	('Dario', 'Pons', 'DNI', 14395677, 'dario.pons@mail.com', 'Humberto Primero', 214, 'C', '8', 'Salta', '5000'),
	('Pablo', 'Guzman', 'DNI', 13568749, 'pguzman@mail.com', 'Colon', 2536, NULL, NULL, 'Jujuy', '5000'),
	('Belen', 'Fuentes', 'DNI', 11284658, 'bfuentes@mail.com', 'Entre Rios', 11, 'D', '5', 'Jujuy', '5000')  
;*/

COMMIT;


START TRANSACTION;

INSERT INTO producto (nombre_producto,descripcion,precio_producto,stock,stock_minimo)
VALUE ('Almohada Avellana','Lorem ipsum dolor sit',101.01,25,5);
INSERT INTO producto (nombre_producto,descripcion,precio_producto,stock,stock_minimo)
VALUE ('Almohada Chocolate','Lorem ipsum dolor sit',102.21,25,5);
INSERT INTO producto (nombre_producto,descripcion,precio_producto,stock,stock_minimo)
VALUE ('Almohada Frutilla','Lorem ipsum dolor sit',104.32,25,5);
INSERT INTO producto (nombre_producto,descripcion,precio_producto,stock,stock_minimo)
VALUE ('Avena Tradicional','Lorem ipsum dolor sit',57.86,25,5);

SAVEPOINT saveCuatros;

INSERT INTO producto (nombre_producto,descripcion,precio_producto,stock,stock_minimo)
VALUE ('Anillo Frutas','Lorem ipsum dolor sit',56.88,25,5);
INSERT INTO producto (nombre_producto,descripcion,precio_producto,stock,stock_minimo)
VALUE ('Arroz Inflado Dulce','Lorem ipsum dolor sit',55.80,25,5);
INSERT INTO producto (nombre_producto,descripcion,precio_producto,stock,stock_minimo)
VALUE ('Avena Instantanea','Lorem ipsum dolor sit',57.05,25,5);
INSERT INTO producto (nombre_producto,descripcion,precio_producto,stock,stock_minimo)
VALUE ('Bolitas Chocolate','Lorem ipsum dolor sit',55.03,25,5);

SAVEPOINT saveOcho;

-- RELEASE saveCuatro;

-- ROLLBACK;

COMMIT;

SET AUTOCOMMIT = 1;
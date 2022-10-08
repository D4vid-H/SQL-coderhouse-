USE masala;

INSERT INTO cliente (nombre, apellido, tipo_documento, numero_docuento, email, calle_nombre, numero, piso, dpto, ciudad, codigo_postal) 
VALUES
	('Fernando', 'Gomez', 'DNI', 12345678, 'fgomez@mail.com', 'Colon', 1221, 'A', '3', 'Cordoba', '5000'),
	('Andrea', 'Ferrero', 'DNI', 32348628, 'andrea.ferrero@mail.com', 'Belgrano', 153, NULL, NULL, 'Santiago del Estero', '5000'),
	('Pedro', 'Alonzo', 'DNI', 11385978, 'palonzo@mail.com', 'General Paz', 121, 'E', '1', ' Buenos Aires', '5000'),
	('Felix', 'Gonzalez', 'DNI', 10445578, 'fgonzalez@mail.com', 'Santa Rosa', 21, NULL, NULL, 'Cordoba', '5000'),
	('Dario', 'Pons', 'DNI', 14395677, 'dario.pons@mail.com', 'Humberto Primero', 214, 'C', '8', 'Salta', '5000'),
	('Pablo', 'Guzman', 'DNI', 13568749, 'pguzman@mail.com', 'Colon', 2536, NULL, NULL, 'Jujuy', '5000'),
	('Belen', 'Fuentes', 'DNI', 11284658, 'bfuentes@mail.com', 'Entre Rios', 11, 'D', '5', 'Jujuy', '5000'),
    ('Gerardo', 'Gomez', 'DNI', 12345878, 'ggomez@mail.com', 'Colon', 1221, 'A', '3', 'Cordoba', '5000'),
	('Andre', 'Fererro', 'DNI', 32358628, 'afererro@mail.com', 'Belgrano', 153, NULL, NULL, 'Santiago del Estero', '5000'),
	('Pedro', 'Bello', 'DNI', 10385978, 'pbello@mail.com', 'General Paz', 121, 'E', '1', ' Buenos Aires', '5000'),
	('Felix', 'Frias', 'DNI', 09445578, 'ffrias@mail.com', 'Santa Rosa', 21, NULL, NULL, 'Cordoba', '5000'),
	('Dario', 'Barassi', 'DNI', 30395677, 'dbarassi@mail.com', 'Humberto Primero', 214, 'C', '8', 'Salta', '5000'),
	('Pablo', 'Picasso', 'DNI', 03568749, 'ppicasso@mail.com', 'Colon', 2536, NULL, NULL, 'Jujuy', '5000'),
	('Belen', 'Buenaespina', 'DNI', 27284658, 'bespina@mail.com', 'Entre Rios', 11, 'D', '5', 'Jujuy', '5000') 
;

INSERT INTO compra (cliente_id, total)
	VALUES
    (1, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 1)),
    (5, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 2)),
    (2, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 3)),
    (3, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 4)),
    (1, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 5)),
    (7, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 6)),
    (3, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 7)),
    (4, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 8)),
    (6, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 9)),
    (10, (SELECT SUM(`sub_total`) FROM lista_compra
	WHERE compra_id = 10))
;

INSERT INTO producto (nombre_producto, stock, stock_minimo, descripcion, precio_producto)
VALUES
	('Cero Syrah', 25, 5, '', 688.25),
	('Chichero Malbec', 25, 5, '', 879.65),
	('Cuatro Vacas Locas Malbec', 25, 5, '', 778.75),
	('Cuatro Vacas Locas Cabernet', 25, 5,'', 898.01),
	('Esencia de la Tierra Malbec',	25, 5, '', 956.00),
	('Santa Irene Cabernet', 25, 5, '',	680.25)
;

INSERT INTO lista_compra (compra_id, producto_id, cantidad_producto, sub_total)
	VALUES
    (1, 2, 5, f_total_compra(2,5)),
    (1, 4, 3, f_total_compra(4,3)),
    (1, 1, 2, f_total_compra(1,2)),
    (5, 4, 3, f_total_compra(4,3)),
    (2, 6, 3, f_total_compra(6,3)),
    (3, 6, 8, f_total_compra(6,8)),
    (5, 4, 5, f_total_compra(4,5)),
    (4, 2, 3, f_total_compra(2,3)),
    (4, 1, 2, f_total_compra(1,2)),
    (6, 1, 2, f_total_compra(1,2)),
    (7, 1, 2, f_total_compra(1,2)),
    (8, 1, 2, f_total_compra(1,2)),
    (9, 1, 2, f_total_compra(1,2)),
    (10, 6, 4, f_total_compra(6,4))
;

INSERT INTO empresa_entrega (nombre_empresa, precio_km)
	VALUES
    ('Transporte UNO SRL', 20),
    ('Entregas Oclock SA', 22)
;

INSERT INTO envio (compra_id, empresa_entrega_id, kilometros, total_envio)
	VALUES
    (1, 1, 35, f_total_delivery(1,35)),
    (2, 1, 18, f_total_delivery(1,18)),
    (3, 2, 7, f_total_delivery(2,7)),
    (4, 1, 9, f_total_delivery(1,9)),
    (5, 1, 3, f_total_delivery(1,3)),
    (6, 2, 4, f_total_delivery(2,4)),
    (7, 1, 6, f_total_delivery(1,6))
;

INSERT INTO proveedor (nombre_proveedor, direccion, email, ciudad, provincia)
	VALUES
    ('Bodega Santa Clara', 'Alvear 55', 'santa_clara@bodegaUno.com', 'Capital','Mendoza'),
    ('Bodega Alvarez','Irigoyen 356','bodega_alvear@gmail.com', 'Capital', 'San Juan')
;

INSERT INTO producto_x_proveedor (proveedor_id, producto_id, cantidad_producto, sub_total)
	VALUES
    (1, 3, 25, 14650),
    (1, 1, 25, 11568),
    (2, 4, 25, 16200),
    (1, 2, 25, 13846),
    (2, 6, 25, 17258),
    (1, 5, 25, 13664)
;


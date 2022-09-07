DELIMITER $$

CREATE PROCEDURE sp_carga_stock (IN producto_id INT, IN cantidad_producto INT)

BEGIN
	UPDATE producto AS p
		SET p.stock =+ cantidad_producto
        WHERE p.producto_id = producto_id;	

END $$

DELIMITER ;


/*
Se crea un SP sencillo para agregar al stock de un producto una cantidad pasados por parametros.

El SP se debe llamar pasando los siguientes parametros.
(producto_id , cantidad_producto (debe ser un numero entero positivo))

Ej: CALL sp_carga_stock(3, 25);
*/
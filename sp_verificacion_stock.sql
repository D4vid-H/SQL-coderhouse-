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

DELIMITER ;

/*
Se crea un SP para verificar si hay stock del producto que se desea comprar. Ademas si el stock esta o queda por debajo del stock minimo luego de la compra,
se genera una orden de compra para reponer stock del producto. Si no hay stock para la compra se muestra el mensaje -ERROR: no se pudo crear la compra indicado-.

El SP se debe llamar pasando los siguientes parametros.
(compra_id , producto_id, cantidad_producto (debe ser un numero entero positivo))

Ej: CALL sp_verificacion_stock (2, 6, 3);
*/
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
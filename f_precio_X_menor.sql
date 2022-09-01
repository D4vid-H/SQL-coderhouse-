DELIMITER $$

CREATE FUNCTION f_precio_X_menor`(precio DECIMAL(7,2)) 
RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE menor DECIMAL(3,2);
    DECLARE precio_por_menor DECIMAL(7,2);
    SET menor = 1.31 ;
    SET precio_por_menor = precio * menor;

RETURN precio_por_menor;
END$$

DELIMITER ;

/*
Se crea una funcion simple que recibe un parametro y lo multiplica por
un porcentaje adecuado para la venta de productos por menor.
*/

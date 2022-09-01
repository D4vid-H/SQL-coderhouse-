DELIMITER $$

CREATE FUNCTION precio_X_mayor(precio DECIMAL(7,2)) 
RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE mayor DECIMA(3,2)L;
    DECLARE precio_por_mayor DECIMAL(7,2);
    SET mayor = 1.16 ;
    SET precio_por_mayor = precio * mayor;

RETURN precio_por_mayor;
END$$

DELIMITER ;

/*
Se crea una funcion simple que recibe un parametro y lo multiplica por
un porcentaje adecuado para la venta de productos por mayor.
*/
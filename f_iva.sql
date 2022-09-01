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

DELIMITER ;

/*
Se crea una funcion simple que recibe un DECIMAL como parametro y se lo multiplica
por el porcentaje del IVA de argentina, es el 21%.
*/
DELIMITER $$

CREATE FUNCTION f_nombreCompleto(nombre VARCHAR(50), apellido VARCHAR(50)) 
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN

	DECLARE nombre_completo VARCHAR(200);
    SET nombre_completo = CONCAT(nombre, ',', apellido);

RETURN nombre_completo;
END$$

DELIMITER ;
/*
Se crea una funcion simple que concatena 2 string, el nombre y apellido de un cliente.
*/

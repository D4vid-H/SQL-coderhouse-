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

DELIMITER ;

/*
Se crea un SP para ordenar una tabla por campo en forma ascendente o descendente, se necesitan pasar por parametro
los siguientes datos.
Siempre se debe pasar como primer parametro el nombre de la columna que vamos a ordenar, segundo parametro se pasa la tabla
de la cual queremos ordenar y por ultimo en formato BOOLEAN (0, 1) 0-descendente y 1-ascendente.

(column_param limite(50)caracteres, table_param limite(50)caracteres, order_param BOOLEAN (0, 1) 0-descendente y 1-ascendente)

Ej: CALL sp_order_by_param ('nombre_producto', 'producto', 0);
*/


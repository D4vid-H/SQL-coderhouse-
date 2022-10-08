DELIMITER $$

CREATE FUNCTION f_total_delivery(in_empresa_entrega_id INT, kilometros DECIMAL)
RETURNS DECIMAL(7,2)
READS SQL DATA
BEGIN
	DECLARE precio_km DECIMAL(7,2);
    DECLARE total DECIMAL(7,2);
    SET precio_km = (
		SELECT emp.precio_km 
		FROM empresa_entrega AS emp 
		WHERE emp.empresa_entrega_id = in_empresa_entrega_id
    );
    SET total = kilometros * precio_km;
   
	RETURN total ;
END $$

DELIMITER ;
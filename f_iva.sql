CREATE DEFINER=`root`@`localhost` FUNCTION `iva`(precio DECIMAL) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN
	DECLARE iva DECIMAL;
    DECLARE precio_con_iva DECIMAL;
    SET iva = 1.21 ;
    SET precio_con_iva = precio * iva;
RETURN precio_con_iva;
END
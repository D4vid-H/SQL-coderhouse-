CREATE DEFINER=`root`@`localhost` FUNCTION `precio_X_menor`(precio DECIMAL) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN
	DECLARE menor DECIMAL;
    DECLARE precio_por_menor DECIMAL;
    SET menor = 1.31 ;
    SET precio_por_menor = precio * menor;

RETURN precio_por_menor;
END
CREATE DEFINER=`root`@`localhost` FUNCTION `precio_X_mayor`(precio DECIMAL) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN
	DECLARE mayor DECIMAL;
    DECLARE precio_por_mayor DECIMAL;
    SET mayor = 1.16 ;
    SET precio_por_mayor = precio * mayor;

RETURN precio_por_mayor;
END
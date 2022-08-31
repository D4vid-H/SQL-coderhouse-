CREATE DEFINER=`root`@`localhost` FUNCTION `f_nombreCompleto`(nombre VARCHAR(50), apellido VARCHAR(50)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

	DECLARE nombre_completo VARCHAR(200);
    SET nombre_completo = CONCAT(nombre, ',', apellido);

RETURN nombre_completo;
END
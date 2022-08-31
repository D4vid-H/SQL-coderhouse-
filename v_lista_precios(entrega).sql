CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_lista_precios` AS
    SELECT 
        `producto`.`nombre_producto` AS `nombre_producto`,
        IVA(`producto`.`precio_producto`) AS `precio_lista`,
        PRECIO_X_MAYOR(`producto`.`precio_producto`) AS `precio_mayorista`,
        PRECIO_X_MENOR(`producto`.`precio_producto`) AS `precio_minorista`
    FROM
        `producto`
        
/*
Se crea una vista donde se puede leer la lista de precios.
La misma es una vista sensilla con 3 funciones para proporcionar los precios
con IVA, Mayorista y Minorista.
*/
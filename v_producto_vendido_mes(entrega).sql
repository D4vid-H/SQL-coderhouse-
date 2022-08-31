CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_ofertas_vendidas_mes` AS
    SELECT 
        `lc`.`producto_id` AS `producto_id`,
        SUM(`lc`.`cantidad_producto`) AS `cantidad_producto`,
        `p`.`nombre_producto` AS `nombre_producto`,
        `co`.`fecha_compra` AS `fecha_compra`
    FROM
        ((`lista_compra` `lc`
        JOIN `compra` `co` ON (`lc`.`compra_id` = `co`.`compra_id`))
        JOIN `producto` `p` ON (`lc`.`producto_id` = `p`.`producto_id`))
    WHERE
        `p`.`producto_id` = 1
            AND `co`.`fecha_compra` BETWEEN '2022-07-01' AND '2022-07-31'

/*
Se crea vista donde podemos ver la cantidad de un producto que se vendio entre un determinado periodo
de tiempo por ejemplo un mes.
Para la vista se utilizo la tabla lista_compra con 2 JOIN para agregar informacion relevante.
*/
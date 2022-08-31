CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_ofertas_vendida_cliente` AS
    SELECT 
        `lc`.`producto_id` AS `producto_id`,
        `lc`.`cantidad_producto` AS `cantidad_producto`,
        `p`.`nombre_producto` AS `nombre_producto`,
        `co`.`fecha_compra` AS `fecha_compra`,
        F_NOMBRECOMPLETO(`cl`.`nombre`, `cl`.`apellido`) AS `f_nombreCompleto(cl.nombre, cl.apellido)`
    FROM
        (((`lista_compra` `lc`
        JOIN `compra` `co` ON (`lc`.`compra_id` = `co`.`compra_id`))
        JOIN `cliente` `cl` ON (`co`.`cliente_id` = `cl`.`cliente_id`))
        JOIN `producto` `p` ON (`lc`.`producto_id` = `p`.`producto_id`))
    WHERE
        `p`.`producto_id` = 1
            AND `lc`.`cantidad_producto` MOD 2 = 0
            
/*
Se crea vista donde se muestra la promociones vendidas de un producto, por ejemplo podria ser un 2X1 de cualquier producto.
La vista cuenta con la informacion de la tabla lista_compra y 3 tablas a traves de JOINS para agregar la informacion pertinente a
la tabla.
Tambien hay una funcion para concatenar el nombre completo del cliente.
*/
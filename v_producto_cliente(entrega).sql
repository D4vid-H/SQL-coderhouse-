CREATE OR REPLACE VIEW v_producto_cliente AS
SELECT 
	prod.nombre_producto AS productos,
    lc.cantidad_producto AS cantidad,    
    co.fecha_compra AS fecha,
    f_nombreCompleto(cl.nombre, cl.apellido) AS cliente,
    lc.sub_total AS total
FROM lista_compra AS lc
JOIN compra AS co ON lc.compra_id = co.compra_id
JOIN producto AS prod ON lc.producto_id = prod.producto_id
JOIN cliente AS cl ON co.cliente_id = cl.cliente_id
WHERE co.cliente_id >= 1 
AND co.fecha_compra BETWEEN '2022-10-01' AND '2022-10-31'


/*
Se crea una vista para visualizar los productos adquiridos por un cliente particular en el mes.
La vista contempla informacion desde la tabla lista_compra y a traves de 3 JOINs
trae los datos necesarios para mostrar de otras 3 tablas.
*/
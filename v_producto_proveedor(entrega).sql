CREATE OR REPLACE VIEW v_producto_proveedor AS
SELECT 
	pxp.producto_id AS codigo,
	prod.nombre_producto AS productos,
    prov.nombre_proveedor AS proveedor,    
    pxp.fecha_compra AS fecha
FROM producto_x_proveedor AS pxp
JOIN proveedor AS prov ON pxp.proveedor_id = prov.proveedor_id
JOIN producto AS prod ON pxp.producto_id = prod.producto_id
WHERE pxp.producto_id >= 1;


/*
Se crea una vista para visualizar los productos por proveedor.
La vista contempla informacion desde la tabla producto_x_proveedor y a traves de 2 JOINs
trae los datos necesarios para mostrar la informacion.
*/
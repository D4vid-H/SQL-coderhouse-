CREATE VIEW v_lista_precios AS
    SELECT 
        producto.nombre_producto AS nombre_producto,
        f_iva(producto.precio_producto) AS precio_lista,
        precio_X_mayor(f_iva(producto.precio_producto)) AS precio_mayorista,
        precio_X_menor(f_iva(producto.precio_producto)) AS precio_minorista
    FROM
        producto
        
/*
Se crea una vista donde se puede leer la lista de precios.
La misma es una vista sensilla con 3 funciones para proporcionar los precios
con IVA, Mayorista y Minorista.
*/
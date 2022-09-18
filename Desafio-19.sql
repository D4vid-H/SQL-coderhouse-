USE mysql;

SELECT * FROM user;

CREATE USER 'coderhouse1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'coder123';
CREATE USER 'coderhouse2'@'localhost' IDENTIFIED WITH mysql_native_password BY 'coder456';
/*Se crean 2 usuarios (coderhouse1 y coderhouse2) con contraseña y se espesifica el uso de password native de mysql*/

GRANT SELECT ON *.* TO 'coderhouse1'@'localhost';
/* Permiso de solo lectura en todas las tablas de las DBs para el user: coderhouse1*/

GRANT SELECT, UPDATE, INSERT ON *.* TO 'coderhouse2'@'localhost';
/*Permisos de lectura, insercion y actualizar en todas las tablas de las DBs para el user: coderhouse2*/


DELIMITER $$

CREATE TRIGGER tr_audit_table_d_cliente
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	cliente_id)
    VALUES
    (
    'cliente', 
    USER(), 
    TRUE, 
    old.cliente_id    
    );
END$$

CREATE TRIGGER tr_audit_table_d_compra
AFTER DELETE ON compra
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes,
    cliente_id,
	compra_id)
    VALUES
    (
    'compra', 
    USER(), 
    TRUE, 
    old.cliente_id,
    old.compra_id
    );
END$$

CREATE TRIGGER tr_audit_table_d_empresa_entrega
AFTER DELETE ON empresa_entrega
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	empresa_entrega_id)
    VALUES
    (
    'empresa_entrega', 
    USER(), 
    TRUE, 
    old.empresa_entrega_id    
    );
END$$

CREATE TRIGGER tr_audit_table_d_envio
AFTER DELETE ON envio
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	envio_id,
    empresa_entrega_id)
    VALUES
    (
    'envio', 
    USER(), 
    TRUE, 
    old.envio_id,
    old.empresa_entrega_id
    );
END$$

CREATE TRIGGER tr_audit_table_d_lista_compra
AFTER DELETE ON lista_compra
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes,
    lista_compra_id,
	compra_id,
    producto_id)
    VALUES
    (
    'lista_compra', 
    USER(), 
    TRUE, 
    old.lista_compra_id,
    old.compra_id,
    old.producto_id
    );
END$$

CREATE TRIGGER tr_audit_table_d_producto
AFTER DELETE ON producto
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	producto_id)
    VALUES
    (
    'producto', 
    USER(), 
    TRUE, 
    old.producto_id    
    );
END$$

CREATE TRIGGER tr_audit_table_d_producto_x_proveedor
AFTER DELETE ON producto_x_proveedor
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	producto_proveedor_id,
    proveedor_id,
    producto_id)
    VALUES
    (
    'producto_x_proveedor', 
    USER(), 
    TRUE, 
    old.producto_proveedor_id,
    old.proveedor_id,
    old.producto_id
    );
END$$

CREATE TRIGGER tr_audit_table_d_proveedor
AFTER DELETE ON proveedor
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	proveedor_id)
    VALUES
    (
    'proveedor', 
    USER(), 
    TRUE, 
    old.proveedor_id    
    );
END$$

DELIMITER ;
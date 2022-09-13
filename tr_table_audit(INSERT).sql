DELIMITER $$

CREATE TRIGGER tr_audit_table_cliente
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	cliente_id)
    VALUES
    (
    'cliente', 
    USER(), 
    TRUE, 
    new.cliente_id    
    );
END$$

CREATE TRIGGER tr_audit_table_compra
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts,
    cliente_id,
	compra_id)
    VALUES
    (
    'compra', 
    USER(), 
    TRUE, 
    new.cliente_id,
    new.compra_id
    );
END$$

CREATE TRIGGER tr_audit_table_empresa_entrega
AFTER INSERT ON empresa_entrega
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	empresa_entrega_id)
    VALUES
    (
    'empresa_entrega', 
    USER(), 
    TRUE, 
    new.empresa_entrega_id    
    );
END$$

CREATE TRIGGER tr_audit_table_envio
AFTER INSERT ON envio
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	envio_id,
    empresa_entrega_id)
    VALUES
    (
    'envio', 
    USER(), 
    TRUE, 
    new.envio_id,
    new.empresa_entrega_id
    );
END$$

CREATE TRIGGER tr_audit_table_lista_compra
AFTER INSERT ON lista_compra
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts,
    lista_compra_id,
	compra_id,
    producto_id)
    VALUES
    (
    'lista_compra', 
    USER(), 
    TRUE, 
    new.lista_compra_id,
    new.compra_id,
    new.producto_id
    );
END$$

CREATE TRIGGER tr_audit_table_producto
AFTER INSERT ON producto
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	producto_id)
    VALUES
    (
    'producto', 
    USER(), 
    TRUE, 
    new.producto_id    
    );
END$$

CREATE TRIGGER tr_audit_table_producto_x_proveedor
AFTER INSERT ON producto_x_proveedor
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	producto_proveedor_id,
    proveedor_id,
    producto_id)
    VALUES
    (
    'producto_x_proveedor', 
    USER(), 
    TRUE, 
    new.producto_proveedor_id,
    new.proveedor_id,
    new.producto_id
    );
END$$

CREATE TRIGGER tr_audit_table_proveedor
AFTER INSERT ON proveedor
FOR EACH ROW
BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	proveedor_id)
    VALUES
    (
    'proveedor', 
    USER(), 
    TRUE, 
    new.proveedor_id    
    );
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER update_table_compra
AFTER INSERT ON lista_compra
FOR EACH ROW
BEGIN
	UPDATE masala.compra
		SET total = (SELECT SUM(sub_total) FROM lista_compra
	WHERE compra_id = new.compra_id)
			WHERE compra_id = new.compra_id
    ;
END$$
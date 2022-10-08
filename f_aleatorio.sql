DELIMITER //

CREATE FUNCTION f_aleatoio (min INT, max INT)
	RETURNS INT
    DETERMINISTIC
    BEGIN
		DECLARE aleatorio INT;
        SET aleatorio = (SELECT FLOOR(RAND() * (max - min)) + min );
        
        RETURN aleatorio ;
    END //
    
    DELIMITER ;
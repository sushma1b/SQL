-- STORED PRODUCER

DELIMITER //
CREATE PROCEDURE first_procedure(IN p_id INT, IN P_name CHAR(100),IN email CHAR(100))
BEGIN
	INSERT INTO customers
    VALUES
    (p_id, p_name, p_email);
END //

DELIMITER ;
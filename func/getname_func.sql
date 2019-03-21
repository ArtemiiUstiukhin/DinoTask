DROP FUNCTION IF EXISTS getname;
DELIMITER //
create function getname (id INT UNSIGNED) RETURNS VARCHAR(50)
BEGIN
    DECLARE str VARCHAR(50);
    select a.Name into str from Dino.Accounts a where a.UID = id LIMIT 1;

    RETURN str;
END//


DROP FUNCTION IF EXISTS numb;
DELIMITER //
create function numb(num INT, type VARCHAR(255)) RETURNS DOUBLE
BEGIN
    DECLARE a INT;
    DECLARE b DOUBLE;
    IF (type='in')
    THEN SET a:=1;
    ELSEIF (exists(select * from Dino.Numbers where Phone_Number = num)=0)
    THEN SET a = 3;
    ELSE SET a = 2;
    END IF;
    select r.Money into b from Dino.Rates r where r.Id = a;
    RETURN b;
END//


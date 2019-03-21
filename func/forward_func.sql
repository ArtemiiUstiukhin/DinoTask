DROP FUNCTION IF EXISTS pr;
DELIMITER //
create function pr (id INT UNSIGNED) RETURNS INTEGER
BEGIN
    DECLARE a INT;
    DECLARE b INT;
    DECLARE str VARCHAR(50);
    SET a := id;
    REPEAT
        SET b := a;
        IF (exists(select cf.To from Dino.Call_forwarding cf where cf.From = b)=0)
        THEN SET a:=0;
	ELSE select cf.To into a from Dino.Call_forwarding cf where cf.From = b;
        END IF;
        IF a=b THEN SET a:=0; END IF;
    UNTIL a = 0
    END REPEAT;
    RETURN b;
END//


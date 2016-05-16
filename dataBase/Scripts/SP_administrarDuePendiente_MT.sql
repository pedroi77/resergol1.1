DROP PROCEDURE IF EXISTS SP_administrarDuePendiente

DELIMITER // 
CREATE PROCEDURE `SP_administrarDuePendiente`(IN `pIdDuenio` INT(11), IN `pAcepta` INT, OUT `pResultado` INT)
    NO SQL
BEGIN 

DECLARE Error INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION  SET Error = -1;

if (pAcepta = 1) then

update duenios set
IdEstado = 2
where IdDuenio = pIdDuenio;

ELSE

update duenios set
IdEstado = 4
where IdDuenio = pIdDuenio;

end IF;


    IF Error=-1 THEN
        SET pResultado = -1; 
    ELSE
        SET pResultado = 1;
	end IF;

end
DROP FUNCTION IF EXISTS hello_func;

delimiter $$
CREATE FUNCTION hello_func()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:59' THEN
			RETURN concat('Текущее время ', CURTIME(), ' >>> Доброе утро '); 
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:59' THEN
			RETURN concat('Текущее время ', CURTIME(), ' >>> Добрый день');
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN
			RETURN concat('Текущее время ', CURTIME(), ' >>> Добрый вечер');
		ELSE
			RETURN concat('Текущее время ', CURTIME(), ' >>> Доброй ночи');
	END CASE;
END $$
delimiter ;


select hello_func();

 SELECT CURTIME();

DROP PROCEDURE IF EXISTS hello_proc;
delimiter $$
CREATE PROCEDURE hello_proc()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:59' THEN
			SELECT concat('Текущее время ', CURTIME(), ' >>> Доброе утро '); 
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:59' THEN
			SELECT concat('Текущее время ', CURTIME(), ' >>> Добрый день');
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN
			SELECT concat('Текущее время ', CURTIME(), ' >>> Добрый вечер');
		ELSE
			SELECT concat('Текущее время ', CURTIME(), ' >>> Доброй ночи');
	END CASE;
END $$
delimiter ;

CALL hello_proc();
















DROP FUNCTION  IF EXISTS fibonacci;
DELIMITER $$
CREATE FUNCTION fibonacci(num INT)
RETURNS VARCHAR(2200)
DETERMINISTIC
BEGIN
    DECLARE fib1 INT DEFAULT 0;
    DECLARE fib2 INT DEFAULT 1;
    DECLARE fib3 INT DEFAULT 0;
    DECLARE str VARCHAR(255) DEFAULT '0 1';
    
    IF num = 1 THEN
        RETURN CONCAT(fib1, ' ');
    ELSEIF num = 2 THEN
        RETURN CONCAT(fib1,' ', fib2);
    ELSE
        WHILE num > 2 DO
            SET fib3 = fib1 + fib2;
            SET fib1 = fib2;
            SET fib2 = fib3;
            SET num = num - 1;
            SET str = CONCAT(str, ' ',fib3);
        END WHILE;
        RETURN CONCAT(str);
    END IF;
END $$
DELIMITER ;

SELECT fibonacci(25);


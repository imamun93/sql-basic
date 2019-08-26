DROP TABLE IF EXISTS hours;
CREATE TABLE hours (HOUR VARCHAR(13) PRIMARY KEY);
DROP PROCEDURE IF EXISTS fill_hours;

DELIMITER |
CREATE PROCEDURE fill_hours(start_time DATETIME, end_time DATETIME)
BEGIN
  DECLARE crt_time DATETIME;
  SET crt_time=DATE_SUB(start_time, INTERVAL DATE_FORMAT(start_time, '%i:%s') MINUTE_SECOND);
  WHILE crt_time < end_time DO
    INSERT INTO hours VALUES(DATE_FORMAT(crt_time, '%Y-%m-%d-%H'));
    SET crt_time = DATE_ADD(crt_time, INTERVAL 1 HOUR);
  END WHILE;
END |

CALL fill_hours( (SELECT MIN(created_at) FROM mysqlassignment.order_details), (SELECT MAX(created_at) FROM mysqlassignment.order_details) );
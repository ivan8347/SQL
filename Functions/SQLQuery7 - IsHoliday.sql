--SQLQuery7 - IsHoliday.sql
USE SPU_411_Import
GO
--CREATE FUNCTION dbo.IsHoliday(@date DATE)
--RETURNS BIT
--AS
--BEGIN
--    IF EXISTS (
--        SELECT 1 
--        FROM Holidays
--        WHERE @date BETWEEN start_date AND DATEADD(DAY, duration - 1, start_date)
--    )
--        RETURN 1;

--    RETURN 0;
--END
SELECT * FROM Holidays;

--SQLQuery0 - TestHolidays.sql
USE SPU_411_Import;
SET DATEFIRST 1;
GO
DELETE FROM DaysOFF;
EXEC sp_AddHolydays 2026,N'Нов%'
SELECT
	[Дата]  = [date],
	[Праздник] = holiday_name
FROM   DaysOFF,Holidays
WHERE  holiday = holiday_id;
--FROM DaysOFF JOIN Holidays ON holiday = holiday_id WHERE YEAR([date]) = 2025;
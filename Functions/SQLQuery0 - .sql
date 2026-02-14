
SET DATEFIRST 1;

USE SPU_411_Import;


--PRINT (dbo.GetLastDate(N'SPU_411'));
--PRINT (dbo.GetNextDay(N'SPU_411'));

--SELECT * FROM Schedule WHERE [group]  = 3;

--EXEC sp_SelectScheduleFull;
--PRINT (dbo.GetNextDate(N'PD_212'))
--PRINT (dbo.GetNextDate(N'SPU_411'))
--PRINT (dbo.GetNewYearHolidaysStartDate(2025));
--PRINT (dbo.GetSummerHolydaysStart(2025));
--PRINT (dbo.GetHolydayDuration(N'Лет%'));
--PRINT (dbo.GetHolidaysStartDate(N'Майские%',2025));
--PRINT (dbo.GetHolidaysStartDate(N'23%',2025));
--PRINT (dbo.GetHolidaysStartDate(N'8%',2025));
--PRINT (dbo.GetHolidaysStartDate(N'Нов%',2025));
PRINT (dbo.GetEasterDate(2026));
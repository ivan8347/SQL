--SQLQuery0-CHECK Procedure.sql
USE SPU_411_Import;
SET LANGUAGE N'Russian'

--DELETE FROM Schedule WHERE [group] = 411;
--DELETE FROM DaysOFF WHERE [date] BETWEEN N'2026-01-01' AND N'2026-12-31'
--EXEC sp_InsertScheduleSemistacionar N'SPU_411',N'Объект%C++',N'Ковтун';


--EXEC sp_SelectScheduleFull;
--EXEC sp_SelectSchedule N'SPU_411', N'Процедурное%C++';
EXEC sp_AddHolidaysAll 2026;
SELECT
	[date],Holiday_name
FROM DaysOFF JOIN Holidays ON (holiday = holiday_id)
WHERE [date] BETWEEN N'2025-12-01' AND N'2026-12-31'




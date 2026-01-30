--ProcTest.sql
USE SPU_411_Import;
GO
EXEC sp_InsertScheduleSemistacionar N'SPU_411',5,N'Ковтун',N'2026-01-24',N'10:00';
EXEC sp_PrintScheduleStacionar N'SPU_411';

--DELETE FROM Schedule;
--SELECT name
--FROM sys.objects
--WHERE type = 'P' AND name LIKE 'sp_%';
--SELECT * 
--FROM Disciplines 
--WHERE number_of_lessons = 70;
--SELECT TOP 20 *
--FROM Schedule
--ORDER BY date DESC;

--DELETE FROM Schedule
--WHERE [group] = (SELECT group_id FROM Groups WHERE group_name = N'SPU_411')
--  AND discipline = 4;

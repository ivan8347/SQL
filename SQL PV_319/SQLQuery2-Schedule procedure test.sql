--SQLQuery2-Schedule procedure test.sql
USE SPU_411_Import;
GO
--EXEC sp_ScheduleForGroup N'PV_319',N'%UML%',N'Ковтун',N'2024-08-10',N'18:30';
EXEC sp_PrintScheduleForGroup N'PV_319';
--SELECT * FROM Schedule;
--ProcTest.sql
USE SPU_411_Import;
GO
EXEC sp_InsertScheduleSemistacionar N'SPU_411',1,N'Ковтун',N'2024-10-26',N'10:00';
EXEC sp_PrintScheduleStacionar N'SPU_411';



--SELECT * 
--FROM Disciplines 
--WHERE number_of_lessons = 70;


--DELETE FROM Schedule
--WHERE [group] = (SELECT group_id FROM Groups WHERE group_name = N'SPU_411')
--  AND discipline = 4;

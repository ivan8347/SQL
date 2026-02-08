--SQLQuery0-CHECK Procedure.sql
USE SPU_411_Import;
SET LANGUAGE N'Russian'

--DELETE FROM Schedule WHERE [group] = 319;

EXEC sp_InsertScheduleSemistacionar N'SPU_411',2,N'Ковтун';


EXEC sp_SelectScheduleFull;
--EXEC sp_SelectSchedule N'SPU_411', N'Процедурное%C++';

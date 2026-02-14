--SQLQuery7 - AddHolidaysAll.sql
USE SPU_411_Import;
SET DATEFIRST 1;
GO
ALTER PROCEDURE sp_AddHolidaysAll @year AS SMALLINT
AS
BEGIN
	EXEC sp_AddHolydays @year,N'Нов%'
	EXEC sp_AddHolydays @year,N'23%';
	EXEC sp_AddHolydays @year,N'8%';
	EXEC sp_AddHolydays @year,N'Пасха';
	EXEC sp_AddHolydays @year,N'Май%';
	EXEC sp_AddHolydays @year,N'Лет%';
	EXEC sp_AddHolydays @year,N'День%';
END
--SQLQuery7 - GetSummerTimeSadness.sql
USE SPU_411_Import;
GO
--SET DATEFIRST  1;
ALTER FUNCTION   GetSummerHolydaysStart (@year AS SMALLINT) RETURNS DATE
BEGIN
	DECLARE		@first_august	AS DATE		= DATEFROMPARTS	(@year,08,01);
	DECLARE		@weekday		AS TINYINT	= DATEPART		(WEEKDAY,@first_august);
	DECLARE		@start_date		AS DATE		= DATEADD		(DAY,1 - @weekday,@first_august);
	RETURN		@start_date;

END
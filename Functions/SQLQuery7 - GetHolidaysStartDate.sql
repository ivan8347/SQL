--SQLQuery7 - GetHolidayStartDate.sql
USE SPU_411_Import;
GO
ALTER FUNCTION GetHolidaysStartDate (@holiday NVARCHAR(150), @year SMALLINT) RETURNS DATE
BEGIN
	DEClARE @month AS TINYINT = (SELECT [month] FROM Holidays WHERE holiday_name LIKE @holiday);
	DEClARE @day AS TINYINT = (SELECT [day] FROM Holidays WHERE holiday_name LIKE @holiday);
	DECLARE @start_date AS DATE =
	(
	CASE 
			WHEN @holiday LIKE  N'Нов%'	THEN dbo.GetNewYearHolidaysStartDate(@year)	
			WHEN @holiday LIKE  N'Лет%'		THEN dbo.GetSummerHolydaysStart(@year)
			WHEN @month != 0 AND @day != 0  THEN DATEFROMPARTS(@year,@month,@day)
			END
	)
	RETURN @start_date; 

	--SET @start_date = DATEFROMPARTS(SELECT  FROM 
	
END
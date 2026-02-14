--SQLQuery7 -CREATE Procedure Add Holydays.sql
USE SPU_411_Import;
SET DATEFIRST 1;
GO
ALTER PROCEDURE sp_AddHolydays
@year AS SMALLINT,
@name AS NVARCHAR(150)
AS
BEGIN
	DECLARE 
	@start_date		AS DATE		= dbo.GetHolidaysStartDate(@name,@year),
	@duration		AS TINYINT	= dbo.GetHolydayDuration(@name),
	@holiday_id		AS TINYINT	= dbo.GetHoldayID(@name);

	DECLARE 
	@date			AS DATE		= @start_date,
	@day			AS TINYINT	= 0;

	WHILE @day < @duration
	BEGIN
	IF NOT EXISTS ( SELECT 1 FROM DaysOFF WHERE [date] = @date )
		INSERT DaysOFF([date],holiday)
		VALUES (@date,@holiday_id);
		SET @day += 1;
		SET @date = DATEADD(DAY,1,@date);
	END


END

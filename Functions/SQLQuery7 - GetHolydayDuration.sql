--SQLQuery7 - GetHolydayDuration.sql
USE SPU_411_Import;
GO
ALTER FUNCTION GetHolydayDuration (@name AS NVARCHAR(150)) RETURNS TINYINT
BEGIN
	RETURN (SELECT duration FROM Holidays WHERE holiday_name LIKE @name);
END
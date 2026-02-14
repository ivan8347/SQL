--SQLQuery7 - GetHolidayID.sql
USE SPU_411_Import;
GO
ALTER FUNCTION GetHoldayID (@holiday_name NVARCHAR(150)) RETURNS TINYINT
BEGIN
RETURN (SELECT holiday_id FROM Holidays WHERE holiday_name LIKE @holiday_name);
END
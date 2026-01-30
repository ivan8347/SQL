-- sp_InsertScheduleSemistacionar.sql
USE SPU_411_Import;
GO
ALTER PROCEDURE sp_InsertScheduleSemistacionar
	@group_name				NVARCHAR(16),
	--@discipline_name		NVARCHAR(150),
	@discipline_id			SMALLINT,
	@teacher_last_name		NVARCHAR(50),
	@start_date				DATE,
	@start_time				TIME
	AS
BEGIN
	SET DATEFIRST 1;

DECLARE @group				AS	INT			=	 (SELECT group_id			FROM Groups			WHERE group_name = @group_name);
DECLARE @discipline			SMALLINT		=	@discipline_id;
--DECLARE @discipline			AS	SMALLINT	=	 (SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE @discipline_name);
DECLARE @number_of_lessons	AS	TINYINT		=	 (SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id = @discipline);
DECLARE @lesson_number		AS	INT			=	 1;
DECLARE @teacher			AS	INT			=	 (SELECT teacher_id			FROM Teachers		WHERE last_name LIKE @teacher_last_name);
DECLARE @date				AS	DATE		=	 @start_date;
DECLARE @time				AS TIME;




		PRINT (@group)
		PRINT (@discipline)
		PRINT (@number_of_lessons)
		PRINT (@teacher)
		PRINT (@date)
		PRINT (@start_time)

		PRINT ('----------------------------');
		PRINT (@date);
		PRINT (DATENAME(WEEKDAY,@date));

 --BEGIN
	--    SET @time = @start_time;
	--    IF NOT EXISTS (SELECT [group] FROM Schedule Where[date] = @date AND [time] = @time)
	--	INSERT Schedule ([group],discipline,teacher,[date],[time],spent)
	--	VALUES (@group,@discipline,@teacher,@date,@time,IIF(@date < GETDATE(),1,0));
 --END

	--	SET @lesson_number = @lesson_number + 1;
	--	SET @time =  DATEADD (MINUTE,95,@time);
	--	IF NOT EXISTS (SELECT [group] FROM Schedule Where[date] = @date AND [time] = @time)
 --BEGIN
	--    INSERT Schedule ([group],discipline,teacher,[date],[time],spent)
	--    VALUES (@group,@discipline,@teacher,@date,@time,IIF(@date < GETDATE(),1,0));
 --END

	--    SET @lesson_number = @lesson_number + 1;
	--	SET @time =  DATEADD (MINUTE,95,@time);
	--	IF NOT EXISTS (SELECT [group] FROM Schedule Where[date] = @date AND [time] = @time)
 --BEGIN
	--	INSERT Schedule ([group],discipline,teacher,[date],[time],spent)
	--	VALUES (@group,@discipline,@teacher,@date,@time,IIF(@date < GETDATE(),1,0));
 --END

	--	 SET @lesson_number = @lesson_number + 1;
	--	 SET @date = DATEADD (DAY, 7, @date);
 --END;
-- WHILE (@lesson_number <= @number_of_lessons)

WHILE (@lesson_number <= @number_of_lessons)
BEGIN
    -- ѕара 1 Ч 10:00
    SET @time = '10:00';

    IF NOT EXISTS (SELECT 1 FROM Schedule WHERE [date] = @date AND [time] = @time)
        INSERT Schedule ([group], discipline, teacher, [date], [time], spent)
        VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1, 0));

    SET @lesson_number += 1;
    IF @lesson_number > @number_of_lessons BREAK;

    -- ѕара 2 Ч 11:35
    SET @time = '11:35';

    IF NOT EXISTS (SELECT 1 FROM Schedule WHERE [date] = @date AND [time] = @time)
        INSERT Schedule ([group], discipline, teacher, [date], [time], spent)
        VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1, 0));

    SET @lesson_number += 1;
    IF @lesson_number > @number_of_lessons BREAK;

    -- ѕара 3 Ч 13:10
    SET @time = '13:10';

    IF NOT EXISTS (SELECT 1 FROM Schedule WHERE [date] = @date AND [time] = @time)
        INSERT Schedule ([group], discipline, teacher, [date], [time], spent)
        VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1, 0));

    SET @lesson_number += 1;

    -- —ледующа€ недел€
    SET @date = DATEADD(DAY, 7, @date);
END;

	
 END
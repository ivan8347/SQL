--SQLQuery1-CREATE Proc.sql

USE SPU_411_Import;
GO
ALTER PROCEDURE sp_ScheduleForGroup
	@group_name				NVARCHAR(16),
	@discipline_name		NVARCHAR(150),
	@teacher_last_name		NVARCHAR(50),
	@start_date				DATE,
	@time					TIME(0)
AS
BEGIN
		SET DATEFIRST 1;
		DECLARE @group				AS	INT			=	 (SELECT group_id			FROM Groups			WHERE group_name = @group_name);
		DECLARE @discipline			AS	SMALLINT	=	 (SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE @discipline_name);
		DECLARE @number_of_lessons	AS	TINYINT		=	 (SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id = @discipline);
		DECLARE @lesson_number		AS	INT			=	 1;
		DECLARE @teacher			AS	INT			=	 (SELECT teacher_id			FROM Teachers		WHERE last_name LIKE @teacher_last_name);
		DECLARE @date				AS	DATE		=	 @start_date;
		
		
		
	WHILE (@lesson_number <= @number_of_lessons)
	BEGIN 
		
		PRINT (@date);
		PRINT (DATENAME(WEEKDAY,@date));
		PRINT (@number_of_lessons);
		PRINT (@time);
		--SET @time = @start_time;
		
		 IF NOT EXISTS (SELECT [group] FROM Schedule Where[date] = @date AND [time] = @time)
		BEGIN
			INSERT Schedule ([group],discipline,teacher,[date],[time],spent)
			VALUES (@group,@discipline,@teacher,@date,@time,IIF(@date < GETDATE(),1,0));
		END
		
		SET   @lesson_number +=1; -- @lesson_number + 1;
		--PRINT (@number_of_lessons);
		SET @time = (DATEADD(MINUTE,95,@time));
		
		 IF NOT EXISTS (SELECT [group] FROM Schedule Where[date] = @date AND [time] = @time)
		BEGIN
			INSERT Schedule ([group],discipline,teacher,[date],[time],spent)
			VALUES (@group,@discipline,@teacher,@date,@time,IIF(@date < GETDATE(),1,0));
		END
		SET   @lesson_number += 1; -- @lesson_number + 1;
		
		
		PRINT ('----------------------------');
		IF (DATEPART(WEEKDAY,@date) = 6 )
		BEGIN
		SET @date =DATEADD(DAY,3,@date);
		END
		ELSE
		BEGIN
		SET @date = DATEADD (DAY,2,@date);
		END
		
		
	END
END

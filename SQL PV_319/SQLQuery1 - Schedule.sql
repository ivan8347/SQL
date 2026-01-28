--SQLQuery1 - Schedule.sql
USE SPU_411_Import;
GO
SET DATEFIRST 1;
DECLARE @group				AS	INT			=	 (SELECT group_id			FROM Groups			WHERE group_name = N'PV_319');
DECLARE @discipline			AS	SMALLINT	=	 (SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE(N'UML%'));
DECLARE @number_of_lessons	AS	TINYINT		=	 (SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id = @discipline);
DECLARE @lesson_number		AS	INT			=	 1;
DECLARE @teacher			AS	INT			=	 (SELECT teacher_id			FROM Teachers		WHERE first_name LIKE (N'Олег'));
DECLARE @start_date			AS	DATE		=	 N'2024-06-22';
DECLARE @date				AS	DATE		=	 @start_date;
DECLARE @start_time			AS	TIME		=	 N'18:30';
DECLARE @time				AS	TIME(0) ;



WHILE (@lesson_number <= @number_of_lessons)
BEGIN 

PRINT (@date);
PRINT (DATENAME(WEEKDAY,@date));
PRINT (@number_of_lessons);
PRINT (@start_time);
SET @time = @start_time;

--первый урок

 IF NOT EXISTS (SELECT [group] FROM Schedule Where[date] = @date AND [time] = @time)
BEGIN
	INSERT Schedule ([group],discipline,teacher,[date],[time],spent)
	VALUES (@group,@discipline,@teacher,@date,@time,IIF(@date < GETDATE(),1,0));
END

SET   @lesson_number = @lesson_number + 1;
PRINT (@lesson_number);
PRINT(DATEADD(MINUTE, 95, @start_time));
--SET @time = (DATEADD(MINUTE,95,@time));

--второй урок

IF NOT EXISTS (SELECT * FROM Schedule WHERE [group]=@group AND discipline=@discipline AND [date]=@date AND [time]=DATEADD(MINUTE, 95, @time))
		
 --IF NOT EXISTS (SELECT [group] FROM Schedule Where[date] = @date AND [time] = @time)
BEGIN
	INSERT Schedule ([group],discipline,teacher,[date],[time],spent)
	VALUES (@group, @discipline, @teacher, @date, DATEADD(MINUTE, 95, @start_time), IIF(@date < GETDATE(), 1, 0));
	--VALUES (@group,@discipline,@teacher,@date,@time,IIF(@date < GETDATE(),1,0));
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


END;
--SELECT * FROM Schedule
--DELETE FROM Schedule;

SELECT
		[Группа]			 =		group_name,
		[День]				 =		DATENAME(WEEKDAY,[date]),
		[Дата]				 =		[date],
		[Время]				 =		[time],
		[Дисциплина]		 =		discipline_name,
		[Преподователь]		 =		FORMATMESSAGE(N'%s %s %s',last_name,first_name,middle_name),
		[Статус]			 =		IIF(spent = 1,N'Проведено', N'Запланировано')
FROM Schedule
		JOIN Groups			 ON		([group] = group_id)
		JOIN Disciplines	 ON		discipline = discipline_id
		JOIN Teachers		 ON		teacher = teacher_id
WHERE	group_name			 =		N'PV_319'

--SELECT DISTINCT [time]
--FROM Schedule
--WHERE [group] = (SELECT group_id FROM Groups WHERE group_name = N'PV_319')
--ORDER BY [time];

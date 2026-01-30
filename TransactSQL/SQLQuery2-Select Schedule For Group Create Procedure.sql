--SQLQuery2-Select Schedule For Group Create Procedure.sql
USE SPU_411_Import;
GO
ALTER PROCEDURE sp_SelectSchedule

			@group_name			AS		NVARCHAR(24),
			@discipline			AS		NVARCHAR(150)
AS
BEGIN
	SELECT 
			[Группа]			 =		group_name,
			[Дата]				 =		[date],
			[Время]				 =		[time],
			[Дисциплина]		 =		discipline_name,
			[Преподователь]		 =		FORMATMESSAGE(N'%s %s %s',last_name,first_name,middle_name),
			[Статус]			 =		IIF(spent = 1,N'Проведено', N'Запланировано')

	FROM	Schedule
	JOIN	Groups						ON		[group]			=	group_id
	JOIN	Disciplines					ON		discipline		=	discipline_id
	JOIN	Teachers					ON		teacher			=	teacher_id
	WHERE	group_id			 =		(SELECT group_id	  FROM Groups		WHERE	group_name = @group_name)
	AND		discipline_id		 =		(SELECT discipline_id FROM Disciplines	WHERE	discipline_name LIKE @discipline)

END
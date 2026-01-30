--SQLQuery2-CREATE ProcPrintScheduleStacionar .sql
USE SPU_411_Import;
GO
ALTER PROCEDURE sp_PrintScheduleStacionar 

		@group_name	NVARCHAR(16),
		@discipline_name NVARCHAR(150) = N''
AS
BEGIN
	SELECT
		[Группа]			=	@group_name,
		[Дата]				=	[date], 
		[День]				=	DATENAME(WEEKDAY,[date]),
		[Время]				=	[time],
		[Дисциплина]		=	discipline_name,
		[Преподователь]		=	FORMATMESSAGE(N'%s %s %s',last_name,first_name,middle_name),
		[Статус]			=	IIF(spent = 1,N'Проведено', N'Запланировано')
	FROM			Schedule
			JOIN	Groups		ON [group] = group_id
			JOIN	Disciplines ON discipline = discipline_id
			JOIN	Teachers	ON teacher = teacher_id
	WHERE 
	--		group_id =		(SELECT group_id FROM Groups WHERE group_name = @group_name)
	--AND		discipline_id = (SELECT discipline_id FROM Disciplines WHERE discipline_name 
	--LIKE IIF( @discipline_name = N'',N'%',@discipline_name))
	--ORDER BY [date] ASC
	group_name = @group_name 
	AND discipline_name LIKE IIF(@discipline_name = N'', N'%', @discipline_name) 
	ORDER BY [date];


END
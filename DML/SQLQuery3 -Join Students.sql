--SQLQuery3 -Join Students.sql
USE SPU_411_Import;

--SELECT
--		[Студент]					=  FORMATMESSAGE(N'%s %s %s ',last_name,first_name,middle_name),
--		[Группа]					=  group_name,
--		[Направление обучения]		=  direction_name,
--		[Дисциплина]				=  discipline_name
	
--FROM Students
--JOIN Groups			ON		[group] = group_id
--JOIN Directions		ON		direction = direction_id
--JOIN DisciplinesDirectionsRelation ON direction_id = DisciplinesDirectionsRelation.direction
--JOIN Disciplines ON discipline = discipline_id
--WHERE stud_id = 20
--	;

SELECT
[Направление обучения] = direction_name,
[Количество групп] = COUNT(DISTINCT group_id),
[Количество студентов] = COUNT(stud_id)

FROM Students
RIGHT JOIN		Groups					ON	 [group] = group_id
RIGHT JOIN		Directions			ON	 direction = direction_id
GROUP BY		direction_name;
--INER JOIN
--OUTER JOIN
--LEFT JOIN
--RIGHT JOIN 
--FULL JOIN
SELECT
[Группы] = group_name,
[Количество студентов] = COUNT(stud_id)

FROM Students
RIGHT JOIN   Groups ON [group] = group_id
RIGHT JOIN Directions ON direction = direction_id
GROUP BY [group_name], direction_name
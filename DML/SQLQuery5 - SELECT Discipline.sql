-- SQLQuery5 - SELECT Discipline.sql
USE SPU_411_Import;
SELECT
	[Направление обучения]   = direction_name,
	[Дисциплины]			 = discipline_name

FROM Directions ,Disciplines ,DisciplinesDirectionsRelation 
WHERE direction = direction_id
AND discipline = discipline_id
AND direction_name LIKE N'Game%';

----SELECT * FROM TeachersDisciplinesRelation;

SELECT
	[Дисциплины]			= discipline_name,
	[Направление обучения]  = direction_name
FROM Directions ,Disciplines ,DisciplinesDirectionsRelation 
WHERE discipline = discipline_id
AND direction = direction_id
AND discipline_name LIKE N'Теория%';




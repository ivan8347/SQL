--SQLQuery4 - SELECT Teacher_3.sql
USE SPU_411_Import;
--SELECT
--     COUNT(DISTINCT discipline_id )  AS N'Количество дисциплин',
--     COUNT(DISTINCT teacher_id)  AS N'Количество преподавателей'
--     FROM Disciplines,Teachers


--SELECT
--    d.discipline_name AS N'Дисциплина',
--    COUNT(DISTINCT t.teacher_id) AS N'Количество преподавателей'
--FROM Disciplines d --Teachers t
--LEFT JOIN TeachersDisciplinesRelation r ON r.discipline = discipline_id
--LEFT JOIN Teachers t ON t.teacher_id = r.teacher 
--GROUP BY 
--    d.discipline_name
--ORDER BY d.discipline_name ASC;

--SELECT
--		FORMATMESSAGE(N'%s %s %s', last_name,first_name,middle_name) AS N'Преподователь',
--		COUNT(DISTINCT d.discipline_id) AS N'Количество дисциплин'
--FROM Teachers t
--JOIN TeachersDisciplinesRelation r ON  r.teacher = teacher_id
--JOIN Disciplines d ON d.discipline_id = r.discipline
--GROUP BY t.last_name, t.first_name, t.middle_name 
--ORDER BY t.last_name  ASC;

SELECT
	FORMATMESSAGE(N'%s %s %s', last_name,first_name,middle_name) AS N'Преподователь'
FROM Teachers,Disciplines
WHERE 



--SQLQuery4 - SELECT Teacher_3.sql
USE SPU_411_Import;
--SELECT
--     COUNT(DISTINCT discipline_id )  AS N'Количество дисциплин',
--     COUNT(DISTINCT teacher_id)  AS N'Количество преподавателей'
--     FROM Disciplines,Teachers


--SELECT
--    discipline_name AS N'Дисциплина',
--    COUNT(DISTINCT teacher_id) AS N'Количество преподавателей'
--FROM Disciplines 
--LEFT JOIN TeachersDisciplinesRelation  ON discipline = discipline_id
--LEFT JOIN Teachers  ON teacher_id = teacher 
--GROUP  BY discipline_name
--ORDER BY discipline_name ASC;

SELECT
		FORMATMESSAGE(N'%s %s %s', last_name,first_name,middle_name) AS N'Преподователь',
		COUNT(DISTINCT discipline_id) AS N'Количество дисциплин'
FROM Teachers 
JOIN TeachersDisciplinesRelation  ON  teacher = teacher_id
JOIN Disciplines  ON discipline_id = discipline
GROUP BY last_name, first_name, middle_name 
ORDER BY last_name  ASC;

SELECT
    FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name) AS N'Преподаватель'
FROM Teachers 
LEFT JOIN TeachersDisciplinesRelation  ON teacher = teacher_id
WHERE discipline IS NULL
ORDER BY last_name, first_name;





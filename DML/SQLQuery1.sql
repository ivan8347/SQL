USE SPU_411_Import;

SELECT
    d.direction_name AS N'Направление обучения',
    COUNT(DISTINCT g.group_id) AS N'Количество групп',
    COUNT(s.stud_id) AS N'Количество студентов'
FROM Directions d
LEFT JOIN Groups g 
       ON g.direction = d.direction_id
LEFT JOIN Students s
       ON s.[group] = g.group_id
GROUP BY d.direction_name
ORDER BY COUNT(DISTINCT g.group_id) ASC;

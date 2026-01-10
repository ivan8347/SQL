--SQLQuery3-SELECT Groups AND Students.sql
USE SPU_411_Import;

SELECT
		  d.direction_name			        AS	N'Направление обучения',
		  COUNT(DISTINCT g.group_id)		AS	N'Количество групп',   --COUNT(group_name)	AS	N'Количество групп',
			COUNT(DISTINCT g.gpoup_name) AS N'Назыание группы',
		  (SELECT COUNT (*) 
		  FROM Students s
		  WHERE s.[group] = g.group_id
		  )
		  AS  N'Количество студентов' --COUNT(stud_id) AS  N'Количество студентов' COUNT(DISTINCT stud_id)	

FROM     Directions d ,  Groups g   --Students,
WHERE     g.direction = d.direction_id
GROUP BY  d.direction_name,g.group_id,g.group_name
--ORDER BY COUNT(DISTINCT g.group_id) ASC; --COUNT(group_name)
ORDER BY d.direction_name, g.group_name;

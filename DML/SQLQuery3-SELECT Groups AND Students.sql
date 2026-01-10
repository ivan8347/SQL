--SQLQuery3-SELECT Groups AND Students.sql
USE SPU_411_Import;

SELECT
		  d.direction_name			        AS	N'Направление обучения',
		  --g.group_name					    AS  N'Назыание группы',
		  COUNT(DISTINCT g.group_id)		AS	N'Количество групп',   
		  (SELECT COUNT (*) 
		  FROM Students s
		  WHERE s.[group] = g.group_id )
		  AS  N'Количество студентов' 

FROM     Directions d ,  Groups g  
WHERE     g.direction = d.direction_id
GROUP BY  d.direction_name,g.group_id,g.group_name
ORDER BY d.direction_name, g.group_name;

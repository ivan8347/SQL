--SQLQuery3-SELECT Groups AND Students.sql
USE SPU_411_Import;

SELECT
		  direction_name			        AS	N'Направление обучения',
		  --g.group_name					    AS  N'Название группы',
		  COUNT(DISTINCT group_id)		AS	N'Количество групп',   
		  
		  (SELECT COUNT (DISTINCT stud_id) 
		  FROM Students 
		  WHERE [group] = group_id )
		  --WHERE [group] IN ( SELECT group_id FROM Groups  WHERE direction = direction_id))
		  AS  N'Количество студентов' 


FROM     Directions ,  Groups  , Students  
WHERE     direction = direction_id


GROUP BY  direction_name,direction_id,group_id,group_name
ORDER BY direction_name, group_name;
--ORDER BY COUNT(DISTINCT g.group_id) DESC;

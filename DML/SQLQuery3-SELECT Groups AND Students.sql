--SQLQuery3-SELECT Groups AND Students.sql
USE SPU_411_Import;

SELECT
		  direction_name			        AS	N'Направление обучения',
		  --COUNT(group_name)		        AS	N'Количество групп',
		  COUNT(DISTINCT group_name)		AS	N'Количество групп',
		  --COUNT(stud_id)			        AS  N'Количество студентов'
		  COUNT(DISTINCT stud_id)			AS  N'Количество студентов'
FROM      Students,Groups,Directions
WHERE     direction = direction_id
AND		  [group] = group_id 
--AND [group] IS NULL

--AND COUNT(group_name) < 5
GROUP BY  direction_name
HAVING  COUNT(group_name) < 5
ORDER BY N'Количество групп' ASC --COUNT(group_name)



;

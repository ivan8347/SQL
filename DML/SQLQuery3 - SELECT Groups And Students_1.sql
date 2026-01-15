--SQLQuery3 - SELECT Groups And Students_1.sql

USE SPU_411_Import;

SELECT
    d.direction_name AS N'Направление обучения',

    -- Сколько групп по этому направлению
    (SELECT COUNT(*)
     FROM Groups g
     WHERE g.direction = d.direction_id) 
        AS N'Количество групп',

    -- Сколько студентов во всех группах этого направления
    (SELECT COUNT(*)
     FROM Students s
     WHERE s.[group] IN (
            SELECT g2.group_id
            FROM Groups g2
            WHERE g2.direction = d.direction_id
     ))
        AS N'Количество студентов'

FROM Directions d
ORDER BY d.direction_name;

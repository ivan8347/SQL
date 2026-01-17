--SQLQuery3 - SELECT Groups And Students_1.sql

USE SPU_411_Import;

SELECT
    direction_name AS N'Направление обучения',

    -- Сколько групп по этому направлению
    (SELECT COUNT(*)
     FROM Groups g
     WHERE direction = direction_id) 
        AS N'Количество групп',

    -- Сколько студентов во всех группах этого направления
    (SELECT COUNT(*)
     FROM Students 
     WHERE [group] IN (
            SELECT group_id
            FROM Groups 
            WHERE direction = direction_id
     ))
        AS N'Количество студентов'

FROM Directions 
ORDER BY direction_name;

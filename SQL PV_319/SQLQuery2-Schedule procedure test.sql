--SQLQuery2-Schedule procedure test.sql
USE SPU_411_Import;
GO
EXEC sp_ScheduleForGroup N'PV_319',N'UML%',N'Ковтун',N'2024-06-01',N'18:30';
EXEC sp_ScheduleForGroup N'PV_319',N'Разработка%C#',N'Ковтун',N'2024-06-22',N'18:30';
EXEC sp_ScheduleForGroup N'PV_319',N'Язык%C#',N'Ковтун',N'2024-07-13',N'18:30';
EXEC sp_ScheduleForGroup N'PV_319',N'Разработка%C++',N'Ковтун',N'2024-08-20',N'18:30';
EXEC sp_ScheduleForGroup N'PV_319',N'%MS SQL Server',N'Ковтун',N'2024-09-10',N'18:30';
EXEC sp_ScheduleForGroup N'PV_319',N'Технология%',N'Ковтун',N'2024-10-08',N'18:30';
EXEC sp_ScheduleForGroup N'PV_319',N'Системное %',N'Ковтун',N'2024-11-05',N'18:30';
EXEC sp_ScheduleForGroup N'PV_319',N'Сетевое %',N'Ковтун',N'2024-12-03',N'18:30';
EXEC sp_PrintScheduleForGroup N'PV_319';
--SELECT * FROM Schedule;


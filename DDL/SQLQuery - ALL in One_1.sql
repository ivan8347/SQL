

CREATE TABLE [dbo].[AttendanceAndGrades](
	[student] [int] NOT NULL,
	[lesson] [bigint] NOT NULL,
	[present] [bit] NOT NULL,
	[grade_1] [tinyint] NULL,
	[grade_2] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[student] ASC,
	[lesson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DependentDisciplines]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DependentDisciplines](
	[discipline] [smallint] NOT NULL,
	[dependent_discipline] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discipline] ASC,
	[dependent_discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directions]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directions](
	[direction_id] [tinyint] NOT NULL,
	[direction_name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[direction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disciplines]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disciplines](
	[discipline_id] [smallint] NOT NULL,
	[discipline_name] [nvarchar](256) NOT NULL,
	[number_of_lessons] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discipline_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DisciplinesDirectionsRelation]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisciplinesDirectionsRelation](
	[discipline] [smallint] NOT NULL,
	[direction] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discipline] ASC,
	[direction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[student] [int] NOT NULL,
	[discipline] [smallint] NOT NULL,
	[grade] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[student] ASC,
	[discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[group_id] [int] NOT NULL,
	[group_name] [nvarchar](24) NOT NULL,
	[direction] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequiredDisciplines]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequiredDisciplines](
	[discipline] [smallint] NOT NULL,
	[required_discipline] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discipline] ASC,
	[required_discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[lesson_id] [bigint] NOT NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[group] [int] NOT NULL,
	[discipline] [smallint] NOT NULL,
	[teacher] [int] NOT NULL,
	[spent] [bit] NOT NULL,
	[subject] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[lesson_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_id] [int] NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[midl_name] [nvarchar](50) NULL,
	[birth_date] [date] NOT NULL,
	[group] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[teacher_id] [int] NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[midl_name] [nvarchar](50) NULL,
	[birth_date] [date] NOT NULL,
	[rate] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersDisciplinesRelation]    Script Date: 06.01.2026 20:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersDisciplinesRelation](
	[teacher] [int] NOT NULL,
	[discipline] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[teacher] ASC,
	[discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceAndGrades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Schedule] FOREIGN KEY([lesson])
REFERENCES [dbo].[Schedule] ([lesson_id])
GO
ALTER TABLE [dbo].[AttendanceAndGrades] CHECK CONSTRAINT [FK_Grades_Schedule]
GO
ALTER TABLE [dbo].[AttendanceAndGrades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Students] FOREIGN KEY([student])
REFERENCES [dbo].[Students] ([student_id])
GO
ALTER TABLE [dbo].[AttendanceAndGrades] CHECK CONSTRAINT [FK_Grades_Students]
GO
ALTER TABLE [dbo].[DependentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_DD_Dependent] FOREIGN KEY([dependent_discipline])
REFERENCES [dbo].[Disciplines] ([discipline_id])
GO
ALTER TABLE [dbo].[DependentDisciplines] CHECK CONSTRAINT [FK_DD_Dependent]
GO
ALTER TABLE [dbo].[DependentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_DD_Discipline] FOREIGN KEY([discipline])
REFERENCES [dbo].[Disciplines] ([discipline_id])
GO
ALTER TABLE [dbo].[DependentDisciplines] CHECK CONSTRAINT [FK_DD_Discipline]
GO
ALTER TABLE [dbo].[DisciplinesDirectionsRelation]  WITH CHECK ADD  CONSTRAINT [FK_DDR_Direction] FOREIGN KEY([direction])
REFERENCES [dbo].[Directions] ([direction_id])
GO
ALTER TABLE [dbo].[DisciplinesDirectionsRelation] CHECK CONSTRAINT [FK_DDR_Direction]
GO
ALTER TABLE [dbo].[DisciplinesDirectionsRelation]  WITH CHECK ADD  CONSTRAINT [FK_DDR_Discipline] FOREIGN KEY([discipline])
REFERENCES [dbo].[Disciplines] ([discipline_id])
GO
ALTER TABLE [dbo].[DisciplinesDirectionsRelation] CHECK CONSTRAINT [FK_DDR_Discipline]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Disciplines] FOREIGN KEY([discipline])
REFERENCES [dbo].[Disciplines] ([discipline_id])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Disciplines]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Students] FOREIGN KEY([student])
REFERENCES [dbo].[Students] ([student_id])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Students]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Directions] FOREIGN KEY([direction])
REFERENCES [dbo].[Directions] ([direction_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Directions]
GO
ALTER TABLE [dbo].[RequiredDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_RD_Discipline] FOREIGN KEY([discipline])
REFERENCES [dbo].[Disciplines] ([discipline_id])
GO
ALTER TABLE [dbo].[RequiredDisciplines] CHECK CONSTRAINT [FK_RD_Discipline]
GO
ALTER TABLE [dbo].[RequiredDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_RD_Required] FOREIGN KEY([required_discipline])
REFERENCES [dbo].[Disciplines] ([discipline_id])
GO
ALTER TABLE [dbo].[RequiredDisciplines] CHECK CONSTRAINT [FK_RD_Required]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Discipline] FOREIGN KEY([discipline])
REFERENCES [dbo].[Disciplines] ([discipline_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Discipline]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Groups] FOREIGN KEY([group])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Groups]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Teacher] FOREIGN KEY([teacher])
REFERENCES [dbo].[Teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Teacher]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups] FOREIGN KEY([group])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Groups]
GO
ALTER TABLE [dbo].[TeachersDisciplinesRelation]  WITH CHECK ADD  CONSTRAINT [FK_TDR_Discipline] FOREIGN KEY([discipline])
REFERENCES [dbo].[Disciplines] ([discipline_id])
GO
ALTER TABLE [dbo].[TeachersDisciplinesRelation] CHECK CONSTRAINT [FK_TDR_Discipline]
GO
ALTER TABLE [dbo].[TeachersDisciplinesRelation]  WITH CHECK ADD  CONSTRAINT [FK_TDR_Taecher] FOREIGN KEY([teacher])
REFERENCES [dbo].[Teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[TeachersDisciplinesRelation] CHECK CONSTRAINT [FK_TDR_Taecher]
GO
ALTER TABLE [dbo].[AttendanceAndGrades]  WITH CHECK ADD  CONSTRAINT [CK_Grade_1] CHECK  (([grade_1]>(0) AND [grade_1]<=(12)))
GO
ALTER TABLE [dbo].[AttendanceAndGrades] CHECK CONSTRAINT [CK_Grade_1]
GO
ALTER TABLE [dbo].[AttendanceAndGrades]  WITH CHECK ADD  CONSTRAINT [CK_Grade_2] CHECK  (([grade_2]>(0) AND [grade_2]<=(12)))
GO
ALTER TABLE [dbo].[AttendanceAndGrades] CHECK CONSTRAINT [CK_Grade_2]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [CK_Grade] CHECK  (([grade]>(0) AND [grade]<=(12)))
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [CK_Grade]
GO
USE [master]
GO
ALTER DATABASE [SPU_411_DDL] SET  READ_WRITE 
GO

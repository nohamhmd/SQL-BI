USE [ITI]
GO
/****** Object:  User [itistudent]    Script Date: 4/24/2024 12:23:25 AM ******/
CREATE USER [itistudent] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [new]    Script Date: 4/24/2024 12:23:25 AM ******/
CREATE SCHEMA [new]
GO
/****** Object:  Schema [newschema]    Script Date: 4/24/2024 12:23:25 AM ******/
CREATE SCHEMA [newschema]
GO
/****** Object:  Default [Defualt_Value]    Script Date: 4/24/2024 12:23:25 AM ******/
CREATE DEFAULT [dbo].[Defualt_Value] 
AS
'Not Applied'
GO
/****** Object:  UserDefinedDataType [dbo].[CityUDD]    Script Date: 4/24/2024 12:23:25 AM ******/
CREATE TYPE [dbo].[CityUDD] FROM [nvarchar](10) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Tel]    Script Date: 4/24/2024 12:23:25 AM ******/
CREATE TYPE [dbo].[Tel] FROM [nvarchar](11) NOT NULL
GO
/****** Object:  Table [newschema].[Student]    Script Date: 4/24/2024 12:23:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [newschema].[Student](
	[St_Id] [int] NOT NULL,
	[St_Fname] [nvarchar](50) NULL,
	[St_Lname] [nchar](10) NULL,
	[St_Address] [nvarchar](100) NULL,
	[St_Age] [int] NULL,
	[Dept_Id] [int] NULL,
	[St_super] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[St_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stud_Course]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stud_Course](
	[Crs_Id] [int] NOT NULL,
	[St_Id] [int] NOT NULL,
	[grade] [int] NULL,
 CONSTRAINT [PK_Stud_Course] PRIMARY KEY CLUSTERED 
(
	[Crs_Id] ASC,
	[St_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Display_Students_Whose_Grade_Above_50]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Display_Students_Whose_Grade_Above_50]
AS
SELECT [St_Fname] + ' ' + [St_Lname] AS FullName
FROM [newschema].[Student]
JOIN [dbo].[Stud_Course]
ON [newschema].[Student].St_Id = [dbo].[Stud_Course].St_Id
WHERE [dbo].[Stud_Course].[grade] > 50
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Ins_Id] [int] NOT NULL,
	[Ins_Name] [nvarchar](50) NULL,
	[Ins_Degree] [nvarchar](50) NULL,
	[Dept_Id] [int] NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Ins_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_Id] [int] NOT NULL,
	[Dept_Name] [nvarchar](50) NULL,
	[Dept_Desc] [nvarchar](100) NULL,
	[Dept_Location] [nvarchar](50) NULL,
	[Dept_Manager] [int] NULL,
	[Hiredate] [date] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Dept_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_SD_Or_Java_Instructors]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SD_Or_Java_Instructors]
AS
SELECT [Ins_Name] FROM [dbo].[Instructor]
JOIN [dbo].[Department]
ON  [dbo].[Instructor].Dept_Id = [dbo].[Department].Dept_Id
WHERE [dbo].[Department].Dept_Name IN ('SD','Java')
GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Crs_Id] [int] NOT NULL,
	[Crs_Name] [nvarchar](50) NULL,
	[Crs_Duration] [int] NULL,
	[Ins_Id] [int] NULL,
	[Top_Id] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Crs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Instructors_And_NumOfCourses_They_Teach]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Instructors_And_NumOfCourses_They_Teach]
AS
SELECT [Ins_Name] AS [Instructor Name], COUNT([Crs_Id]) AS NumberOfCourses
FROM [dbo].[Instructor]
JOIN [dbo].[Course]
ON [dbo].[Course].Ins_Id = [dbo].[Instructor].Ins_Id
GROUP BY [Ins_Name]
GO
/****** Object:  View [dbo].[V1]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V1]
AS
SELECT [St_Fname], [St_Lname],[St_Age],[St_Address],
(SELECT [Dept_Name] FROM [dbo].[Department] WHERE [dbo].[Department].Dept_Id = [newschema].[Student].Dept_Id) AS [Department Name],
[St_super]
FROM [newschema].[Student]
WHERE [St_Address] IN('Cairo', 'Alex')
WITH CHECK OPTION;
GO
/****** Object:  Table [dbo].[StudentAudit]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAudit](
	[Server_username] [nvarchar](50) NULL,
	[date] [date] NULL,
	[note] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Top_Id] [int] NOT NULL,
	[Top_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Top_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructor] FOREIGN KEY([Ins_Id])
REFERENCES [dbo].[Instructor] ([Ins_Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Instructor]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Topic] FOREIGN KEY([Top_Id])
REFERENCES [dbo].[Topic] ([Top_Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Topic]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Instructor] FOREIGN KEY([Dept_Manager])
REFERENCES [dbo].[Instructor] ([Ins_Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Instructor]
GO
ALTER TABLE [dbo].[Stud_Course]  WITH CHECK ADD  CONSTRAINT [FK_Stud_Course_Course] FOREIGN KEY([Crs_Id])
REFERENCES [dbo].[Course] ([Crs_Id])
GO
ALTER TABLE [dbo].[Stud_Course] CHECK CONSTRAINT [FK_Stud_Course_Course]
GO
ALTER TABLE [dbo].[Stud_Course]  WITH CHECK ADD  CONSTRAINT [FK_Stud_Course_Student] FOREIGN KEY([St_Id])
REFERENCES [newschema].[Student] ([St_Id])
GO
ALTER TABLE [dbo].[Stud_Course] CHECK CONSTRAINT [FK_Stud_Course_Student]
GO
ALTER TABLE [newschema].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department] ([Dept_Id])
GO
ALTER TABLE [newschema].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [newschema].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Student] FOREIGN KEY([St_super])
REFERENCES [newschema].[Student] ([St_Id])
GO
ALTER TABLE [newschema].[Student] CHECK CONSTRAINT [FK_Student_Student]
GO
/****** Object:  StoredProcedure [dbo].[GetCourses]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCourses]
AS
BEGIN
	SELECT [Crs_Id], [Crs_Name], [Crs_Duration],
		   (SELECT [Ins_Name] FROM [dbo].[Instructor] WHERE [Ins_Id] = Course.Ins_Id) AS Instructor_Name,	
		   (SELECT  [Top_Name] FROM [dbo].[Topic] WHERE [Top_Id] = Course.Top_Id) AS Topic_Name
	FROM [dbo].[Course]	   
END
GO
/****** Object:  StoredProcedure [dbo].[GetStudents]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudents]
@age1 INT,
@age2 INT
AS
BEGIN
	SELECT [St_Fname],[St_Lname],[St_Address],
	(SELECT [Dept_Name] FROM [dbo].[Department] WHERE [dbo].[Department].[Dept_Id]=[newschema].[Student].Dept_Id) AS [Department]
	FROM newschema.Student
	WHERE [St_Age] BETWEEN @age1 AND @age2
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TotalStudentsPerDepartment]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TotalStudentsPerDepartment]
AS
	BEGIN 
		SELECT COUNT(St_Id) [Number Of Students],[dbo].[Department].Dept_Name [Department Name] 
		FROM newschema.Student  , Department 
		WHERE [newschema].[Student].Dept_Id = [dbo].[Department].Dept_Id
		GROUP BY Dept_Name
END
GO
/****** Object:  Trigger [dbo].[PreventAddingNewDepartments]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[PreventAddingNewDepartments]
ON [dbo].[Department]
INSTEAD OF INSERT
AS
BEGIN
	RAISERROR('You cannot add new departments',16,1)
END
GO
ALTER TABLE [dbo].[Department] ENABLE TRIGGER [PreventAddingNewDepartments]
GO
/****** Object:  Trigger [newschema].[tr_AfterAddingStrudents]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [newschema].[tr_AfterAddingStrudents]
ON [newschema].[Student]
AFTER INSERT
AS
BEGIN
	DECLARE @ID INT
	SELECT @ID = [St_Id] FROM INSERTED 
	INSERT INTO [dbo].[StudentAudit]
	VALUES(
		(SELECT SYSTEM_USER),
		(GETDATE()),
		('User name : ' + (SELECT SYSTEM_USER)+ ' '+ 'added a new student with id: '+ 
		CAST(@ID AS NCHAR(5))))
END
GO
ALTER TABLE [newschema].[Student] ENABLE TRIGGER [tr_AfterAddingStrudents]
GO
/****** Object:  Trigger [newschema].[tr_InsteadOfDeletingStrudents]    Script Date: 4/24/2024 12:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [newschema].[tr_InsteadOfDeletingStrudents]
ON [newschema].[Student]
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @ID INT
	SELECT @ID = [St_Id] FROM DELETED 
	INSERT INTO [dbo].[StudentAudit]
	VALUES(
		(SELECT SYSTEM_USER),
		(GETDATE()),
		('User name : ' + (SELECT SYSTEM_USER)+ ' '+ 'tried to delete a student with id: '+ 
		CAST(@ID AS NCHAR(5))))
END
GO
ALTER TABLE [newschema].[Student] ENABLE TRIGGER [tr_InsteadOfDeletingStrudents]
GO

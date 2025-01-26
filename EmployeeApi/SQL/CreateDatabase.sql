USE [PersonnelSystem]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 27/01/2025 4:42:23 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27/01/2025 4:42:23 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DesignationID] [int] NOT NULL,
	[ManagerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Designation] ON 
GO
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (1, N'Director', N'Responsible for overseeing team operations')
GO
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (2, N'IT Support', N'Responsible for technical tasks and problem-solving')
GO
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (3, N'Accounting', N'Manages financial records and transactions')
GO
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (4, N'IT Analyst', N'Handles analysis')
GO
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (5, N'IT SALES', N'Handles sales')
GO
SET IDENTITY_INSERT [dbo].[Designation] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (1, N'Jeffrey', N'Wells', 1, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (2, N'Victor', N'Atkins', 1, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (3, N'Kelli', N'Hamilton', 1, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (4, N'Adam', N'Braun', 2, 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (5, N'Brian', N'Cruz', 3, 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (6, N'Kristen', N'Floyd', 5, 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (7, N'Lois', N'Martinez', 2, 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (8, N'Michael', N'Lind', 4, 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (9, N'Eric', N'Bay', 5, 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (10, N'Bradon', N'Young', 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO

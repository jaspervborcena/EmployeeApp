USE [PersonnelSystem]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 27/01/2025 12:07:32 am ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 27/01/2025 12:07:32 am ******/
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
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (1, N'Manager', N'Responsible for overseeing team operations')
GO
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (2, N'Engineer', N'Responsible for technical tasks and problem-solving')
GO
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (3, N'Accountant', N'Manages financial records and transactions')
GO
INSERT [dbo].[Designation] ([DesignationID], [Title], [Description]) VALUES (4, N'HR Specialist', N'Handles recruitment and employee relations')
GO
SET IDENTITY_INSERT [dbo].[Designation] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (1, N'John', N'Smith', 1, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (2, N'Jane', N'Doe', 2, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (3, N'Michael', N'Brown', 2, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (4, N'Emily', N'Wilson', 1, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DesignationID], [ManagerID]) VALUES (5, N'Robert', N'White', 3, 4)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([DesignationID])
REFERENCES [dbo].[Designation] ([DesignationID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

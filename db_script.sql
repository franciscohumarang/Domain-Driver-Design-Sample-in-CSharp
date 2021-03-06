USE [EmployeeTask]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 11 Nov 2020 11:18:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[clients](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[employees]    Script Date: 11 Nov 2020 11:18:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[projects]    Script Date: 11 Nov 2020 11:18:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[projects]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[projects](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_projects] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[task_types]    Script Date: 11 Nov 2020 11:18:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[task_types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[task_types](
	[task_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_task_types] PRIMARY KEY CLUSTERED 
(
	[task_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 11 Nov 2020 11:18:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tasks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tasks](
	[task_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[name] [nvarchar](300) NOT NULL,
	[descrption] [nvarchar](1000) NULL,
	[project_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[logged_date] [date] NOT NULL,
	[task_type_id] [int] NOT NULL,
	[is_billable] [bit] NULL,
 CONSTRAINT [PK_tasks] PRIMARY KEY CLUSTERED 
(
	[task_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[clients] ON 

INSERT [dbo].[clients] ([client_id], [name]) VALUES (1, N'CLIENT 1')
INSERT [dbo].[clients] ([client_id], [name]) VALUES (2, N'CLIENT 2')
INSERT [dbo].[clients] ([client_id], [name]) VALUES (3, N'CLIENT 3')
SET IDENTITY_INSERT [dbo].[clients] OFF
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([employee_id], [name], [email], [password]) VALUES (1, N'Francisco Humarang', N'fmhumarang@gmail.com', N'Ere234!32x,er')
SET IDENTITY_INSERT [dbo].[employees] OFF
SET IDENTITY_INSERT [dbo].[projects] ON 

INSERT [dbo].[projects] ([project_id], [name]) VALUES (1, N'Project 1')
INSERT [dbo].[projects] ([project_id], [name]) VALUES (2, N'Project 2')
INSERT [dbo].[projects] ([project_id], [name]) VALUES (3, N'Project 3')
INSERT [dbo].[projects] ([project_id], [name]) VALUES (4, N'Project 4')
SET IDENTITY_INSERT [dbo].[projects] OFF
SET IDENTITY_INSERT [dbo].[task_types] ON 

INSERT [dbo].[task_types] ([task_type_id], [name]) VALUES (1, N'Training')
INSERT [dbo].[task_types] ([task_type_id], [name]) VALUES (2, N'Development')
INSERT [dbo].[task_types] ([task_type_id], [name]) VALUES (3, N'[Admin]Meeting')
SET IDENTITY_INSERT [dbo].[task_types] OFF
SET IDENTITY_INSERT [dbo].[tasks] ON 

INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (1, 1, N'Dev', NULL, 1, 1, CAST(N'2020-11-10 12:54:33.747' AS DateTime), CAST(N'2020-11-10 15:54:33.747' AS DateTime), CAST(N'2020-11-10' AS Date), 1, 1)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (2, 1, N'API Development', N'', 1, 1, CAST(N'2020-10-30 09:00:00.000' AS DateTime), CAST(N'2020-10-30 14:00:00.000' AS DateTime), CAST(N'2020-10-30' AS Date), 1, 1)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (3, 1, N'Testing API Endpoint', N'', 1, 1, CAST(N'2020-10-30 14:30:00.000' AS DateTime), CAST(N'2020-10-30 18:00:00.000' AS DateTime), CAST(N'2020-10-30' AS Date), 1, 1)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (4, 1, N'Development', N'', 2, 1, CAST(N'2020-11-01 09:10:00.000' AS DateTime), CAST(N'2020-11-01 16:00:00.000' AS DateTime), CAST(N'2020-11-01' AS Date), 1, 1)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (5, 1, N'Admin Support', N'', 3, 1, CAST(N'2020-11-02 07:10:00.000' AS DateTime), CAST(N'2020-11-02 18:00:00.000' AS DateTime), CAST(N'2020-11-02' AS Date), 2, 0)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (6, 1, N'Development', N'', 2, 1, CAST(N'2020-11-03 09:10:00.000' AS DateTime), CAST(N'2020-11-03 16:00:00.000' AS DateTime), CAST(N'2020-11-03' AS Date), 1, 1)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (7, 1, N'Admin Support', N'', 3, 1, CAST(N'2020-11-04 07:10:00.000' AS DateTime), CAST(N'2020-11-04 18:00:00.000' AS DateTime), CAST(N'2020-11-04' AS Date), 2, 0)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (8, 1, N'Admin Support', N'', 3, 1, CAST(N'2020-11-05 07:10:00.000' AS DateTime), CAST(N'2020-11-05 18:00:00.000' AS DateTime), CAST(N'2020-11-05' AS Date), 2, 0)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (11, 1, N'Development', N'', 2, 1, CAST(N'2020-11-08 09:10:00.000' AS DateTime), CAST(N'2020-11-08 16:00:00.000' AS DateTime), CAST(N'2020-11-08' AS Date), 1, 1)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (12, 1, N'Admin Support', N'', 3, 1, CAST(N'2020-11-09 07:10:00.000' AS DateTime), CAST(N'2020-11-09 18:00:00.000' AS DateTime), CAST(N'2020-11-09' AS Date), 2, 0)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (13, 1, N'Development', N'', 2, 1, CAST(N'2020-11-10 09:10:00.000' AS DateTime), CAST(N'2020-11-10 16:00:00.000' AS DateTime), CAST(N'2020-11-10' AS Date), 1, 1)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (14, 1, N'Admin Support', N'', 3, 1, CAST(N'2020-11-11 07:10:00.000' AS DateTime), CAST(N'2020-11-11 18:00:00.000' AS DateTime), CAST(N'2020-11-11' AS Date), 2, 0)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (17, 1, N'API Development', N'', 1, 1, CAST(N'2020-11-07 09:00:00.000' AS DateTime), CAST(N'2020-11-07 14:00:00.000' AS DateTime), CAST(N'2020-11-07' AS Date), 1, 1)
INSERT [dbo].[tasks] ([task_id], [employee_id], [name], [descrption], [project_id], [client_id], [start_time], [end_time], [logged_date], [task_type_id], [is_billable]) VALUES (18, 1, N'Testing API Endpoint', N'', 1, 1, CAST(N'2020-11-07 14:30:00.000' AS DateTime), CAST(N'2020-11-07 18:00:00.000' AS DateTime), CAST(N'2020-11-07' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[tasks] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tasks_clients]') AND parent_object_id = OBJECT_ID(N'[dbo].[tasks]'))
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_tasks_clients] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([client_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tasks_clients]') AND parent_object_id = OBJECT_ID(N'[dbo].[tasks]'))
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_tasks_clients]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tasks_employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[tasks]'))
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_tasks_employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tasks_employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[tasks]'))
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_tasks_employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tasks_projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[tasks]'))
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_tasks_projects] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([project_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tasks_projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[tasks]'))
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_tasks_projects]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tasks_task_types]') AND parent_object_id = OBJECT_ID(N'[dbo].[tasks]'))
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_tasks_task_types] FOREIGN KEY([task_type_id])
REFERENCES [dbo].[task_types] ([task_type_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tasks_task_types]') AND parent_object_id = OBJECT_ID(N'[dbo].[tasks]'))
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_tasks_task_types]
GO

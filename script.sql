USE [master]
GO
/****** Object:  Database [TimesheetManagement]    Script Date: 8/23/2022 1:29:23 AM ******/
CREATE DATABASE [TimesheetManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimesheetManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DATNGUYEN\MSSQL\DATA\TimesheetManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimesheetManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DATNGUYEN\MSSQL\DATA\TimesheetManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TimesheetManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimesheetManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimesheetManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimesheetManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimesheetManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimesheetManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimesheetManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimesheetManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimesheetManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimesheetManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimesheetManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimesheetManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimesheetManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimesheetManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimesheetManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimesheetManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimesheetManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimesheetManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimesheetManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimesheetManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimesheetManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimesheetManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimesheetManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimesheetManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimesheetManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [TimesheetManagement] SET  MULTI_USER 
GO
ALTER DATABASE [TimesheetManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimesheetManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimesheetManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimesheetManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimesheetManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimesheetManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimesheetManagement', N'ON'
GO
ALTER DATABASE [TimesheetManagement] SET QUERY_STORE = OFF
GO
USE [TimesheetManagement]
GO
/****** Object:  Table [dbo].[Absence]    Script Date: 8/23/2022 1:29:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absence](
	[aid] [int] NOT NULL,
	[eid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[sid] [int] NOT NULL,
	[reason] [varchar](150) NULL,
 CONSTRAINT [PK_Absence] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Allowance]    Script Date: 8/23/2022 1:29:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allowance](
	[alid] [int] NOT NULL,
	[eid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[bonus] [float] NULL,
 CONSTRAINT [PK_Allowance] PRIMARY KEY CLUSTERED 
(
	[alid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/23/2022 1:29:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[eid] [int] NOT NULL,
	[ename] [varchar](150) NOT NULL,
	[pid] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gross]    Script Date: 8/23/2022 1:29:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gross](
	[gid] [int] NOT NULL,
	[from] [date] NOT NULL,
	[to] [date] NOT NULL,
	[gross] [float] NOT NULL,
 CONSTRAINT [PK_Gross] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Overtime]    Script Date: 8/23/2022 1:29:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Overtime](
	[otid] [int] NOT NULL,
	[eid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[sid] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Overtime] PRIMARY KEY CLUSTERED 
(
	[otid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 8/23/2022 1:29:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[pid] [int] NOT NULL,
	[pname] [varchar](150) NOT NULL,
	[salaryPerHour] [float] NOT NULL,
	[grossPercentage] [float] NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 8/23/2022 1:29:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[sid] [int] NOT NULL,
	[from] [time](2) NOT NULL,
	[to] [time](2) NOT NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 8/23/2022 1:29:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NOT NULL,
	[checkin] [datetime] NULL,
	[checkout] [datetime] NULL,
	[sid] [int] NOT NULL,
	[aid] [int] NULL,
 CONSTRAINT [PK_Timesheet] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (1, 4, CAST(N'2022-08-08' AS Date), 1, N'P')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (2, 4, CAST(N'2022-08-27' AS Date), 1, N'P')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (3, 5, CAST(N'2022-08-06' AS Date), 1, N'WE')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (4, 5, CAST(N'2022-08-07' AS Date), 1, N'WE')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (5, 5, CAST(N'2022-08-13' AS Date), 1, N'WE')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (6, 5, CAST(N'2022-08-14' AS Date), 1, N'WE')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (7, 5, CAST(N'2022-08-20' AS Date), 1, N'WE')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (8, 5, CAST(N'2022-08-21' AS Date), 1, N'WE')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (9, 5, CAST(N'2022-08-27' AS Date), 1, N'WE')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (10, 5, CAST(N'2022-08-28' AS Date), 1, N'WE')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (11, 6, CAST(N'2022-08-24' AS Date), 3, N'P')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (12, 4, CAST(N'2022-08-21' AS Date), 1, N'NP')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (13, 6, CAST(N'2022-08-06' AS Date), 3, N'NP')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (14, 6, CAST(N'2022-08-07' AS Date), 3, N'NP')
INSERT [dbo].[Absence] ([aid], [eid], [date], [sid], [reason]) VALUES (15, 6, CAST(N'2022-08-30' AS Date), 3, N'NP')
GO
INSERT [dbo].[Allowance] ([alid], [eid], [gid], [bonus]) VALUES (1, 1, 1, 700000)
INSERT [dbo].[Allowance] ([alid], [eid], [gid], [bonus]) VALUES (2, 2, 1, 700000)
INSERT [dbo].[Allowance] ([alid], [eid], [gid], [bonus]) VALUES (3, 3, 1, 1500000)
INSERT [dbo].[Allowance] ([alid], [eid], [gid], [bonus]) VALUES (4, 4, 1, 150000)
INSERT [dbo].[Allowance] ([alid], [eid], [gid], [bonus]) VALUES (5, 5, 1, 2000000)
INSERT [dbo].[Allowance] ([alid], [eid], [gid], [bonus]) VALUES (6, 6, 1, 0)
GO
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (1, N'mr A', 2)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (2, N'mr B', 2)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (3, N'mr C', 1)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (4, N'mr D', 2)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (5, N'mr E', 1)
INSERT [dbo].[Employee] ([eid], [ename], [pid]) VALUES (6, N'mr F', 2)
GO
INSERT [dbo].[Gross] ([gid], [from], [to], [gross]) VALUES (1, CAST(N'2022-08-01' AS Date), CAST(N'2022-08-31' AS Date), 300000000)
INSERT [dbo].[Gross] ([gid], [from], [to], [gross]) VALUES (2, CAST(N'2022-09-01' AS Date), CAST(N'2022-09-30' AS Date), 298012399)
GO
INSERT [dbo].[Overtime] ([otid], [eid], [date], [sid], [status]) VALUES (1, 4, CAST(N'2022-08-04' AS Date), 2, 1)
INSERT [dbo].[Overtime] ([otid], [eid], [date], [sid], [status]) VALUES (2, 6, CAST(N'2022-08-10' AS Date), 2, 1)
INSERT [dbo].[Overtime] ([otid], [eid], [date], [sid], [status]) VALUES (3, 6, CAST(N'2022-08-11' AS Date), 2, 0)
INSERT [dbo].[Overtime] ([otid], [eid], [date], [sid], [status]) VALUES (4, 4, CAST(N'2022-08-30' AS Date), 2, 1)
INSERT [dbo].[Overtime] ([otid], [eid], [date], [sid], [status]) VALUES (5, 1, CAST(N'2022-08-28' AS Date), 2, 1)
INSERT [dbo].[Overtime] ([otid], [eid], [date], [sid], [status]) VALUES (6, 1, CAST(N'2022-08-28' AS Date), 3, 1)
INSERT [dbo].[Overtime] ([otid], [eid], [date], [sid], [status]) VALUES (7, 2, CAST(N'2022-08-31' AS Date), 1, 0)
GO
INSERT [dbo].[Position] ([pid], [pname], [salaryPerHour], [grossPercentage]) VALUES (1, N'QL', 22000, 0.015)
INSERT [dbo].[Position] ([pid], [pname], [salaryPerHour], [grossPercentage]) VALUES (2, N'NV', 17000, 0.0035)
GO
INSERT [dbo].[Shift] ([sid], [from], [to]) VALUES (1, CAST(N'08:30:00' AS Time), CAST(N'12:30:00' AS Time))
INSERT [dbo].[Shift] ([sid], [from], [to]) VALUES (2, CAST(N'12:30:00' AS Time), CAST(N'17:30:00' AS Time))
INSERT [dbo].[Shift] ([sid], [from], [to]) VALUES (3, CAST(N'17:30:00' AS Time), CAST(N'22:30:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Timesheet] ON 

INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (1, 1, CAST(N'2022-08-01T08:30:00.000' AS DateTime), CAST(N'2022-08-01T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (2, 1, CAST(N'2022-08-02T08:30:00.000' AS DateTime), CAST(N'2022-08-02T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (3, 1, CAST(N'2022-08-03T08:30:00.000' AS DateTime), CAST(N'2022-08-03T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (4, 1, CAST(N'2022-08-04T08:30:00.000' AS DateTime), CAST(N'2022-08-04T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (6, 1, CAST(N'2022-08-05T08:30:00.000' AS DateTime), CAST(N'2022-08-05T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (7, 1, CAST(N'2022-08-06T08:30:00.000' AS DateTime), CAST(N'2022-08-06T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (8, 1, CAST(N'2022-08-07T08:30:00.000' AS DateTime), CAST(N'2022-08-07T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (9, 1, CAST(N'2022-08-08T08:30:00.000' AS DateTime), CAST(N'2022-08-08T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (10, 1, CAST(N'2022-08-09T08:30:00.000' AS DateTime), CAST(N'2022-08-09T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (12, 1, CAST(N'2022-08-10T08:30:00.000' AS DateTime), CAST(N'2022-08-10T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (13, 1, CAST(N'2022-08-11T08:30:00.000' AS DateTime), CAST(N'2022-08-11T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (14, 1, CAST(N'2022-08-12T08:30:00.000' AS DateTime), CAST(N'2022-08-12T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (15, 1, CAST(N'2022-08-13T08:30:00.000' AS DateTime), CAST(N'2022-08-13T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (16, 1, CAST(N'2022-08-14T08:30:00.000' AS DateTime), CAST(N'2022-08-14T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (17, 1, CAST(N'2022-08-15T08:30:00.000' AS DateTime), CAST(N'2022-08-15T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (18, 1, CAST(N'2022-08-16T08:30:00.000' AS DateTime), CAST(N'2022-08-16T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (19, 1, CAST(N'2022-08-17T08:30:00.000' AS DateTime), CAST(N'2022-08-17T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (20, 1, CAST(N'2022-08-18T08:30:00.000' AS DateTime), CAST(N'2022-08-18T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (21, 1, CAST(N'2022-08-19T08:30:00.000' AS DateTime), CAST(N'2022-08-19T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (22, 1, CAST(N'2022-08-20T08:30:00.000' AS DateTime), CAST(N'2022-08-20T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (23, 1, CAST(N'2022-08-21T08:30:00.000' AS DateTime), CAST(N'2022-08-21T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (24, 1, CAST(N'2022-08-22T08:30:00.000' AS DateTime), CAST(N'2022-08-22T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (25, 1, CAST(N'2022-08-23T08:30:00.000' AS DateTime), CAST(N'2022-08-23T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (26, 1, CAST(N'2022-08-24T08:30:00.000' AS DateTime), CAST(N'2022-08-24T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (27, 1, CAST(N'2022-08-25T08:30:00.000' AS DateTime), CAST(N'2022-08-25T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (28, 1, CAST(N'2022-08-26T08:30:00.000' AS DateTime), CAST(N'2022-08-26T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (29, 1, CAST(N'2022-08-27T08:30:00.000' AS DateTime), CAST(N'2022-08-27T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (30, 1, CAST(N'2022-08-28T08:30:00.000' AS DateTime), CAST(N'2022-08-28T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (31, 1, CAST(N'2022-08-29T08:30:00.000' AS DateTime), CAST(N'2022-08-29T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (32, 1, CAST(N'2022-08-30T08:30:00.000' AS DateTime), CAST(N'2022-08-30T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (33, 1, CAST(N'2022-08-31T08:30:00.000' AS DateTime), CAST(N'2022-08-31T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (34, 2, CAST(N'2022-08-01T12:30:00.000' AS DateTime), CAST(N'2022-08-01T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (35, 2, CAST(N'2022-08-02T12:30:00.000' AS DateTime), CAST(N'2022-08-02T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (36, 2, CAST(N'2022-08-03T12:30:00.000' AS DateTime), CAST(N'2022-08-03T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (37, 2, CAST(N'2022-08-04T12:30:00.000' AS DateTime), CAST(N'2022-08-04T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (38, 2, CAST(N'2022-08-05T12:30:00.000' AS DateTime), CAST(N'2022-08-05T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (39, 2, CAST(N'2022-08-06T12:30:00.000' AS DateTime), CAST(N'2022-08-06T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (40, 2, CAST(N'2022-08-07T12:30:00.000' AS DateTime), CAST(N'2022-08-07T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (41, 2, CAST(N'2022-08-08T12:30:00.000' AS DateTime), CAST(N'2022-08-08T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (42, 2, CAST(N'2022-08-09T12:30:00.000' AS DateTime), CAST(N'2022-08-09T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (43, 2, CAST(N'2022-08-10T12:30:00.000' AS DateTime), CAST(N'2022-08-10T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (44, 2, CAST(N'2022-08-11T12:30:00.000' AS DateTime), CAST(N'2022-08-11T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (45, 2, CAST(N'2022-08-12T12:30:00.000' AS DateTime), CAST(N'2022-08-12T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (46, 2, CAST(N'2022-08-13T12:30:00.000' AS DateTime), CAST(N'2022-08-13T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (47, 2, CAST(N'2022-08-14T12:30:00.000' AS DateTime), CAST(N'2022-08-14T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (48, 2, CAST(N'2022-08-15T12:30:00.000' AS DateTime), CAST(N'2022-08-15T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (49, 2, CAST(N'2022-08-16T12:30:00.000' AS DateTime), CAST(N'2022-08-16T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (50, 2, CAST(N'2022-08-17T12:30:00.000' AS DateTime), CAST(N'2022-08-17T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (51, 2, CAST(N'2022-08-18T12:30:00.000' AS DateTime), CAST(N'2022-08-18T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (52, 2, CAST(N'2022-08-19T12:30:00.000' AS DateTime), CAST(N'2022-08-19T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (53, 2, CAST(N'2022-08-20T12:30:00.000' AS DateTime), CAST(N'2022-08-20T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (54, 2, CAST(N'2022-08-21T12:30:00.000' AS DateTime), CAST(N'2022-08-21T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (55, 2, CAST(N'2022-08-22T12:30:00.000' AS DateTime), CAST(N'2022-08-22T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (56, 2, CAST(N'2022-08-23T12:30:00.000' AS DateTime), CAST(N'2022-08-23T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (57, 2, CAST(N'2022-08-24T12:30:00.000' AS DateTime), CAST(N'2022-08-24T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (58, 2, CAST(N'2022-08-25T12:30:00.000' AS DateTime), CAST(N'2022-08-25T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (59, 2, CAST(N'2022-08-26T12:30:00.000' AS DateTime), CAST(N'2022-08-26T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (60, 2, CAST(N'2022-08-27T12:30:00.000' AS DateTime), CAST(N'2022-08-27T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (61, 2, CAST(N'2022-08-28T12:30:00.000' AS DateTime), CAST(N'2022-08-28T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (62, 2, CAST(N'2022-08-29T12:30:00.000' AS DateTime), CAST(N'2022-08-29T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (63, 2, CAST(N'2022-08-30T12:30:00.000' AS DateTime), CAST(N'2022-08-30T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (64, 2, CAST(N'2022-08-31T12:30:00.000' AS DateTime), CAST(N'2022-08-31T17:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (65, 3, CAST(N'2022-08-01T17:30:00.000' AS DateTime), CAST(N'2022-08-01T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (66, 3, CAST(N'2022-08-02T17:30:00.000' AS DateTime), CAST(N'2022-08-02T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (67, 3, CAST(N'2022-08-03T17:30:00.000' AS DateTime), CAST(N'2022-08-03T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (68, 3, CAST(N'2022-08-04T17:30:00.000' AS DateTime), CAST(N'2022-08-04T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (69, 3, CAST(N'2022-08-05T17:30:00.000' AS DateTime), CAST(N'2022-08-05T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (70, 3, CAST(N'2022-08-06T17:30:00.000' AS DateTime), CAST(N'2022-08-06T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (71, 3, CAST(N'2022-08-07T17:30:00.000' AS DateTime), CAST(N'2022-08-07T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (72, 3, CAST(N'2022-08-08T17:30:00.000' AS DateTime), CAST(N'2022-08-08T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (73, 3, CAST(N'2022-08-09T17:30:00.000' AS DateTime), CAST(N'2022-08-09T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (74, 3, CAST(N'2022-08-10T17:30:00.000' AS DateTime), CAST(N'2022-08-10T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (75, 3, CAST(N'2022-08-11T17:30:00.000' AS DateTime), CAST(N'2022-08-11T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (76, 3, CAST(N'2022-08-12T17:30:00.000' AS DateTime), CAST(N'2022-08-12T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (77, 3, CAST(N'2022-08-13T17:30:00.000' AS DateTime), CAST(N'2022-08-13T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (78, 3, CAST(N'2022-08-14T17:30:00.000' AS DateTime), CAST(N'2022-08-14T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (79, 3, CAST(N'2022-08-15T17:30:00.000' AS DateTime), CAST(N'2022-08-15T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (80, 3, CAST(N'2022-08-16T17:30:00.000' AS DateTime), CAST(N'2022-08-16T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (81, 3, CAST(N'2022-08-17T17:30:00.000' AS DateTime), CAST(N'2022-08-17T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (82, 3, CAST(N'2022-08-18T17:30:00.000' AS DateTime), CAST(N'2022-08-18T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (83, 3, CAST(N'2022-08-19T17:30:00.000' AS DateTime), CAST(N'2022-08-19T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (84, 3, CAST(N'2022-08-20T17:30:00.000' AS DateTime), CAST(N'2022-08-20T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (85, 3, CAST(N'2022-08-21T17:30:00.000' AS DateTime), CAST(N'2022-08-21T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (86, 3, CAST(N'2022-08-22T17:30:00.000' AS DateTime), CAST(N'2022-08-22T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (87, 3, CAST(N'2022-08-23T17:30:00.000' AS DateTime), CAST(N'2022-08-23T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (88, 3, CAST(N'2022-08-24T17:30:00.000' AS DateTime), CAST(N'2022-08-24T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (89, 3, CAST(N'2022-08-25T17:30:00.000' AS DateTime), CAST(N'2022-08-25T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (90, 3, CAST(N'2022-08-26T17:30:00.000' AS DateTime), CAST(N'2022-08-26T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (91, 3, CAST(N'2022-08-27T17:30:00.000' AS DateTime), CAST(N'2022-08-27T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (92, 3, CAST(N'2022-08-28T17:30:00.000' AS DateTime), CAST(N'2022-08-28T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (93, 3, CAST(N'2022-08-29T17:30:00.000' AS DateTime), CAST(N'2022-08-29T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (94, 3, CAST(N'2022-08-30T17:30:00.000' AS DateTime), CAST(N'2022-08-30T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (95, 3, CAST(N'2022-08-31T17:30:00.000' AS DateTime), CAST(N'2022-08-31T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (189, 4, CAST(N'2022-08-01T08:30:00.000' AS DateTime), CAST(N'2022-08-01T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (190, 4, CAST(N'2022-08-02T08:30:00.000' AS DateTime), CAST(N'2022-08-02T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (191, 4, CAST(N'2022-08-03T08:30:00.000' AS DateTime), CAST(N'2022-08-03T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (192, 4, CAST(N'2022-08-04T08:30:00.000' AS DateTime), CAST(N'2022-08-04T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (193, 4, CAST(N'2022-08-05T08:30:00.000' AS DateTime), CAST(N'2022-08-05T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (194, 4, CAST(N'2022-08-06T08:30:00.000' AS DateTime), CAST(N'2022-08-06T12:30:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (195, 4, CAST(N'2022-08-07T08:30:00.000' AS DateTime), CAST(N'2022-08-07T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (196, 4, NULL, NULL, 1, 1)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (197, 4, CAST(N'2022-08-09T08:30:00.000' AS DateTime), CAST(N'2022-08-09T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (198, 4, CAST(N'2022-08-10T08:30:00.000' AS DateTime), CAST(N'2022-08-10T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (199, 4, CAST(N'2022-08-11T08:30:00.000' AS DateTime), CAST(N'2022-08-11T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (200, 4, CAST(N'2022-08-12T08:30:00.000' AS DateTime), CAST(N'2022-08-12T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (201, 4, CAST(N'2022-08-13T08:30:00.000' AS DateTime), CAST(N'2022-08-13T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (202, 4, CAST(N'2022-08-14T08:30:00.000' AS DateTime), CAST(N'2022-08-14T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (203, 4, CAST(N'2022-08-15T08:30:00.000' AS DateTime), CAST(N'2022-08-15T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (204, 4, CAST(N'2022-08-16T08:30:00.000' AS DateTime), CAST(N'2022-08-16T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (205, 4, CAST(N'2022-08-17T08:30:00.000' AS DateTime), CAST(N'2022-08-17T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (206, 4, CAST(N'2022-08-18T08:30:00.000' AS DateTime), CAST(N'2022-08-18T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (207, 4, CAST(N'2022-08-19T08:30:00.000' AS DateTime), CAST(N'2022-08-19T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (208, 4, CAST(N'2022-08-20T08:30:00.000' AS DateTime), CAST(N'2022-08-20T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (209, 4, NULL, NULL, 1, 12)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (210, 4, CAST(N'2022-08-22T08:30:00.000' AS DateTime), CAST(N'2022-08-22T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (211, 4, CAST(N'2022-08-23T08:30:00.000' AS DateTime), CAST(N'2022-08-23T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (212, 4, CAST(N'2022-08-24T08:30:00.000' AS DateTime), CAST(N'2022-08-24T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (213, 4, CAST(N'2022-08-25T08:30:00.000' AS DateTime), CAST(N'2022-08-25T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (214, 4, CAST(N'2022-08-26T08:30:00.000' AS DateTime), CAST(N'2022-08-26T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (215, 4, NULL, NULL, 1, 2)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (216, 4, CAST(N'2022-08-28T08:30:00.000' AS DateTime), CAST(N'2022-08-28T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (217, 4, CAST(N'2022-08-29T08:30:00.000' AS DateTime), CAST(N'2022-08-29T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (218, 4, CAST(N'2022-08-30T08:30:00.000' AS DateTime), CAST(N'2022-08-30T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (219, 4, CAST(N'2022-08-31T08:30:00.000' AS DateTime), CAST(N'2022-08-31T12:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (221, 5, CAST(N'2022-08-01T08:30:00.000' AS DateTime), CAST(N'2022-08-01T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (222, 5, CAST(N'2022-08-02T08:30:00.000' AS DateTime), CAST(N'2022-08-02T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (223, 5, CAST(N'2022-08-03T08:30:00.000' AS DateTime), CAST(N'2022-08-03T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (224, 5, CAST(N'2022-08-04T08:30:00.000' AS DateTime), CAST(N'2022-08-04T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (225, 5, CAST(N'2022-08-05T08:30:00.000' AS DateTime), CAST(N'2022-08-05T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (226, 5, NULL, NULL, 1, 3)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (227, 5, NULL, NULL, 1, 4)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (228, 5, CAST(N'2022-08-08T08:30:00.000' AS DateTime), CAST(N'2022-08-08T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (229, 5, CAST(N'2022-08-09T08:30:00.000' AS DateTime), CAST(N'2022-08-09T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (230, 5, CAST(N'2022-08-10T08:30:00.000' AS DateTime), CAST(N'2022-08-10T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (231, 5, CAST(N'2022-08-11T08:30:00.000' AS DateTime), CAST(N'2022-08-11T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (232, 5, CAST(N'2022-08-12T08:30:00.000' AS DateTime), CAST(N'2022-08-12T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (233, 5, NULL, NULL, 1, 5)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (234, 5, NULL, NULL, 1, 6)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (235, 5, CAST(N'2022-08-15T08:30:00.000' AS DateTime), CAST(N'2022-08-15T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (236, 5, CAST(N'2022-08-16T08:30:00.000' AS DateTime), CAST(N'2022-08-16T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (237, 5, CAST(N'2022-08-17T08:30:00.000' AS DateTime), CAST(N'2022-08-17T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (238, 5, CAST(N'2022-08-18T08:30:00.000' AS DateTime), CAST(N'2022-08-18T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (239, 5, CAST(N'2022-08-19T08:30:00.000' AS DateTime), CAST(N'2022-08-19T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (240, 5, NULL, NULL, 1, 7)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (241, 5, NULL, NULL, 1, 8)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (242, 5, CAST(N'2022-08-22T08:30:00.000' AS DateTime), CAST(N'2022-08-22T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (243, 5, CAST(N'2022-08-23T08:30:00.000' AS DateTime), CAST(N'2022-08-23T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (244, 5, CAST(N'2022-08-24T08:30:00.000' AS DateTime), CAST(N'2022-08-24T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (245, 5, CAST(N'2022-08-25T08:30:00.000' AS DateTime), CAST(N'2022-08-25T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (246, 5, CAST(N'2022-08-26T08:30:00.000' AS DateTime), CAST(N'2022-08-26T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (247, 5, NULL, NULL, 1, 9)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (248, 5, NULL, NULL, 1, 10)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (249, 5, CAST(N'2022-08-29T08:30:00.000' AS DateTime), CAST(N'2022-08-29T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (250, 5, CAST(N'2022-08-30T08:30:00.000' AS DateTime), CAST(N'2022-08-30T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (251, 5, CAST(N'2022-08-31T08:30:00.000' AS DateTime), CAST(N'2022-08-31T17:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (252, 6, CAST(N'2022-08-01T17:30:00.000' AS DateTime), CAST(N'2022-08-01T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (253, 6, CAST(N'2022-08-02T17:30:00.000' AS DateTime), CAST(N'2022-08-02T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (254, 6, CAST(N'2022-08-03T17:30:00.000' AS DateTime), CAST(N'2022-08-03T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (255, 6, CAST(N'2022-08-04T17:30:00.000' AS DateTime), CAST(N'2022-08-04T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (256, 6, CAST(N'2022-08-05T17:30:00.000' AS DateTime), CAST(N'2022-08-05T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (257, 6, NULL, NULL, 3, 13)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (258, 6, NULL, NULL, 3, 14)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (259, 6, CAST(N'2022-08-08T17:30:00.000' AS DateTime), CAST(N'2022-08-08T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (260, 6, CAST(N'2022-08-09T17:30:00.000' AS DateTime), CAST(N'2022-08-09T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (261, 6, CAST(N'2022-08-10T17:30:00.000' AS DateTime), CAST(N'2022-08-10T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (262, 6, CAST(N'2022-08-11T17:30:00.000' AS DateTime), CAST(N'2022-08-11T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (263, 6, CAST(N'2022-08-12T17:30:00.000' AS DateTime), CAST(N'2022-08-12T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (264, 6, CAST(N'2022-08-13T17:30:00.000' AS DateTime), CAST(N'2022-08-13T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (265, 6, CAST(N'2022-08-14T17:30:00.000' AS DateTime), CAST(N'2022-08-14T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (266, 6, CAST(N'2022-08-15T17:30:00.000' AS DateTime), CAST(N'2022-08-15T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (267, 6, CAST(N'2022-08-16T17:30:00.000' AS DateTime), CAST(N'2022-08-16T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (268, 6, CAST(N'2022-08-17T17:30:00.000' AS DateTime), CAST(N'2022-08-17T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (269, 6, CAST(N'2022-08-18T17:30:00.000' AS DateTime), CAST(N'2022-08-18T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (270, 6, CAST(N'2022-08-19T17:30:00.000' AS DateTime), CAST(N'2022-08-19T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (271, 6, CAST(N'2022-08-20T17:30:00.000' AS DateTime), CAST(N'2022-08-20T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (272, 6, CAST(N'2022-08-21T17:30:00.000' AS DateTime), CAST(N'2022-08-21T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (273, 6, CAST(N'2022-08-22T17:30:00.000' AS DateTime), CAST(N'2022-08-22T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (274, 6, CAST(N'2022-08-23T17:30:00.000' AS DateTime), CAST(N'2022-08-23T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (275, 6, NULL, NULL, 3, 11)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (276, 6, CAST(N'2022-08-25T17:30:00.000' AS DateTime), CAST(N'2022-08-25T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (277, 6, CAST(N'2022-08-26T17:30:00.000' AS DateTime), CAST(N'2022-08-26T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (278, 6, CAST(N'2022-08-27T17:30:00.000' AS DateTime), CAST(N'2022-08-27T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (279, 6, CAST(N'2022-08-28T17:30:00.000' AS DateTime), CAST(N'2022-08-28T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (280, 6, CAST(N'2022-08-29T17:30:00.000' AS DateTime), CAST(N'2022-08-29T22:30:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (281, 6, NULL, NULL, 3, 15)
INSERT [dbo].[Timesheet] ([tid], [eid], [checkin], [checkout], [sid], [aid]) VALUES (282, 6, CAST(N'2022-08-31T17:30:00.000' AS DateTime), CAST(N'2022-08-31T22:30:00.000' AS DateTime), 3, NULL)
SET IDENTITY_INSERT [dbo].[Timesheet] OFF
GO
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Absence] CHECK CONSTRAINT [FK_Absence_Employee]
GO
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_Shift] FOREIGN KEY([sid])
REFERENCES [dbo].[Shift] ([sid])
GO
ALTER TABLE [dbo].[Absence] CHECK CONSTRAINT [FK_Absence_Shift]
GO
ALTER TABLE [dbo].[Allowance]  WITH CHECK ADD  CONSTRAINT [FK_Allowance_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Allowance] CHECK CONSTRAINT [FK_Allowance_Employee]
GO
ALTER TABLE [dbo].[Allowance]  WITH CHECK ADD  CONSTRAINT [FK_Allowance_Employee1] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Allowance] CHECK CONSTRAINT [FK_Allowance_Employee1]
GO
ALTER TABLE [dbo].[Allowance]  WITH CHECK ADD  CONSTRAINT [FK_Allowance_Gross] FOREIGN KEY([gid])
REFERENCES [dbo].[Gross] ([gid])
GO
ALTER TABLE [dbo].[Allowance] CHECK CONSTRAINT [FK_Allowance_Gross]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([pid])
REFERENCES [dbo].[Position] ([pid])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
ALTER TABLE [dbo].[Overtime]  WITH CHECK ADD  CONSTRAINT [FK_Overtime_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Overtime] CHECK CONSTRAINT [FK_Overtime_Employee]
GO
ALTER TABLE [dbo].[Overtime]  WITH CHECK ADD  CONSTRAINT [FK_Overtime_Shift] FOREIGN KEY([sid])
REFERENCES [dbo].[Shift] ([sid])
GO
ALTER TABLE [dbo].[Overtime] CHECK CONSTRAINT [FK_Overtime_Shift]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Absence] FOREIGN KEY([aid])
REFERENCES [dbo].[Absence] ([aid])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Absence]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Employee]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Shift] FOREIGN KEY([sid])
REFERENCES [dbo].[Shift] ([sid])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Shift]
GO
USE [master]
GO
ALTER DATABASE [TimesheetManagement] SET  READ_WRITE 
GO

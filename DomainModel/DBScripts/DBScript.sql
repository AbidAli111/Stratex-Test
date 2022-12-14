USE [master]
GO
/****** Object:  Database [EmployeesSchedule]    Script Date: 9/30/2022 ******/
CREATE DATABASE [EmployeesSchedule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'backend-alb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\backend-alb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'backend-alb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\backend-alb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EmployeesSchedule] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeesSchedule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeesSchedule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeesSchedule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeesSchedule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeesSchedule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeesSchedule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeesSchedule] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeesSchedule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeesSchedule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeesSchedule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeesSchedule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeesSchedule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeesSchedule] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EmployeesSchedule] SET QUERY_STORE = OFF
GO
USE [EmployeesSchedule]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/30/2022  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesShift]    Script Date: 9/30/2022 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesShift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[ShiftDate] [date] NULL,
	[ShiftFrom] [time](7) NULL,
	[ShiftTo] [time](7) NULL,
	[ShiftType] [varchar](50) NULL,
 CONSTRAINT [PK_EmployeesShift] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmpId], [LastName], [FirstName], [PhoneNumber], [Address]) VALUES (1, N'Waqas', N'khan', N'03025558960', N'Isl')
INSERT [dbo].[Employees] ([EmpId], [LastName], [FirstName], [PhoneNumber], [Address]) VALUES (2, N'Zulkifal', N'Khan', N'03028855960', N'Isl')
INSERT [dbo].[Employees] ([EmpId], [LastName], [FirstName], [PhoneNumber], [Address]) VALUES (3, N'Meer', N'Zaman', N'03458889552', N'RWP')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeesShift] ON 

INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (1, 1, CAST(N'2022-09-30' AS Date), CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chat Shift')
INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (2, 1, CAST(N'2022-09-30' AS Date), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), N'Break')
INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (3, 1, CAST(N'2022-09-30' AS Date), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Break')
INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (4, 1, CAST(N'2022-09-30' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Leave')
INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (5, 2, CAST(N'2022-09-30' AS Date), CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chat Shift')
INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (6, 2, CAST(N'2022-09-30' AS Date), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Break')
INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (7, 3, CAST(N'2022-09-30' AS Date), CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Call Shift')
INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (8, 3, CAST(N'2022-09-30' AS Date), CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), N'Leave')
INSERT [dbo].[EmployeesShift] ([ShiftId], [EmpId], [ShiftDate], [ShiftFrom], [ShiftTo], [ShiftType]) VALUES (9, 3, CAST(N'2022-09-30' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Break')
SET IDENTITY_INSERT [dbo].[EmployeesShift] OFF
GO
USE [master]
GO
ALTER DATABASE [EmployeesSchedule] SET  READ_WRITE 
GO

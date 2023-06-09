USE [master]
GO
/****** Object:  Database [diagnostic_system]    Script Date: 18.05.2023 12:38:54 ******/
CREATE DATABASE [diagnostic_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'diagnostic_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\diagnostic_system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'diagnostic_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\diagnostic_system_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [diagnostic_system] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [diagnostic_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [diagnostic_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [diagnostic_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [diagnostic_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [diagnostic_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [diagnostic_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [diagnostic_system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [diagnostic_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [diagnostic_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [diagnostic_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [diagnostic_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [diagnostic_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [diagnostic_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [diagnostic_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [diagnostic_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [diagnostic_system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [diagnostic_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [diagnostic_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [diagnostic_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [diagnostic_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [diagnostic_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [diagnostic_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [diagnostic_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [diagnostic_system] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [diagnostic_system] SET  MULTI_USER 
GO
ALTER DATABASE [diagnostic_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [diagnostic_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [diagnostic_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [diagnostic_system] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [diagnostic_system] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [diagnostic_system] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [diagnostic_system] SET QUERY_STORE = ON
GO
ALTER DATABASE [diagnostic_system] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [diagnostic_system]
GO
/****** Object:  User [ds_user]    Script Date: 18.05.2023 12:38:54 ******/
CREATE USER [ds_user] FOR LOGIN [ds_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ds_user]
GO
/****** Object:  Table [dbo].[alerts]    Script Date: 18.05.2023 12:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alerts](
	[alert_id] [int] IDENTITY(1,1) NOT NULL,
	[param_id] [int] NULL,
	[rule_id] [int] NULL,
	[value_id] [int] NULL,
	[consequence] [varchar](500) NULL,
	[is_archived] [int] NULL,
 CONSTRAINT [alerts_pk] PRIMARY KEY CLUSTERED 
(
	[alert_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[param_rules]    Script Date: 18.05.2023 12:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[param_rules](
	[rule_id] [int] IDENTITY(1,1) NOT NULL,
	[param_id] [int] NOT NULL,
	[rule_type] [varchar](10) NOT NULL,
	[min_value] [numeric](15, 3) NOT NULL,
	[max_value] [numeric](15, 3) NULL,
	[alert_kind] [varchar](10) NULL,
 CONSTRAINT [param_rules_pk] PRIMARY KEY CLUSTERED 
(
	[rule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[param_values]    Script Date: 18.05.2023 12:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[param_values](
	[value_id] [int] IDENTITY(1,1) NOT NULL,
	[param_id] [int] NOT NULL,
	[value] [numeric](15, 3) NOT NULL,
	[datetime] [datetime2](7) NOT NULL,
	[is_checked] [int] NOT NULL,
 CONSTRAINT [param_values_pk] PRIMARY KEY CLUSTERED 
(
	[value_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[params]    Script Date: 18.05.2023 12:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[params](
	[param_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
 CONSTRAINT [params_pk] PRIMARY KEY CLUSTERED 
(
	[param_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[alerts] ON 

INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (63, 1, 4, 19, NULL, 1)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (64, 1, 3, 20, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (65, 1, 3, 21, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (66, 2, 5, 22, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (67, 2, 5, 23, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (68, 2, 6, 24, NULL, 1)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (69, 2, 6, 25, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (70, 2, 6, 26, NULL, 0)
SET IDENTITY_INSERT [dbo].[alerts] OFF
GO
SET IDENTITY_INSERT [dbo].[param_rules] ON 

INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (3, 1, N'MORE', CAST(161.000 AS Numeric(15, 3)), CAST(99999.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (4, 1, N'MORE', CAST(150.000 AS Numeric(15, 3)), CAST(160.000 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (5, 2, N'LESS', CAST(-99999.000 AS Numeric(15, 3)), CAST(24.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (6, 2, N'LESS', CAST(25.000 AS Numeric(15, 3)), CAST(40.000 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (7, 3, N'MORE', CAST(0.200 AS Numeric(15, 3)), CAST(0.499 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (8, 3, N'MORE', CAST(0.500 AS Numeric(15, 3)), CAST(99999.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (9, 4, N'MORE', CAST(240.000 AS Numeric(15, 3)), CAST(299.000 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (10, 4, N'MORE', CAST(300.000 AS Numeric(15, 3)), CAST(99999.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (11, 5, N'MORE', CAST(87.000 AS Numeric(15, 3)), CAST(93.000 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (12, 5, N'MORE', CAST(94.000 AS Numeric(15, 3)), CAST(99999.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (13, 6, N'LESS', CAST(-99999.000 AS Numeric(15, 3)), CAST(0.540 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (14, 6, N'LESS', CAST(0.541 AS Numeric(15, 3)), CAST(0.700 AS Numeric(15, 3)), N'WARNING')
SET IDENTITY_INSERT [dbo].[param_rules] OFF
GO
SET IDENTITY_INSERT [dbo].[param_values] ON 

INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (17, 1, CAST(136.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:43:35.2900000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (18, 1, CAST(140.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:45:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (19, 1, CAST(150.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:47:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (20, 1, CAST(165.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:59:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (21, 1, CAST(166.000 AS Numeric(15, 3)), CAST(N'2023-04-13T15:06:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (22, 2, CAST(15.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (23, 2, CAST(20.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:01:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (24, 2, CAST(25.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:03:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (25, 2, CAST(25.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:05:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (26, 2, CAST(25.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:07:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[param_values] OFF
GO
SET IDENTITY_INSERT [dbo].[params] ON 

INSERT [dbo].[params] ([param_id], [name]) VALUES (1, N'Inom')
INSERT [dbo].[params] ([param_id], [name]) VALUES (2, N'Tnom')
INSERT [dbo].[params] ([param_id], [name]) VALUES (3, N'Tп')
INSERT [dbo].[params] ([param_id], [name]) VALUES (4, N'Imax')
INSERT [dbo].[params] ([param_id], [name]) VALUES (5, N'фА')
INSERT [dbo].[params] ([param_id], [name]) VALUES (6, N'Тп')
SET IDENTITY_INSERT [dbo].[params] OFF
GO
/****** Object:  Index [IX_params]    Script Date: 18.05.2023 12:38:55 ******/
ALTER TABLE [dbo].[params] ADD  CONSTRAINT [IX_params] UNIQUE NONCLUSTERED 
(
	[param_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[alerts] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[param_values] ADD  DEFAULT ((0)) FOR [is_checked]
GO
ALTER TABLE [dbo].[alerts]  WITH CHECK ADD  CONSTRAINT [alerts_param_rules_rule_id_fk] FOREIGN KEY([rule_id])
REFERENCES [dbo].[param_rules] ([rule_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[alerts] CHECK CONSTRAINT [alerts_param_rules_rule_id_fk]
GO
ALTER TABLE [dbo].[alerts]  WITH CHECK ADD  CONSTRAINT [alerts_param_values_value_id_fk] FOREIGN KEY([value_id])
REFERENCES [dbo].[param_values] ([value_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[alerts] CHECK CONSTRAINT [alerts_param_values_value_id_fk]
GO
ALTER TABLE [dbo].[alerts]  WITH CHECK ADD  CONSTRAINT [params___fk] FOREIGN KEY([param_id])
REFERENCES [dbo].[params] ([param_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[alerts] CHECK CONSTRAINT [params___fk]
GO
ALTER TABLE [dbo].[param_rules]  WITH CHECK ADD  CONSTRAINT [FK_param_rules_params] FOREIGN KEY([param_id])
REFERENCES [dbo].[params] ([param_id])
GO
ALTER TABLE [dbo].[param_rules] CHECK CONSTRAINT [FK_param_rules_params]
GO
ALTER TABLE [dbo].[param_values]  WITH CHECK ADD  CONSTRAINT [FK_param_values_params] FOREIGN KEY([param_id])
REFERENCES [dbo].[params] ([param_id])
GO
ALTER TABLE [dbo].[param_values] CHECK CONSTRAINT [FK_param_values_params]
GO
USE [master]
GO
ALTER DATABASE [diagnostic_system] SET  READ_WRITE 
GO

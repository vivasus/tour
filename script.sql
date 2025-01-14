USE [master]
GO
/****** Object:  Database [Tous]    Script Date: 03.06.2024 13:52:30 ******/
CREATE DATABASE [Tous]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tous', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tous.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tous_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tous_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tous] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tous].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tous] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tous] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tous] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tous] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tous] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tous] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tous] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tous] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tous] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tous] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tous] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tous] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tous] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tous] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tous] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tous] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tous] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tous] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tous] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tous] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tous] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tous] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tous] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tous] SET  MULTI_USER 
GO
ALTER DATABASE [Tous] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tous] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tous] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tous] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tous] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tous] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tous] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tous] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tous]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 03.06.2024 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 03.06.2024 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[CountOfStars] [int] NULL,
	[CountryCode] [nchar](2) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 03.06.2024 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[Hotelld] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[GreationDate] [datetime] NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotelimage]    Script Date: 03.06.2024 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotelimage](
	[id] [int] NOT NULL,
	[Hotelld] [int] NULL,
	[ImageSource] [varbinary](100) NULL,
 CONSTRAINT [PK_Hotelimage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotellmage]    Script Date: 03.06.2024 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotellmage](
	[id] [int] NOT NULL,
	[hotelld] [int] NULL,
	[ImageSource] [varbinary](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotelOfTour]    Script Date: 03.06.2024 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelOfTour](
	[Hotelld] [nchar](10) NOT NULL,
	[Tourld] [nchar](10) NOT NULL,
 CONSTRAINT [PK_hotelOfTour] PRIMARY KEY CLUSTERED 
(
	[Hotelld] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 03.06.2024 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePrevivew] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 03.06.2024 13:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ch', N'китай                                                                                               ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'en', N'англия                                                                                              ')
GO
INSERT [dbo].[Hotel] ([id], [name], [CountOfStars], [CountryCode]) VALUES (1, N'космос', 5, NULL)
INSERT [dbo].[Hotel] ([id], [name], [CountOfStars], [CountryCode]) VALUES (2, N'укранина', 5, N'ru')
INSERT [dbo].[Hotel] ([id], [name], [CountOfStars], [CountryCode]) VALUES (3, N'Four Seasons', 5, N'ru')
INSERT [dbo].[Hotel] ([id], [name], [CountOfStars], [CountryCode]) VALUES (8, N'Тереза', 5, N'ch')
GO
INSERT [dbo].[HotelComment] ([id], [Hotelld], [Text], [Author], [GreationDate]) VALUES (1, 1, N'замечательный', N'иванов иван', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HotelComment] ([id], [Hotelld], [Text], [Author], [GreationDate]) VALUES (2, 2, N'лучший отель', N'Джон Дое', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HotelComment] ([id], [Hotelld], [Text], [Author], [GreationDate]) VALUES (3, 3, N'есть к чему стремиться', N'Мария', NULL)
GO
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Description], [ImagePrevivew], [Price], [IsActual]) VALUES (1, 127, N'Болгарское наледие', NULL, NULL, 35700.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Description], [ImagePrevivew], [Price], [IsActual]) VALUES (4, 92, N'волшебный восток', NULL, NULL, 77100.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Description], [ImagePrevivew], [Price], [IsActual]) VALUES (5, 72, N'Город с большими огнями', NULL, NULL, 93300.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Description], [ImagePrevivew], [Price], [IsActual]) VALUES (6, 143, N'Город четырёх ветров', NULL, NULL, 72500.0000, 0)
GO
ALTER TABLE [dbo].[Hotelimage]  WITH CHECK ADD  CONSTRAINT [FK_Hotelimage_Tour] FOREIGN KEY([Hotelld])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[Hotelimage] CHECK CONSTRAINT [FK_Hotelimage_Tour]
GO
USE [master]
GO
ALTER DATABASE [Tous] SET  READ_WRITE 
GO

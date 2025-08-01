USE [master]
GO
/****** Object:  Database [major]    Script Date: 6/15/2025 3:26:57 PM ******/
CREATE DATABASE [major]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'major', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\major.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'major_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\major_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [major] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [major].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [major] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [major] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [major] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [major] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [major] SET ARITHABORT OFF 
GO
ALTER DATABASE [major] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [major] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [major] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [major] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [major] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [major] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [major] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [major] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [major] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [major] SET  ENABLE_BROKER 
GO
ALTER DATABASE [major] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [major] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [major] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [major] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [major] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [major] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [major] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [major] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [major] SET  MULTI_USER 
GO
ALTER DATABASE [major] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [major] SET DB_CHAINING OFF 
GO
ALTER DATABASE [major] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [major] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [major] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [major] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [major] SET QUERY_STORE = ON
GO
ALTER DATABASE [major] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [major]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 6/15/2025 3:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[ad_name] [nchar](10) NULL,
	[ad_email] [nchar](30) NULL,
	[ad_pwd] [nchar](30) NULL,
	[ad_usertype] [nchar](20) NULL,
	[ad_phn] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 6/15/2025 3:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[cust_name] [nchar](30) NOT NULL,
	[cust_email] [nchar](50) NOT NULL,
	[cust_pwd] [nchar](10) NOT NULL,
	[cust_usertype] [nchar](10) NOT NULL,
	[cust_phn] [nchar](10) NOT NULL,
	[amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/15/2025 3:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[cust_email] [nchar](30) NULL,
	[food_name] [nchar](50) NOT NULL,
	[food_price] [int] NOT NULL,
	[no_of_food] [int] NOT NULL,
	[status] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurant]    Script Date: 6/15/2025 3:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurant](
	[cust_email] [nchar](30) NULL,
	[type] [nchar](30) NOT NULL,
	[price] [int] NOT NULL,
	[status] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 6/15/2025 3:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[cust_email] [nchar](30) NULL,
	[room_type] [nchar](30) NOT NULL,
	[room_price] [int] NOT NULL,
	[available_rooms] [int] NOT NULL,
	[booked_rooms] [int] NOT NULL,
	[status] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [major] SET  READ_WRITE 
GO

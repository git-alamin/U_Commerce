USE [master]
GO
/****** Object:  Database [UCommerceDB]    Script Date: 16-Feb-18 3:02:48 PM ******/
CREATE DATABASE [UCommerceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UCommerceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UCommerceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UCommerceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UCommerceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UCommerceDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UCommerceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UCommerceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UCommerceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UCommerceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UCommerceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UCommerceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UCommerceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UCommerceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UCommerceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UCommerceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UCommerceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UCommerceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UCommerceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UCommerceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UCommerceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UCommerceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UCommerceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UCommerceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UCommerceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UCommerceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UCommerceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UCommerceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UCommerceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UCommerceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UCommerceDB] SET  MULTI_USER 
GO
ALTER DATABASE [UCommerceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UCommerceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UCommerceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UCommerceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UCommerceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UCommerceDB] SET QUERY_STORE = OFF
GO
USE [UCommerceDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [UCommerceDB]
GO
/****** Object:  Table [dbo].[UserVerified]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVerified](
	[UserId] [int] NOT NULL,
	[DateTime] [date] NOT NULL,
	[Ip] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserVerified] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Contact] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Gender] [int] NOT NULL,
	[JoinDate] [date] NOT NULL,
	[Ip] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [varchar](500) NOT NULL,
	[CityId] [int] NOT NULL,
	[Image] [varchar](200) NULL,
 CONSTRAINT [PK__Users__3214EC07E461B487] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vmVerifiedUsers]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vmVerifiedUsers] 
as
select * from users where id in (select userid from userverified)
GO
/****** Object:  View [dbo].[vmUnVerifiedUsers]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vmUnVerifiedUsers] 
as
select * from users where id not in (select userid from userverified)
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[CountryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DateTime] [datetime] NULL,
	[Ip] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DateTime] [date] NOT NULL,
	[Ip] [varchar](20) NOT NULL,
	[Message] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](500) NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ConditionId] [int] NULL,
	[UserId] [int] NOT NULL,
	[RegularPrice] [float] NULL,
	[OfferPrice] [float] NULL,
	[Negotiable] [int] NULL,
	[Link] [varchar](200) NULL,
	[Video] [varchar](200) NULL,
	[CreateDate] [date] NOT NULL,
	[Ip] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductArchive]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductArchive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Ip] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductBrand]    Script Date: 16-Feb-18 3:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBrand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](2000) NULL,
	[Origin] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](2000) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK__category__3213E83F4E74CE51] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductClosed]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductClosed](
	[ProductId] [int] NOT NULL,
	[DateTime] [datetime] NULL,
	[ClosingTypeId] [int] NOT NULL,
 CONSTRAINT [PK_ProductClosed] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCloseType]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCloseType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductComments]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DateTime] [date] NOT NULL,
	[Ip] [varchar](20) NOT NULL,
	[Comment] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCondition]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCondition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Image] [varchar](200) NOT NULL,
	[Title] [varchar](100) NOT NULL,
 CONSTRAINT [PK__ProductI__3214EC07A643E8CA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLike]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLike](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Ip] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRating]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Ip] [varchar](200) NOT NULL,
	[Rating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVerified]    Script Date: 16-Feb-18 3:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVerified](
	[ProductId] [int] NOT NULL,
	[AdminUserId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Ip] [varchar](200) NOT NULL,
 CONSTRAINT [PK_ProductVerified] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AdminUser] ([UserId]) VALUES (7)
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name], [CountryId]) VALUES (4, N'Dhaka', 1)
INSERT [dbo].[City] ([Id], [Name], [CountryId]) VALUES (6, N'New Delhi', 2)
INSERT [dbo].[City] ([Id], [Name], [CountryId]) VALUES (8, N'Comilla', 1)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name]) VALUES (1004, N'Australia')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (1, N'Bangladesh')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (2, N'India')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (3, N'Pakistan')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (1003, N'Sri Lanka')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [CategoryId], [BrandId], [ConditionId], [UserId], [RegularPrice], [OfferPrice], [Negotiable], [Link], [Video], [CreateDate], [Ip]) VALUES (4, N'The New Product', N'some description', 3, 5, 4, 7, 2500, 2000, NULL, N'www.google.com', N'www.youtube.com', CAST(N'2018-02-12' AS Date), N'::1')
INSERT [dbo].[Product] ([Id], [Name], [Description], [CategoryId], [BrandId], [ConditionId], [UserId], [RegularPrice], [OfferPrice], [Negotiable], [Link], [Video], [CreateDate], [Ip]) VALUES (5, N'Product No2', N'descriptio of product 2', 1, 1, 3, 8, 95000, 90000, NULL, N'sdfadfasdfasdf', N'asdfasdfasfd', CAST(N'2018-02-12' AS Date), N'::1')
INSERT [dbo].[Product] ([Id], [Name], [Description], [CategoryId], [BrandId], [ConditionId], [UserId], [RegularPrice], [OfferPrice], [Negotiable], [Link], [Video], [CreateDate], [Ip]) VALUES (6, N'ABCD New', N'asjdklf', 1, 1, 3, 7, 234, 234, NULL, N'asfdasdfasdfasdf', N'fsaasdfasdf', CAST(N'2018-02-13' AS Date), N'::1')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductBrand] ON 

INSERT [dbo].[ProductBrand] ([Id], [Name], [Description], [Origin]) VALUES (1, N'Apple', N'NA', N'USA')
INSERT [dbo].[ProductBrand] ([Id], [Name], [Description], [Origin]) VALUES (3, N'Assus', N'NA', N'Not Sure')
INSERT [dbo].[ProductBrand] ([Id], [Name], [Description], [Origin]) VALUES (4, N'Samsung', N'NA', N'Not Sure')
INSERT [dbo].[ProductBrand] ([Id], [Name], [Description], [Origin]) VALUES (5, N'Local', N'NA', N'Gulistan')
INSERT [dbo].[ProductBrand] ([Id], [Name], [Description], [Origin]) VALUES (6, N'HP', N'NA', N'Not Sure')
SET IDENTITY_INSERT [dbo].[ProductBrand] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (1, N'Electronics', N'NAg', 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (2, N'Computer', N'NA', 1)
INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (3, N'Garments', N'NA', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (4, N'Beauty', N'make up', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (6, N'Computing & Gaming', N'NA Parts', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (7, N'Laptop', N'NA', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (8, N'Desktop & Monitor', N'NA', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (9, N'Computer Accessories', N'NA', 6)
INSERT [dbo].[ProductCategory] ([Id], [Name], [Description], [CategoryId]) VALUES (10, N'HeadPhone', N'Na', 9)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[ProductCloseType] ON 

INSERT [dbo].[ProductCloseType] ([Id], [Name], [Description]) VALUES (2, N'Sold', N'NA')
INSERT [dbo].[ProductCloseType] ([Id], [Name], [Description]) VALUES (3, N'Expired', N'NA')
SET IDENTITY_INSERT [dbo].[ProductCloseType] OFF
SET IDENTITY_INSERT [dbo].[ProductCondition] ON 

INSERT [dbo].[ProductCondition] ([Id], [Name], [Description]) VALUES (3, N'Return', N'can be Returned')
INSERT [dbo].[ProductCondition] ([Id], [Name], [Description]) VALUES (4, N'Cash in Delivery', N'bashai eshe dia jaoa lagbe')
INSERT [dbo].[ProductCondition] ([Id], [Name], [Description]) VALUES (5, N'Brand New', N'NA')
INSERT [dbo].[ProductCondition] ([Id], [Name], [Description]) VALUES (6, N'Used', N'NA')
SET IDENTITY_INSERT [dbo].[ProductCondition] OFF
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [Title]) VALUES (1, 4, N'803_example.jpg', N'hgkj')
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
INSERT [dbo].[ProductVerified] ([ProductId], [AdminUserId], [DateTime], [Ip]) VALUES (5, 7, CAST(N'2018-02-12T23:36:48.457' AS DateTime), N'::1')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Contact], [Email], [Password], [Gender], [JoinDate], [Ip], [DateOfBirth], [Address], [CityId], [Image]) VALUES (7, N'Abdullah Al Amin', N'01910778228', N'ab.alaminshaon@gmail.com', N'12355623558', 1, CAST(N'0001-01-01' AS Date), N'::1', CAST(N'1995-08-01' AS Date), N'Mirpur-2', 4, NULL)
INSERT [dbo].[Users] ([Id], [Name], [Contact], [Email], [Password], [Gender], [JoinDate], [Ip], [DateOfBirth], [Address], [CityId], [Image]) VALUES (8, N'Jishan Ahammed', N'015526321152', N'abcd@gmail.com', N'123113', 1, CAST(N'2018-02-12' AS Date), N'::1', CAST(N'2018-02-01' AS Date), N'sd d sd', 8, N'20971.jpg')
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UserVerified] ([UserId], [DateTime], [Ip]) VALUES (7, CAST(N'2018-02-10' AS Date), N'::1')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__country__72E12F1B42CFE503]    Script Date: 16-Feb-18 3:02:49 PM ******/
ALTER TABLE [dbo].[Country] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__brand__72E12F1B25655FF6]    Script Date: 16-Feb-18 3:02:49 PM ******/
ALTER TABLE [dbo].[ProductBrand] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__category__72E12F1B0A1EDD47]    Script Date: 16-Feb-18 3:02:49 PM ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [UQ__category__72E12F1B0A1EDD47] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534A19234A5]    Script Date: 16-Feb-18 3:02:49 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__A9D10534A19234A5] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F7C04665DBD84527]    Script Date: 16-Feb-18 3:02:49 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__F7C04665DBD84527] UNIQUE NONCLUSTERED 
(
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminUser]  WITH CHECK ADD  CONSTRAINT [FK__AdminUser__UserI__693CA210] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[AdminUser] CHECK CONSTRAINT [FK__AdminUser__UserI__693CA210]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [FK__LoginHist__UserI__60A75C0F] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [FK__LoginHist__UserI__60A75C0F]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK__Message__UserId__571DF1D5] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK__Message__UserId__571DF1D5]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[ProductBrand] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ConditionId])
REFERENCES [dbo].[ProductCondition] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__UserId__534D60F1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__UserId__534D60F1]
GO
ALTER TABLE [dbo].[ProductArchive]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductArchive]  WITH CHECK ADD  CONSTRAINT [FK__Archive__UserId__74AE54BC] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ProductArchive] CHECK CONSTRAINT [FK__Archive__UserId__74AE54BC]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK__category__catego__412EB0B6] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK__category__catego__412EB0B6]
GO
ALTER TABLE [dbo].[ProductClosed]  WITH CHECK ADD FOREIGN KEY([ClosingTypeId])
REFERENCES [dbo].[ProductCloseType] ([Id])
GO
ALTER TABLE [dbo].[ProductClosed]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductComments]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductComments]  WITH CHECK ADD  CONSTRAINT [FK__Comments__UserId__5AEE82B9] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ProductComments] CHECK CONSTRAINT [FK__Comments__UserId__5AEE82B9]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK__ProductIm__Produ__5DCAEF64] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK__ProductIm__Produ__5DCAEF64]
GO
ALTER TABLE [dbo].[ProductLike]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductLike]  WITH CHECK ADD  CONSTRAINT [FK__ProductLi__UserI__6D0D32F4] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ProductLike] CHECK CONSTRAINT [FK__ProductLi__UserI__6D0D32F4]
GO
ALTER TABLE [dbo].[ProductRating]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductRating]  WITH CHECK ADD  CONSTRAINT [FK__ProductRa__UserI__70DDC3D8] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ProductRating] CHECK CONSTRAINT [FK__ProductRa__UserI__70DDC3D8]
GO
ALTER TABLE [dbo].[ProductVerified]  WITH CHECK ADD  CONSTRAINT [FK__ProductVe__Admin__7A672E12] FOREIGN KEY([AdminUserId])
REFERENCES [dbo].[AdminUser] ([UserId])
GO
ALTER TABLE [dbo].[ProductVerified] CHECK CONSTRAINT [FK__ProductVe__Admin__7A672E12]
GO
ALTER TABLE [dbo].[ProductVerified]  WITH CHECK ADD  CONSTRAINT [FK__ProductVe__Produ__797309D9] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductVerified] CHECK CONSTRAINT [FK__ProductVe__Produ__797309D9]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__CityId__49C3F6B7] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__CityId__49C3F6B7]
GO
ALTER TABLE [dbo].[UserVerified]  WITH CHECK ADD  CONSTRAINT [FK__UserVerif__UserI__2CF2ADDF] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserVerified] CHECK CONSTRAINT [FK__UserVerif__UserI__2CF2ADDF]
GO
USE [master]
GO
ALTER DATABASE [UCommerceDB] SET  READ_WRITE 
GO

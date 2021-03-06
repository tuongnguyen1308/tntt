USE [master]
GO
/****** Object:  Database [tntt]    Script Date: 3/31/2021 9:16:48 AM ******/
CREATE DATABASE [tntt]
 CONTAINMENT = NONE
GO
ALTER DATABASE [tntt] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tntt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tntt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tntt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tntt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tntt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tntt] SET ARITHABORT OFF 
GO
ALTER DATABASE [tntt] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [tntt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tntt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tntt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tntt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tntt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tntt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tntt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tntt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tntt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tntt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tntt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tntt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tntt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tntt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tntt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tntt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tntt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tntt] SET  MULTI_USER 
GO
ALTER DATABASE [tntt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tntt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tntt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tntt] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [tntt]
GO
/****** Object:  UserDefinedTableType [dbo].[tbl_ctbl]    Script Date: 3/31/2021 9:16:48 AM ******/
CREATE TYPE [dbo].[tbl_ctbl] AS TABLE(
	[FK_iMaDA] [int] NULL,
	[FK_iMaBL] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tbl_dapan]    Script Date: 3/31/2021 9:16:48 AM ******/
CREATE TYPE [dbo].[tbl_dapan] AS TABLE(
	[iSTT] [int] NULL,
	[sDapAn] [nvarchar](256) NULL,
	[iDung] [bit] NULL,
	[FK_sMaCH] [int] NULL
)
GO
/****** Object:  Table [dbo].[dm_mon]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dm_mon](
	[PK_sMaMon] [nvarchar](50) NOT NULL,
	[sTenMon] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sMaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dm_quyen]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dm_quyen](
	[PK_iMaQ] [int] IDENTITY(1,1) NOT NULL,
	[sTenQ] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bailam]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bailam](
	[PK_iMaBL] [int] IDENTITY(1,1) NOT NULL,
	[FK_iMaD] [nvarchar](50) NULL,
	[FK_sMaSV] [nvarchar](50) NULL,
	[dThoiGianBD] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cauhoi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cauhoi](
	[PK_iMaCH] [int] IDENTITY(1,1) NOT NULL,
	[sCauHoi] [nvarchar](256) NOT NULL,
	[FK_sMaMon] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ctbl]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ctbl](
	[PK_iMaCTBL] [int] IDENTITY(1,1) NOT NULL,
	[FK_iMaDA] [int] NULL,
	[FK_iMaBL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaCTBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_dapan]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dapan](
	[PK_iMaDA] [int] IDENTITY(1,1) NOT NULL,
	[iSTT] [int] NOT NULL,
	[sDapAn] [nvarchar](256) NOT NULL,
	[iDung] [bit] NULL,
	[FK_sMaCH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_de]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_de](
	[PK_sMaD] [nvarchar](50) NOT NULL,
	[FK_iMaDT] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sMaD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_de_cauhoi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_de_cauhoi](
	[PK_iMaD_CH] [int] IDENTITY(1,1) NOT NULL,
	[FK_sMaD] [nvarchar](50) NULL,
	[FK_iMaCH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaD_CH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_dotthi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dotthi](
	[PK_sMaDT] [nvarchar](50) NOT NULL,
	[FK_sMaMon] [nvarchar](50) NULL,
	[iNam] [int] NULL,
	[iKi] [int] NULL,
	[iSoCau] [int] NOT NULL,
	[iThoiGian] [int] NOT NULL,
	[dNgayBD] [datetime] NULL,
	[dNgayKT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sMaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_taikhoan]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_taikhoan](
	[PK_sMaTK] [nvarchar](50) NOT NULL,
	[sPassword] [nvarchar](50) NOT NULL,
	[sTen] [nvarchar](50) NULL,
	[sLop] [nvarchar](50) NULL,
	[FK_iMaQ] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sMaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'01d9877680b8b03583ccfd71fcf256e4', N'Giải tích 1')
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'05b35307951d54887ea4894c0f5f5900', N'Tin học đại cương')
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'2a9499a5e8ccbdcf09b78c517f04004d', N'Lập trình hướng sự kiện')
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'2badb80aa07dcf1e7806a5a651a44bfb', N'Lập trình cơ sở')
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'fe92be2d33dcde406a35099f96fa5b2a', N'Giải tích 2')
SET IDENTITY_INSERT [dbo].[dm_quyen] ON 

INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (1, N'admin')
INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (2, N'Giảng viên')
INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (3, N'Sinh viên')
SET IDENTITY_INSERT [dbo].[dm_quyen] OFF
SET IDENTITY_INSERT [dbo].[tbl_bailam] ON 

INSERT [dbo].[tbl_bailam] ([PK_iMaBL], [FK_iMaD], [FK_sMaSV], [dThoiGianBD]) VALUES (6, N'2021_2_1', N'sinhvien', CAST(N'2021-03-31T09:13:30.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_bailam] OFF
SET IDENTITY_INSERT [dbo].[tbl_cauhoi] ON 

INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (11, N'Hệ thống nhớ của máy tính bao gồm:', N'05b35307951d54887ea4894c0f5f5900')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (12, N'Bộ nhớ RAM và ROM là bộ nhớ gì?', N'05b35307951d54887ea4894c0f5f5900')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (13, N'Phát biểu nà o sau đây là sai:', N'05b35307951d54887ea4894c0f5f5900')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (14, N'Dữ liệu là gì?', N'05b35307951d54887ea4894c0f5f5900')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (15, N'Bit là gì?', N'05b35307951d54887ea4894c0f5f5900')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (16, N'Hex là hệ đếm:', N'05b35307951d54887ea4894c0f5f5900')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (17, N'Các thà nh phần: bộ nhớ chính, bộ xử lý trung ương, bộ phận nhập xuất, các oại hệ điều hành là ', N'05b35307951d54887ea4894c0f5f5900')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (18, N'Danh sách các mục chọn trong thực đơn gọi là ', N'05b35307951d54887ea4894c0f5f5900')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (19, N'Hộp điều khiển việc phóng to, thu nhỏ, đóng cửa sổ gọi là :', N'05b35307951d54887ea4894c0f5f5900')
SET IDENTITY_INSERT [dbo].[tbl_cauhoi] OFF
SET IDENTITY_INSERT [dbo].[tbl_dapan] ON 

INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (41, 1, N'Bộ nhớ trong, bộ nhớ ngoài', 1, 11)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (42, 2, N'cache, bộ nhớ ngoài', 0, 11)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (43, 3, N'Bộ nhớ ngoài, rom', 0, 11)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (44, 4, N'đĩa quang, bộ nhớ trong', 0, 11)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (45, 1, N' Secondary memory', 0, 12)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (46, 2, N'Receive memory', 0, 12)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (47, 3, N'Primary memory', 1, 12)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (48, 4, N'Random access memory', 0, 12)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (49, 1, N'Đơn vị điều khiển (Control Unit) chứa CPU, điều khiển tất cả các hoạt động của máy.', 0, 13)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (50, 2, N'CPU là bộ nhớ xử lý trung ương, thực hiện việc xử lý thông tin lưu trữ trong bộ nhớ.', 0, 13)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (51, 3, N' ALU là đơn vị số học và luận lý và các thanh ghi cũ ng nằm trong CPUd. ', 0, 13)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (52, 4, N'Memory Cell là tập hợp các ô nhớ', 1, 13)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (53, 1, N'Là các số liệu hoặc là tà i liệu cho trước chưa được xử lý.', 0, 14)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (54, 2, N'Là khái niệm có thể được phát sinh, lưu trữ , tìm kiếm, sao chép, biến đổi…', 0, 14)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (55, 3, N' Là các thông tin được thể hiện dưới nhiều dạng khác nhau.', 0, 14)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (56, 4, N'Tất cả đều đúng.', 1, 14)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (57, 1, N'Là đơn vị nhỏ nhất của thông tin được sử dụng trong máy tính', 0, 15)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (58, 2, N'là một phần tử nhỏ mang một trong 2 giá trị 0 và 1', 0, 15)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (59, 3, N'Là một đơn vị đo thông tin', 0, 15)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (60, 4, N'Tất cả đều đúng.', 1, 15)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (61, 1, N'hệ nhị phân', 0, 16)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (62, 2, N'hệ bát phân', 0, 16)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (63, 3, N'Hệ thập phân', 0, 16)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (64, 4, N'hệ thập lục phân', 1, 16)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (65, 1, N'Phần cứng ', 1, 17)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (66, 2, N'Phần mềm', 0, 17)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (67, 3, N'Thiết bị lưu trữ ', 0, 17)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (68, 4, N'Tất cả đều sai', 0, 17)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (69, 1, N'Menu bar', 0, 18)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (70, 2, N'Menu pad', 0, 18)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (71, 3, N'Menu options', 1, 18)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (72, 4, N'Tất cả đều sai', 0, 18)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (73, 1, N'Dialog box', 0, 19)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (74, 2, N'list box', 0, 19)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (75, 3, N'Control box', 1, 19)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (76, 4, N'Text box', 0, 19)
SET IDENTITY_INSERT [dbo].[tbl_dapan] OFF
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_2_1', N'dbfa30fd15c60f5ae0d5eecf83bb90da')
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_3_1', N'4727d1007b3c82b1f95771f434f3dbbf')
SET IDENTITY_INSERT [dbo].[tbl_de_cauhoi] ON 

INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (30, N'2021_2_1', 13)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (31, N'2021_2_1', 17)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (32, N'2021_2_1', 16)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (33, N'2021_2_1', 18)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (34, N'2021_2_1', 11)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (35, N'2021_2_1', 12)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (36, N'2021_2_1', 15)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (37, N'2021_3_1', 15)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (38, N'2021_3_1', 11)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (39, N'2021_3_1', 13)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (40, N'2021_3_1', 14)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (41, N'2021_3_1', 17)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (42, N'2021_3_1', 16)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (43, N'2021_3_1', 18)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (44, N'2021_3_1', 12)
SET IDENTITY_INSERT [dbo].[tbl_de_cauhoi] OFF
INSERT [dbo].[tbl_dotthi] ([PK_sMaDT], [FK_sMaMon], [iNam], [iKi], [iSoCau], [iThoiGian], [dNgayBD], [dNgayKT]) VALUES (N'4727d1007b3c82b1f95771f434f3dbbf', N'05b35307951d54887ea4894c0f5f5900', 2021, 3, 8, 10, CAST(N'2021-03-29T08:59:00.000' AS DateTime), CAST(N'2021-04-01T08:59:00.000' AS DateTime))
INSERT [dbo].[tbl_dotthi] ([PK_sMaDT], [FK_sMaMon], [iNam], [iKi], [iSoCau], [iThoiGian], [dNgayBD], [dNgayKT]) VALUES (N'dbfa30fd15c60f5ae0d5eecf83bb90da', N'05b35307951d54887ea4894c0f5f5900', 2021, 2, 7, 10, CAST(N'2021-03-30T08:59:00.000' AS DateTime), CAST(N'2021-04-05T08:59:00.000' AS DateTime))
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'admin', N'1', N'Admin', NULL, 1)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'giangvien', N'2', N'Giảng viên 1', NULL, 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'giangvien1', N'2', N'Giảng viên 1', NULL, 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'gvm', N'123', N'giảng viên mới 1', NULL, 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'gvm2', N'2', N'giảng viên mới 2', NULL, 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'sinhvien', N'3', N'Sinh viên 1', NULL, 3)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'sinhvien3', N'4', N'sinhvien3', NULL, 2)
ALTER TABLE [dbo].[tbl_bailam]  WITH CHECK ADD FOREIGN KEY([FK_iMaD])
REFERENCES [dbo].[tbl_de] ([PK_sMaD])
GO
ALTER TABLE [dbo].[tbl_bailam]  WITH CHECK ADD FOREIGN KEY([FK_sMaSV])
REFERENCES [dbo].[tbl_taikhoan] ([PK_sMaTK])
GO
ALTER TABLE [dbo].[tbl_cauhoi]  WITH CHECK ADD FOREIGN KEY([FK_sMaMon])
REFERENCES [dbo].[dm_mon] ([PK_sMaMon])
GO
ALTER TABLE [dbo].[tbl_ctbl]  WITH CHECK ADD FOREIGN KEY([FK_iMaDA])
REFERENCES [dbo].[tbl_dapan] ([PK_iMaDA])
GO
ALTER TABLE [dbo].[tbl_ctbl]  WITH CHECK ADD FOREIGN KEY([FK_iMaBL])
REFERENCES [dbo].[tbl_bailam] ([PK_iMaBL])
GO
ALTER TABLE [dbo].[tbl_dapan]  WITH CHECK ADD FOREIGN KEY([FK_sMaCH])
REFERENCES [dbo].[tbl_cauhoi] ([PK_iMaCH])
GO
ALTER TABLE [dbo].[tbl_de]  WITH CHECK ADD FOREIGN KEY([FK_iMaDT])
REFERENCES [dbo].[tbl_dotthi] ([PK_sMaDT])
GO
ALTER TABLE [dbo].[tbl_de_cauhoi]  WITH CHECK ADD FOREIGN KEY([FK_iMaCH])
REFERENCES [dbo].[tbl_cauhoi] ([PK_iMaCH])
GO
ALTER TABLE [dbo].[tbl_de_cauhoi]  WITH CHECK ADD FOREIGN KEY([FK_sMaD])
REFERENCES [dbo].[tbl_de] ([PK_sMaD])
GO
ALTER TABLE [dbo].[tbl_dotthi]  WITH CHECK ADD FOREIGN KEY([FK_sMaMon])
REFERENCES [dbo].[dm_mon] ([PK_sMaMon])
GO
ALTER TABLE [dbo].[tbl_taikhoan]  WITH CHECK ADD FOREIGN KEY([FK_iMaQ])
REFERENCES [dbo].[dm_quyen] ([PK_iMaQ])
GO
/****** Object:  StoredProcedure [dbo].[sp_add_de]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_add_de] @pk nvarchar(50), @fk nvarchar(50)
as
begin
	insert into tbl_de(PK_sMaD,FK_iMaDT) values(@pk, @fk)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_de_cauhoi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_add_de_cauhoi] @mad nvarchar(50), @mach int
as
begin
	insert into tbl_de_cauhoi(FK_sMaD, FK_iMaCH) values(@mad, @mach)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_dt]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_add_dt] @pk nvarchar(50), @ki int, @nbd datetime, @nkt datetime, @mm nvarchar(50), @sc int, @tg int
as
begin
	if not exists (select * from tbl_dotthi where PK_sMaDT = @pk)
	begin
		insert into tbl_dotthi(PK_sMaDT, iKi, dNgayBD, dNgayKT, FK_sMaMon, iSoCau, iThoiGian) values(@pk, @ki, @nbd, @nkt, @mm, @sc, @tg)
	end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_add_gv]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_add_gv] @pk nvarchar(50), @ten nvarchar(50), @pw nvarchar(50), @q int
as
begin
	if not exists (select * from tbl_taikhoan where PK_sMaTK = @pk)
	begin
		insert into tbl_taikhoan(PK_sMaTK,sTen,sPassword,FK_iMaQ) values(@pk, @ten, @pw, @q)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_mon]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_add_mon] @pk nvarchar(50), @ten nvarchar(50)
as
begin
	if not exists (select * from dm_mon where PK_sMaMon = @pk)
	begin
		insert into dm_mon(PK_sMaMon,sTenMon) values(@pk, @ten)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_checkBai]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_checkBai] @mabai nvarchar(50)
as
begin
	select * from tbl_ctbl
	where FK_iMaBL = @mabai
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_chitietbai]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_chitietbai] @mabai nvarchar(50)
as
begin
	select * from tbl_dapan
	left join tbl_ctbl on
	PK_iMaDA = FK_iMaDA
	where FK_iMaBL = @mabai or FK_iMaBL is null
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_account]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_get_account] @un nvarchar(50), @pw nvarchar(50)
as
begin
	select * from tbl_taikhoan as tk inner join dm_quyen as q on tk.FK_iMaQ = q.PK_iMaQ
	where PK_sMaTK = @un and sPassword = @pw
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_baithi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_baithi] (@masv nvarchar(50), @dotthi nvarchar(50))
as
begin
	select tbl_bailam.*,tbl_dotthi.iThoiGian,PK_sMaD from tbl_bailam
	inner join tbl_de on FK_iMaD = PK_sMaD
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where FK_sMaSV = @masv
	and FK_iMaDT = @dotthi
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_cauhoi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_cauhoi] (@dotthi nvarchar(50))
as
begin
	select PK_iMaCH,sCauHoi,PK_sMaD from tbl_cauhoi
	inner join tbl_de_cauhoi on PK_iMaCH = FK_iMaCH
	inner join tbl_de on FK_sMaD = PK_sMaD
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where PK_sMaDT = @dotthi
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_damon]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_damon] @mamon nvarchar(50)
as
begin
	select tbl_dapan.* from tbl_dapan
	inner join tbl_cauhoi on FK_sMaCH = PK_iMaCH
	where FK_sMaMon = @mamon
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_dapan]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_dapan] @de nvarchar(50)
as
begin
	select da.* from tbl_dapan as da
	inner join tbl_cauhoi as ch on ch.PK_iMaCH = da.FK_sMaCH
	inner join tbl_de_cauhoi as dch on dch.FK_iMaCH = ch.PK_iMaCH
	where FK_sMaD = @de
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_dotthi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_dotthi](@nam int, @ki int)
as
begin
	select * from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where iNam = @nam
	and iKi = @ki
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_lastcau]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_lastcau] @mamon nvarchar(50)
as
begin
	select top (1)* from tbl_cauhoi order by PK_iMaCH desc
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_listCau]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_listCau] @mamon nvarchar(50)
as
begin
	select * from tbl_cauhoi
	where FK_sMaMon = @mamon
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_listmon]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_listmon]
as
begin
	select * from dm_mon
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_namthi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_namthi](@nam int)
as
begin
	select PK_sMaMon,sTenMon,tbl_dotthi.* from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where tbl_dotthi.iNam = @nam
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_rande]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_rande] (@dotthi nvarchar(50))
as
begin
	select top 1 tbl_de.*,tbl_dotthi.iThoiGian from tbl_de
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where FK_iMaDT = @dotthi
	order by newid()
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_lambai]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_lambai] @made nvarchar(50),@masv nvarchar(50),@tgbd datetime
as
begin
	INSERT INTO tbl_bailam
           (FK_iMaD
           ,FK_sMaSV
           ,dThoiGianBD)
     VALUES
           (@made,@masv,@tgbd)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_luubailam]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_luubailam] @tbl_ctbl [dbo].[tbl_ctbl] readonly
as
begin
	insert into tbl_ctbl select FK_iMaDA,FK_iMaBL from @tbl_ctbl
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_luudapan_ch]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_luudapan_ch] @tbl_dapan tbl_dapan readonly
as
begin
	insert into tbl_dapan select iSTT,sDapAn,iDung,FK_sMaCH from @tbl_dapan
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_set_cauhoi]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_set_cauhoi] @mamon nvarchar(50),@sCauHoi nvarchar(256)
as
begin
	insert into tbl_cauhoi(FK_sMaMon,sCauHoi) values (@mamon,@sCauHoi)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_dt]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_update_dt] @pk nvarchar(50), @ki int, @nbd datetime, @nkt datetime, @mm nvarchar(50), @sc int, @tg int
as
begin
	update tbl_dotthi set iKi = @ki, dNgayBD = @nbd, dNgayKT = @nkt, FK_sMaMon = @mm, iSoCau = @sc, iThoiGian = @tg where PK_sMaDT = @pk
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_gv]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_update_gv] @pk nvarchar(50), @ten nvarchar(50)
as
begin
	update tbl_taikhoan set sTen = @ten where PK_sMaTK = @pk
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_mon]    Script Date: 3/31/2021 9:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_update_mon] @pk nvarchar(50), @ten nvarchar(50), @pk_moi nvarchar(50)
as
begin
	if not exists (select * from dm_mon where PK_sMaMon = @pk_moi)
	begin
		update dm_mon set PK_sMaMon = @pk_moi, sTenMon = @ten where PK_sMaMon = @pk
	end
end
GO
USE [master]
GO
ALTER DATABASE [tntt] SET  READ_WRITE 
GO

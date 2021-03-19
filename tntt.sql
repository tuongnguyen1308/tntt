USE [master]
GO
/****** Object:  Database [tntt]    Script Date: 23/02/2021 15:54:07 ******/
CREATE DATABASE [tntt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tntt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\tntt.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tntt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\tntt_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [tntt] SET AUTO_CREATE_STATISTICS ON 
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
/****** Object:  StoredProcedure [dbo].[sp_get_account]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_get_account] @un nvarchar(50), @pw nvarchar(50)
as
begin
	select * from tbl_taikhoan as tk inner join dm_quyen as q on tk.FK_iMaQ = q.PK_iMaQ
	where sUsername = @un and sPassword = @pw
end
GO
/****** Object:  Table [dbo].[dm_quyen]    Script Date: 23/02/2021 15:54:07 ******/
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
/****** Object:  Table [dbo].[tbl_bailam]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bailam](
	[PK_iMaBL] [int] IDENTITY(1,1) NOT NULL,
	[FK_iMaLT] [int] NULL,
	[FK_iMaD_CH] [int] NULL,
	[iCauTraLoi] [int] NULL,
	[sCauTraLoi] [nvarchar](50) NULL,
	[iSoDiem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_cauhoi]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cauhoi](
	[PK_iMaCH] [int] IDENTITY(1,1) NOT NULL,
	[sCauHoi] [nvarchar](256) NOT NULL,
	[sDapAnA] [nvarchar](256) NOT NULL,
	[sDapAnB] [nvarchar](256) NOT NULL,
	[sDapAnC] [nvarchar](256) NOT NULL,
	[sDapAnD] [nvarchar](256) NOT NULL,
	[iDapAn] [int] NOT NULL,
	[FK_iMaMon] [int] NULL,
	[FK_iMaTK] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_de]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_de](
	[PK_sMaD] [nvarchar](50) NOT NULL,
	[FK_iMaDT] [int] NULL,
	[iSoCau] [int] NOT NULL,
	[iThoiGian] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sMaD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_de_cauhoi]    Script Date: 23/02/2021 15:54:07 ******/
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
/****** Object:  Table [dbo].[tbl_dotthi]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dotthi](
	[PK_iMaDT] [int] NOT NULL,
	[iNam] [int] NULL,
	[iKi] [int] NULL,
	[iTrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_lanthi]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lanthi](
	[PK_iMaLT] [int] IDENTITY(1,1) NOT NULL,
	[FK_sMaSV] [nvarchar](50) NULL,
	[FK_iMaD] [nvarchar](50) NULL,
	[iLanThi] [int] NULL,
	[dThoiGianBD] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaLT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_mon]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_mon](
	[PK_iMaMon] [int] IDENTITY(1,1) NOT NULL,
	[sTenMon] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_monthi]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_monthi](
	[PK_iMaMT] [int] IDENTITY(1,1) NOT NULL,
	[FK_iMaDT] [int] NULL,
	[FK_iMaMon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaMT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_sinhvien]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sinhvien](
	[PK_sMaSV] [nvarchar](50) NOT NULL,
	[sLop] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sMaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_taikhoan]    Script Date: 23/02/2021 15:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_taikhoan](
	[PK_sMaTK] [nvarchar](50) NOT NULL,
	[sUsername] [nvarchar](50) NOT NULL,
	[sPassword] [nvarchar](50) NOT NULL,
	[sTen] [nvarchar](50) NULL,
	[FK_iMaQ] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sMaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[dm_quyen] ON 

INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (1, N'admin')
INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (2, N'Giảng viên')
INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (3, N'Sinh viên')
SET IDENTITY_INSERT [dbo].[dm_quyen] OFF
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sUsername], [sPassword], [sTen], [FK_iMaQ]) VALUES (N'1', N'admin', N'1', N'Admin', 1)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sUsername], [sPassword], [sTen], [FK_iMaQ]) VALUES (N'2', N'giangvien', N'2', N'Giảng viên 1', 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sUsername], [sPassword], [sTen], [FK_iMaQ]) VALUES (N'3', N'sinhvien', N'3', N'Sinh viên 1', 3)
ALTER TABLE [dbo].[tbl_bailam] ADD  DEFAULT ((0)) FOR [iSoDiem]
GO
ALTER TABLE [dbo].[tbl_lanthi] ADD  DEFAULT ((1)) FOR [iLanThi]
GO
ALTER TABLE [dbo].[tbl_bailam]  WITH CHECK ADD FOREIGN KEY([FK_iMaLT])
REFERENCES [dbo].[tbl_lanthi] ([PK_iMaLT])
GO
ALTER TABLE [dbo].[tbl_bailam]  WITH CHECK ADD FOREIGN KEY([FK_iMaD_CH])
REFERENCES [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH])
GO
ALTER TABLE [dbo].[tbl_cauhoi]  WITH CHECK ADD FOREIGN KEY([FK_iMaMon])
REFERENCES [dbo].[tbl_mon] ([PK_iMaMon])
GO
ALTER TABLE [dbo].[tbl_cauhoi]  WITH CHECK ADD FOREIGN KEY([FK_iMaTK])
REFERENCES [dbo].[tbl_taikhoan] ([PK_sMaTK])
GO
ALTER TABLE [dbo].[tbl_de]  WITH CHECK ADD FOREIGN KEY([FK_iMaDT])
REFERENCES [dbo].[tbl_dotthi] ([PK_iMaDT])
GO
ALTER TABLE [dbo].[tbl_de_cauhoi]  WITH CHECK ADD FOREIGN KEY([FK_iMaCH])
REFERENCES [dbo].[tbl_cauhoi] ([PK_iMaCH])
GO
ALTER TABLE [dbo].[tbl_de_cauhoi]  WITH CHECK ADD FOREIGN KEY([FK_sMaD])
REFERENCES [dbo].[tbl_de] ([PK_sMaD])
GO
ALTER TABLE [dbo].[tbl_lanthi]  WITH CHECK ADD FOREIGN KEY([FK_iMaD])
REFERENCES [dbo].[tbl_de] ([PK_sMaD])
GO
ALTER TABLE [dbo].[tbl_lanthi]  WITH CHECK ADD FOREIGN KEY([FK_sMaSV])
REFERENCES [dbo].[tbl_sinhvien] ([PK_sMaSV])
GO
ALTER TABLE [dbo].[tbl_monthi]  WITH CHECK ADD FOREIGN KEY([FK_iMaDT])
REFERENCES [dbo].[tbl_dotthi] ([PK_iMaDT])
GO
ALTER TABLE [dbo].[tbl_monthi]  WITH CHECK ADD FOREIGN KEY([FK_iMaMon])
REFERENCES [dbo].[tbl_mon] ([PK_iMaMon])
GO
ALTER TABLE [dbo].[tbl_sinhvien]  WITH CHECK ADD FOREIGN KEY([PK_sMaSV])
REFERENCES [dbo].[tbl_taikhoan] ([PK_sMaTK])
GO
ALTER TABLE [dbo].[tbl_taikhoan]  WITH CHECK ADD FOREIGN KEY([FK_iMaQ])
REFERENCES [dbo].[dm_quyen] ([PK_iMaQ])
GO
USE [master]
GO
ALTER DATABASE [tntt] SET  READ_WRITE 
GO

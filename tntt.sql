USE [master]
GO
/****** Object:  Database [tntt]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  UserDefinedTableType [dbo].[tbl_ctbl]    Script Date: 30/03/2021 23:24:47 ******/
CREATE TYPE [dbo].[tbl_ctbl] AS TABLE(
	[FK_iMaDA] [int] NULL,
	[FK_iMaBL] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tbl_dapan]    Script Date: 30/03/2021 23:24:47 ******/
CREATE TYPE [dbo].[tbl_dapan] AS TABLE(
	[iSTT] [int] NULL,
	[sDapAn] [nvarchar](256) NULL,
	[iDung] [bit] NULL,
	[FK_sMaCH] [int] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[sp_add_de]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_add_de_cauhoi]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_add_dt]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_add_gv]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_add_mon]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_checkBai]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_chitietbai]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_account]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_baithi]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_cauhoi]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_damon]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_dapan]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_dotthi]    Script Date: 30/03/2021 23:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_dotthi](@nam int, @ki int)
as
begin
	select * from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where YEAR(dNgayBD) = @nam
	and iKi = @ki
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_lastcau]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_listCau]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_listmon]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_namthi]    Script Date: 30/03/2021 23:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_namthi](@nam int)
as
begin
	select PK_sMaMon,sTenMon,tbl_dotthi.* from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where YEAR(tbl_dotthi.dNgayBD) = @nam
end;

GO
/****** Object:  StoredProcedure [dbo].[sp_get_rande]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_lambai]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_luubailam]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_luudapan_ch]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_set_cauhoi]    Script Date: 30/03/2021 23:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_set_cauhoi] @mamon nvarchar(50),@sCauHoi nvarchar(256)
as
begin
	insert into tbl_cauhoi(FK_sMaMon,sCauHoi) values (@mamon,@sCauHoi)
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_update_dt]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_gv]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_mon]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  Table [dbo].[dm_mon]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  Table [dbo].[dm_quyen]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  Table [dbo].[tbl_bailam]    Script Date: 30/03/2021 23:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bailam](
	[PK_iMaBL] [int] IDENTITY(1,1) NOT NULL,
	[FK_iMaD] [nvarchar](50) NULL,
	[FK_sMaSV] [nvarchar](50) NULL,
	[dThoiGianBD] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_cauhoi]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  Table [dbo].[tbl_ctbl]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  Table [dbo].[tbl_dapan]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  Table [dbo].[tbl_de]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  Table [dbo].[tbl_de_cauhoi]    Script Date: 30/03/2021 23:24:47 ******/
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
/****** Object:  Table [dbo].[tbl_dotthi]    Script Date: 30/03/2021 23:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dotthi](
	[PK_sMaDT] [nvarchar](50) NOT NULL,
	[FK_sMaMon] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[tbl_taikhoan]    Script Date: 30/03/2021 23:24:47 ******/
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
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'22f171d308a0a57cc941fab6d050f384', N'Toán rời rạc')
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'417edd07540b6c61cca3321f99fa6998', N'Toán rời rạc 3')
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'699ec3cb787c0d611aca091ae7996172', N'Toán rời rạc 1')
INSERT [dbo].[dm_mon] ([PK_sMaMon], [sTenMon]) VALUES (N'f97df7e751390f11eb1a6971a0e23722', N'Toán rời rạc 2')
SET IDENTITY_INSERT [dbo].[dm_quyen] ON 

INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (1, N'admin')
INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (2, N'Giảng viên')
INSERT [dbo].[dm_quyen] ([PK_iMaQ], [sTenQ]) VALUES (3, N'Sinh viên')
SET IDENTITY_INSERT [dbo].[dm_quyen] OFF
SET IDENTITY_INSERT [dbo].[tbl_cauhoi] ON 

INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (1, N'câu hỏi 1', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (2, N'câu hỏi 2', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (3, N'câu hỏi 3', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (4, N'câu hỏi 4', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (5, N'câu hỏi 5', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (6, N'câu hỏi 6', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (7, N'câu 7', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (8, N'câu 8', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (9, N'câu 9', N'22f171d308a0a57cc941fab6d050f384')
INSERT [dbo].[tbl_cauhoi] ([PK_iMaCH], [sCauHoi], [FK_sMaMon]) VALUES (10, N'câu 10', N'22f171d308a0a57cc941fab6d050f384')
SET IDENTITY_INSERT [dbo].[tbl_cauhoi] OFF
SET IDENTITY_INSERT [dbo].[tbl_dapan] ON 

INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (1, 1, N'da1', 0, 1)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (2, 2, N'da2', 1, 1)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (3, 3, N'da3', 0, 1)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (4, 4, N'da4', 0, 1)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (5, 1, N'da1', 0, 2)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (6, 2, N'da2', 1, 2)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (7, 3, N'da3', 0, 2)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (8, 4, N'da4', 0, 2)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (9, 1, N'da1', 0, 3)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (10, 2, N'da2', 1, 3)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (11, 3, N'da3', 0, 3)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (12, 4, N'da4', 0, 3)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (13, 1, N'da1', 0, 4)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (14, 2, N'da2', 1, 4)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (15, 3, N'da3', 0, 4)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (16, 4, N'da4', 0, 4)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (17, 1, N'da1', 0, 5)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (18, 2, N'da2', 0, 5)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (19, 3, N'da3', 0, 5)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (20, 4, N'da4', 1, 5)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (21, 1, N'da1', 0, 6)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (22, 2, N'da2', 1, 6)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (23, 3, N'da3', 0, 6)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (24, 4, N'da4', 0, 6)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (25, 1, N'da1', 0, 7)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (26, 2, N'da2', 1, 7)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (27, 3, N'da3', 0, 7)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (28, 4, N'da4', 0, 7)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (29, 1, N'da1', 0, 8)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (30, 2, N'da2', 1, 8)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (31, 3, N'da3', 0, 8)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (32, 4, N'da4', 0, 8)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (33, 1, N'da1', 0, 9)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (34, 2, N'da2', 1, 9)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (35, 3, N'da3', 0, 9)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (36, 4, N'da4', 0, 9)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (37, 1, N'da1', 0, 10)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (38, 2, N'da2', 0, 10)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (39, 3, N'da3', 0, 10)
INSERT [dbo].[tbl_dapan] ([PK_iMaDA], [iSTT], [sDapAn], [iDung], [FK_sMaCH]) VALUES (40, 4, N'da4', 1, 10)
SET IDENTITY_INSERT [dbo].[tbl_dapan] OFF
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_2_1', N'eae00ca435b08979b0f1eda8060acee9')
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_3_1', N'6548fd212d197afa0136de766ace0d1a')
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_3_2', N'6548fd212d197afa0136de766ace0d1a')
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_3_3', N'6548fd212d197afa0136de766ace0d1a')
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_3_4', N'6548fd212d197afa0136de766ace0d1a')
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_3_5', N'6548fd212d197afa0136de766ace0d1a')
INSERT [dbo].[tbl_de] ([PK_sMaD], [FK_iMaDT]) VALUES (N'2021_3_6', N'6548fd212d197afa0136de766ace0d1a')
SET IDENTITY_INSERT [dbo].[tbl_de_cauhoi] ON 

INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (1, N'2021_3_6', 6)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (2, N'2021_3_6', 10)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (3, N'2021_3_6', 1)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (4, N'2021_3_6', 5)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (5, N'2021_3_6', 8)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (6, N'2021_3_6', 2)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (7, N'2021_3_6', 4)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (8, N'2021_3_6', 3)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (9, N'2021_3_6', 9)
INSERT [dbo].[tbl_de_cauhoi] ([PK_iMaD_CH], [FK_sMaD], [FK_iMaCH]) VALUES (10, N'2021_3_6', 7)
SET IDENTITY_INSERT [dbo].[tbl_de_cauhoi] OFF
INSERT [dbo].[tbl_dotthi] ([PK_sMaDT], [FK_sMaMon], [iKi], [iSoCau], [iThoiGian], [dNgayBD], [dNgayKT]) VALUES (N'6548fd212d197afa0136de766ace0d1a', N'22f171d308a0a57cc941fab6d050f384', 3, 15, 30, CAST(N'2021-03-24 14:28:00.000' AS DateTime), CAST(N'2021-03-31 14:28:00.000' AS DateTime))
INSERT [dbo].[tbl_dotthi] ([PK_sMaDT], [FK_sMaMon], [iKi], [iSoCau], [iThoiGian], [dNgayBD], [dNgayKT]) VALUES (N'c4a8ec0c631c883eeeba8430c5746a11', N'417edd07540b6c61cca3321f99fa6998', 1, 30, 60, CAST(N'2021-03-19 08:33:00.000' AS DateTime), CAST(N'2021-03-23 08:33:00.000' AS DateTime))
INSERT [dbo].[tbl_dotthi] ([PK_sMaDT], [FK_sMaMon], [iKi], [iSoCau], [iThoiGian], [dNgayBD], [dNgayKT]) VALUES (N'eae00ca435b08979b0f1eda8060acee9', N'699ec3cb787c0d611aca091ae7996172', 2, 15, 30, CAST(N'2021-03-20 16:17:00.000' AS DateTime), CAST(N'2021-03-22 16:17:00.000' AS DateTime))
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'admin', N'1', N'Admin', NULL, 1)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'giangvien', N'2', N'Giảng viên 2', NULL, 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'giangvien1', N'2', N'Giảng viên 1', NULL, 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'gvm', N'123', N'giảng viên mới 1', NULL, 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'gvm2', N'2', N'giảng viên mới 2', NULL, 2)
INSERT [dbo].[tbl_taikhoan] ([PK_sMaTK], [sPassword], [sTen], [sLop], [FK_iMaQ]) VALUES (N'sinhvien', N'3', N'Sinh viên 1', NULL, 3)
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
USE [master]
GO
ALTER DATABASE [tntt] SET  READ_WRITE 
GO

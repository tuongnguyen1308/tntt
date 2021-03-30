CREATE TABLE [dm_quyen] (
  [PK_iMaQ] int PRIMARY KEY IDENTITY(1, 1),
  [sTenQ] nvarchar(50) NOT NULL
)
GO

CREATE TABLE [tbl_taikhoan] (
  [PK_sMaTK] nvarchar(50) PRIMARY KEY,
  [sPassword] nvarchar(50) NOT NULL,
  [sTen] nvarchar(50),
  [sLop] nvarchar(50),
  [FK_iMaQ] int
)
GO

CREATE TABLE [dm_mon] (
  [PK_sMaMon] int PRIMARY KEY IDENTITY(1, 1),
  [sTenMon] nvarchar(50)
)
GO

CREATE TABLE [tbl_dotthi] (
  [PK_sMaDT] nvarchar(50) PRIMARY KEY,
  [FK_sMaMon] nvarchar(50),
  [iNam] int,
  [iKi] int,
  [iSoCau] int NOT NULL,
  [iThoiGian] int NOT NULL,
  [dNgayBD] datetime,
  [dNgayKT] datetime
)
GO

CREATE TABLE [tbl_cauhoi] (
  [PK_iMaCH] int PRIMARY KEY IDENTITY(1, 1),
  [sCauHoi] nvarchar(256) NOT NULL,
  [FK_sMaMon] nvarchar(50)
)
GO

CREATE TABLE [tbl_dapan] (
  [PK_iMaDA] int PRIMARY KEY IDENTITY(1, 1),
  [iSTT] int NOT NULL,
  [sDapAn] nvarchar(256) NOT NULL,
  [iDung] bit,
  [FK_sMaCH] int
)
GO

CREATE TABLE [tbl_de] (
  [PK_sMaD] nvarchar(50) PRIMARY KEY,
  [FK_iMaDT] nvarchar(50)
)
GO

CREATE TABLE [tbl_de_cauhoi] (
  [PK_iMaD_CH] int PRIMARY KEY IDENTITY(1, 1),
  [FK_sMaD] nvarchar(50),
  [FK_iMaCH] int
)
GO

CREATE TABLE [tbl_bailam] (
  [PK_iMaBL] int PRIMARY KEY IDENTITY(1, 1),
  [FK_iMaD] nvarchar(50),
  [FK_sMaSV] nvarchar(50),
  [dThoiGianBD] date
)
GO

CREATE TABLE [tbl_ctbl] (
  [PK_iMaCTBL] int PRIMARY KEY IDENTITY(1, 1),
  [FK_iMaDA] int,
  [FK_iMaBL] int
)
GO

ALTER TABLE [tbl_taikhoan] ADD FOREIGN KEY ([FK_iMaQ]) REFERENCES [dm_quyen] ([PK_iMaQ])
GO

ALTER TABLE [tbl_dotthi] ADD FOREIGN KEY ([FK_sMaMon]) REFERENCES [dm_mon] ([PK_sMaMon])
GO

ALTER TABLE [tbl_cauhoi] ADD FOREIGN KEY ([FK_sMaMon]) REFERENCES [dm_mon] ([PK_sMaMon])
GO

ALTER TABLE [tbl_dapan] ADD FOREIGN KEY ([FK_sMaCH]) REFERENCES [tbl_cauhoi] ([PK_iMaCH])
GO

ALTER TABLE [tbl_de] ADD FOREIGN KEY ([FK_iMaDT]) REFERENCES [tbl_dotthi] ([PK_sMaDT])
GO

ALTER TABLE [tbl_de_cauhoi] ADD FOREIGN KEY ([FK_sMaD]) REFERENCES [tbl_de] ([PK_sMaD])
GO

ALTER TABLE [tbl_de_cauhoi] ADD FOREIGN KEY ([FK_iMaCH]) REFERENCES [tbl_cauhoi] ([PK_iMaCH])
GO

ALTER TABLE [tbl_bailam] ADD FOREIGN KEY ([FK_iMaD]) REFERENCES [tbl_de] ([PK_sMaD])
GO

ALTER TABLE [tbl_bailam] ADD FOREIGN KEY ([FK_sMaSV]) REFERENCES [tbl_taikhoan] ([PK_sMaTK])
GO

ALTER TABLE [tbl_ctbl] ADD FOREIGN KEY ([FK_iMaDA]) REFERENCES [tbl_dapan] ([PK_iMaDA])
GO

ALTER TABLE [tbl_ctbl] ADD FOREIGN KEY ([FK_iMaBL]) REFERENCES [tbl_bailam] ([PK_iMaBL])
GO

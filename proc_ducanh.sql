create proc sp_get_dotthi(@nam int, @ki int)
as
begin
	select * from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where YEAR(dNgayBD) = @nam
	and iKi = @ki
end;
go
create proc sp_get_namthi(@nam int)
as
begin
	select PK_sMaMon,sTenMon,tbl_dotthi.* from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where YEAR(tbl_dotthi.dNgayBD) = @nam
end;
go
create proc sp_get_rande (@dotthi nvarchar(50))
as
begin
	select top 1 tbl_de.*,tbl_dotthi.iThoiGian from tbl_de
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where FK_iMaDT = @dotthi
	order by newid()
end;
go
create proc sp_get_baithi (@masv nvarchar(50), @dotthi nvarchar(50))
as
begin
	select tbl_bailam.*,tbl_dotthi.iThoiGian,PK_sMaD from tbl_bailam
	inner join tbl_de on FK_iMaD = PK_sMaD
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where FK_sMaSV = @masv
	and FK_iMaDT = @dotthi
end;
go
create proc sp_get_cauhoi (@dotthi nvarchar(50))
as
begin
	select PK_iMaCH,sCauHoi,PK_sMaD from tbl_cauhoi
	inner join tbl_de_cauhoi on PK_iMaCH = FK_iMaCH
	inner join tbl_de on FK_sMaD = PK_sMaD
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where PK_sMaDT = @dotthi
end;
go
create proc sp_get_dapan @de nvarchar(50)
as
begin
	select da.* from tbl_dapan as da
	inner join tbl_cauhoi as ch on ch.PK_iMaCH = da.FK_sMaCH
	inner join tbl_de_cauhoi as dch on dch.FK_iMaCH = ch.PK_iMaCH
	where FK_sMaD = @de
end;
go
create proc sp_lambai @made nvarchar(50),@masv nvarchar(50),@tgbd datetime
as
begin
	INSERT INTO tbl_bailam
           (FK_iMaD
           ,FK_sMaSV
           ,dThoiGianBD)
     VALUES
           (@made,@masv,@tgbd)
end
go
create type tbl_ctbl as table(
	FK_iMaDA int null,
	FK_iMaBL int null
)
go
create proc sp_luubailam @tbl_ctbl [dbo].[tbl_ctbl] readonly
as
begin
	insert into tbl_ctbl select FK_iMaDA,FK_iMaBL from @tbl_ctbl
end;
go
create proc sp_chitietbai @mabai nvarchar(50)
as
begin
	select * from tbl_dapan
	left join tbl_ctbl on
	PK_iMaDA = FK_iMaDA
	where FK_iMaBL = @mabai or FK_iMaBL is null
end;
go
create proc sp_checkBai @mabai nvarchar(50)
as
begin
	select * from tbl_ctbl
	where FK_iMaBL = @mabai
end;
go
create proc sp_get_listmon
as
begin
	select * from dm_mon
end;
go
create proc sp_get_listCau @mamon nvarchar(50)
as
begin
	select * from tbl_cauhoi
	where FK_sMaMon = @mamon
end;
go
create proc sp_get_damon @mamon nvarchar(50)
as
begin
	select tbl_dapan.* from tbl_dapan
	inner join tbl_cauhoi on FK_sMaCH = PK_iMaCH
	where FK_sMaMon = @mamon
end;
go
create proc sp_set_cauhoi @mamon nvarchar(50),@sCauHoi nvarchar(256)
as
begin
	insert into tbl_cauhoi(FK_sMaMon,sCauHoi) values (@mamon,@sCauHoi)
end;
go
create proc sp_get_lastcau @mamon nvarchar(50)
as
begin
	select top (1)* from tbl_cauhoi order by PK_iMaCH desc
end;
go
create type tbl_dapan as table
(
	iSTT int,
	sDapAn nvarchar(256),
	iDung bit,
	FK_sMaCH int
);
go
create proc sp_luudapan_ch @tbl_dapan tbl_dapan readonly
as
begin
	insert into tbl_dapan select iSTT,sDapAn,iDung,FK_sMaCH from @tbl_dapan
end;
go
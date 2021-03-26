create proc sp_get_dotthi(@nam int, @ki int)
as
begin
	select * from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where iNam = @nam
	and iKi = @ki
end;
create proc sp_get_namthi(@nam int)
as
begin
	select PK_sMaMon,sTenMon,tbl_dotthi.* from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where tbl_dotthi.iNam = @nam
end;

create proc sp_get_rande (@dotthi nvarchar(50))
as
begin
	select top 1 tbl_de.*,tbl_dotthi.iThoiGian from tbl_de
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where FK_iMaDT = @dotthi
	order by newid()
end;

create proc sp_get_baithi (@masv nvarchar(50), @dotthi nvarchar(50))
as
begin
	select tbl_bailam.*,tbl_dotthi.iThoiGian,PK_sMaD from tbl_bailam
	inner join tbl_de on FK_iMaD = PK_sMaD
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where FK_sMaSV = @masv
	and FK_iMaDT = @dotthi
end;
create proc sp_get_cauhoi (@dotthi nvarchar(50))
as
begin
	select PK_iMaCH,sCauHoi,PK_sMaD from tbl_cauhoi
	inner join tbl_de_cauhoi on PK_iMaCH = FK_iMaCH
	inner join tbl_de on FK_sMaD = PK_sMaD
	inner join tbl_dotthi on FK_iMaDT = PK_sMaDT
	where PK_sMaDT = @dotthi
end;
create proc sp_get_dapan @de nvarchar(50)
as
begin
	select da.* from tbl_dapan as da
	inner join tbl_cauhoi as ch on ch.PK_iMaCH = da.FK_sMaCH
	inner join tbl_de_cauhoi as dch on dch.FK_iMaCH = ch.PK_iMaCH
	where FK_sMaD = @de
end;
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
create type tbl_ctbl as table(
	FK_iMaDA int null,
	FK_iMaBL int null
)
create proc sp_luubailam @tbl_ctbl [dbo].[tbl_ctbl] readonly
as
begin
	insert into tbl_ctbl select FK_iMaDA,FK_iMaBL from @tbl_ctbl
end;

create proc sp_chitietbai @mabai nvarchar(50)
as
begin
	select * from tbl_dapan
	left join tbl_ctbl on
	PK_iMaDA = FK_iMaDA
	where FK_iMaBL = @mabai or FK_iMaBL is null
end;
create proc sp_checkBai @mabai nvarchar(50)
as
begin
	select * from tbl_ctbl
	where FK_iMaBL = @mabai
end;
delete tbl_bailam
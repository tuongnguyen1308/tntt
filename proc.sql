create proc sp_get_dotthi(@nam int, @ki int)
as
begin
	select * from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where iNam = @nam
	and iKi = @ki
end;
alter proc sp_get_namthi(@nam int)
as
begin
	select PK_sMaMon,sTenMon,tbl_dotthi.* from tbl_dotthi
	inner join dm_mon on tbl_dotthi.FK_sMaMon = dm_mon.PK_sMaMon
	where tbl_dotthi.iNam = @nam
end;
exec sp_get_namthi 2021;
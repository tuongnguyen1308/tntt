<%@ Page Title="Quản lý giảng viên" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuanLyGiangVien.aspx.cs" Inherits="tntt.QuanLyGiangVien" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="card multi-card card-md mt-5">
		<div class="card-header">
			Danh sách giảng viên
		</div>
		<div class="card-body">
			<table class="table text-center" width="100%" border="1">
				<thead class="thead-inverse">
					<tr>
						<th width="10%">STT</th>
						<th width="70%">Tên Giảng viên</th>
						<th width="20%">Tác vụ</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Thái Thanh Tùng</td>
							<td>
								<button type="button" name="" class="btn btn-primary">Sửa</button> 
								<button type="button" name="" class="btn btn-danger">Xoá</button>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Trần Tiến Dũng</td>
							<td>
								<button type="button" name="" class="btn btn-primary">Sửa</button> 
								<button type="button" name="" class="btn btn-danger">Xoá</button>
							</td>
						</tr>
					</tbody>
			</table>
		</div>
	</div>
	<div class="card multi-card card-sm mt-3">
		<div class="card-header">
			Thêm giảng viên
		</div>
		<div class="card-body">
			<div class="form-group">
			  <label for="sTen">Tên giảng viên</label>
			  <input type="text" class="form-control" name="sTen" id="sTen" aria-describedby="helpId" placeholder="Tên giảng viên">
			</div>
			<div class="form-group">
			  <label for="sUsername">Tên Tài khoản</label>
			  <input type="text" class="form-control" name="sUsername" id="sUsername" aria-describedby="helpId" placeholder="Tên Tài khoản">
			</div>
			<div class="form-group">
			  <label for="sPassword">Mật khẩu</label>
			  <input type="password" class="form-control" name="sPassword" id="sPassword" aria-describedby="helpId" placeholder="Mật khẩu">
			</div>
			<button type="button" name="btn-save" class="btn btn-primary" btn-lg btn-block">Lưu</button>
		</div>
	</div>

</asp:Content>

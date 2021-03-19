<%@ Page Title="Quản lý bài thi" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuanLyBaiThi.aspx.cs" Inherits="tntt.QuanLyBaiThi" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
	<div class="card card-md mt-5">
		<div class="card-header">
			Danh sách bài thi
		</div>
		<div class="card-body">
			<div class="form-group">
				<label for="sPassword">Chọn đợt thi</label>
				  <select class="form-control form-inline">
					  <option value="value">Đợt 1</option>
					  <option value="value">Đợt 2</option>
				  </select>
			</div>

			<table class="table text-center" width="100%" border="1">
				<thead class="thead-inverse">
					<tr>
						<th width="5%">STT</th>
						<th width="10%">Mã đề</th>
						<th width="20%">Tên sinh viên</th>
						<th width="20%">Số câu trả lời đúng</th>
						<th width="15%">Tác vụ</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>LTWNC.01</td>
							<td>Nguyễn Đình Tưởng</td>
							<td>30/30</td>
							<td>
								<button type="button" name="" class="btn btn-primary">Chi tiết</button> 
								<button type="button" name="" class="btn btn-danger">Xoá</button>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>LTWNC.02</td>
							<td>Phan Mai Mốt</td>
							<td>29/30</td>
							<td>
								<button type="button" name="" class="btn btn-primary">Chi tiết</button> 
								<button type="button" name="" class="btn btn-danger">Xoá</button>
							</td>
						</tr>
					</tbody>
			</table>
		</div>
	</div>

</asp:Content>

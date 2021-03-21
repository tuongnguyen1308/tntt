<%@ Page Title="Quản lý giảng viên" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuanLyGiangVien.aspx.cs" Inherits="tntt.QuanLyGiangVien" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="card multi-card card-lg mt-5">
		<div class="card-header">
			Danh sách giảng viên
		</div>
		<div class="card-body">
            <asp:Literal ID="ltr_error" runat="server"></asp:Literal>
            <asp:GridView ID="gv_list_gv" runat="server" CssClass="table text-center w-100" AutoGenerateColumns="false" OnRowEditing="gv_list_gv_RowEditing" OnRowUpdating="gv_list_gv_RowUpdating" OnRowCancelingEdit="gv_list_gv_RowCancelingEdit">
				<Columns>
					<asp:BoundField DataField="PK_sMaTK" HeaderText="Tên đăng nhập" ReadOnly="true" />
					<asp:BoundField DataField="sTen" HeaderText="Họ tên" />
					<asp:CommandField ShowEditButton="true" EditText="Sửa" UpdateText="Cập nhật" CancelText="Huỷ" />
				</Columns>
            </asp:GridView>
		</div>
	</div>
	<div class="card multi-card card-lg mt-3">
		<div class="card-header">
			Thêm giảng viên
		</div>
		<div class="card-body">
			<div class="form-group">
			  <label for="sTen">Tên giảng viên</label>
                <asp:TextBox ID="tb_tgv" runat="server" CssClass="form-control"></asp:TextBox>
			<asp:RequiredFieldValidator ID="rfv_tgv" ControlToValidate="tb_tgv" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Tên giảng viên không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group">
			  <label for="sUsername">Tên Tài khoản</label>
                <asp:TextBox ID="tb_un" runat="server" CssClass="form-control"></asp:TextBox>
			<asp:RequiredFieldValidator ID="rfv_un" ControlToValidate="tb_un" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Tên tài khoản không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group">
			  <label for="sPassword">Mật khẩu</label>
                <asp:TextBox ID="tb_pw" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
				<asp:RequiredFieldValidator ID="rfv_pw" ControlToValidate="tb_pw" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Mật khẩu không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
			</div>
			<asp:Button ID="btn_add" runat="server" Text="Thêm giảng viên" CssClass="btn btn-primary" OnClick="btn_add_Click" />
		</div>
	</div>

</asp:Content>

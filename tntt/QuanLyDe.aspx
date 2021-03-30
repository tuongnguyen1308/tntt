<%@ Page Title="Quản lý Đề" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuanLyDe.aspx.cs" Inherits="tntt.QuanLyDe" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
	<div class="card card-md mt-5">
		<div class="card-header">
			Danh sách Đề thi
		</div>
		<div class="card-body">
			<div class="form-group text-center">
				<asp:Label runat="server" AssociatedControlID="ddl_dotthi">Đợt thi</asp:Label>
				<asp:DropDownList runat="server" ID="ddl_dotthi" CssClass="form-control mb-1" placeholder="Chọn đợt thi">
				</asp:DropDownList>
				<asp:RequiredFieldValidator ID="rfv_dotthi" ControlToValidate="ddl_dotthi" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Đợt thi không dược để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
                <asp:Button ID="btn_add" runat="server" Text="Tạo Đề tư động" CssClass="btn btn-primary" OnClick="btn_add_Click" />
			</div>
            <asp:Literal ID="ltr_error" runat="server"></asp:Literal>
            <asp:GridView ID="gv_list_dotthi" runat="server" CssClass="table text-center w-100" AutoGenerateColumns="false">
				<Columns>
					<asp:BoundField DataField="dNgayBD" HeaderText="Ngày bắt đầu" />
					<asp:BoundField DataField="dNgayKT" HeaderText="Ngày Kết thúc" />
					<asp:BoundField DataField="PK_sMaD" HeaderText="Mã đề" />
				</Columns>
            </asp:GridView>
		</div>
	</div>

</asp:Content>

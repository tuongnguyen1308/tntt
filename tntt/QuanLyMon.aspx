<%@ Page Title="Quản lý Môn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuanLyMon.aspx.cs" Inherits="tntt.QuanLyMon" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
	<div class="card card-sm mt-5">
		<div class="card-header">
			Danh sách Môn
		</div>
		<div class="card-body">
			
			<div class="form-group text-center">
                <asp:TextBox ID="tb_ten" runat="server" CssClass="form-control mb-1" placeholder="Nhận tên môn"></asp:TextBox>
				<asp:RequiredFieldValidator ID="rfv_ten" ControlToValidate="tb_ten" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Tên môn không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
				<asp:Button ID="btn_add" runat="server" Text="Thêm Môn" CssClass="btn btn-primary" OnClick="btn_add_Click" />
			</div>
            <asp:Literal ID="ltr_error" runat="server"></asp:Literal>
            <asp:GridView ID="gv_list_mon" runat="server" CssClass="table text-center w-100" AutoGenerateColumns="false" OnRowEditing="gv_list_mon_RowEditing" OnRowUpdating="gv_list_mon_RowUpdating" OnRowCancelingEdit="gv_list_mon_RowCancelingEdit">
				<Columns>
					<asp:TemplateField Visible="true">
						<ItemTemplate>
							<asp:HiddenField ID="PK_sMaMon" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "PK_sMaMon") %>' />
						</ItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="sTenMon" HeaderText="Tên môn" />
					<asp:CommandField ShowEditButton="true" HeaderText="Tác vụ" EditText="Sửa" UpdateText="Cập nhật" CancelText="Huỷ" />
				</Columns>
            </asp:GridView>
		</div>
	</div>


</asp:Content>

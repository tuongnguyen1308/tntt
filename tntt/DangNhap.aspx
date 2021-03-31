<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="tntt.DangNhap" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card card-sm mt-5">
		<div class="card-header">
			<h2>Đăng nhập</h2>
		</div>
		<div class="card-body">
			<div class="style-input-group">
				<asp:TextBox ID="Username" runat="server" AutoCompleteType="Disabled" Text="admin"></asp:TextBox>
				<span id="span_username"></span>
				<asp:Label ID="lb_username" AssociatedControlID="Username" runat="server">Tên đăng nhập</asp:Label>
			</div>
			<div class="style-input-group">
				<asp:TextBox ID="Password" runat="server" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
				<span id="span_password"></span>
				<asp:Label ID="lb_password" AssociatedControlID="Password" runat="server">Mật khẩu</asp:Label>
			</div>
			<asp:Label ID="lb_logineError" runat="server" CssClass="font-italic text-danger"></asp:Label>
			<asp:RequiredFieldValidator ID="rfv_username" ControlToValidate="Username" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Tên đăng nhập không được để trống!<br />"></asp:RequiredFieldValidator>
			<asp:RequiredFieldValidator ID="rfv_password" ControlToValidate="Password" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Mật khẩu không được để trống!"></asp:RequiredFieldValidator>
		</div>
		<div class="card-footer">
			<button class="btn btn-block btn-primary">Đăng nhập</button>
		</div>
	</div>
    <script>
		//Style cho phần login
        let tb_username = document.getElementById('<% =Username.ClientID %>');
        let tb_password = document.getElementById('<% =Password.ClientID %>');
        let lb_username = document.getElementById('<% =lb_username.ClientID %>');
		let lb_password = document.getElementById('<% =lb_password.ClientID %>');
        let span_username = document.getElementById('span_username');
        let span_password = document.getElementById('span_password');

        if (tb_username.value.length > 0) {
            lb_username.classList.add('input-valid');
            span_username.classList.add('span-valid');
        }
        else {
            lb_username.classList.remove('input-valid');
            span_username.classList.remove('span-valid');
		}

		tb_username.addEventListener("change", function () {
			if (tb_username.value.length > 0) {
				lb_username.classList.add('input-valid');
				span_username.classList.add('span-valid');
			}
			else {
				lb_username.classList.remove('input-valid');
				span_username.classList.remove('span-valid');
			}
		});

        tb_password.addEventListener("change", function () {
            if (tb_password.value.length > 0) {
                lb_password.classList.add('input-valid');
                span_password.classList.add('span-valid');
            }
            else {
                lb_password.classList.remove('input-valid');
                span_password.classList.remove('span-valid');
            }
        });
    </script>
</asp:Content>

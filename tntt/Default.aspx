<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tntt._Default" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="card card-md mt-5">
		<div class="card-header">
			Hệ thống thi trắc nghiệm trực tuyến
		</div>
		<div class="card-body text-center">
			<p>Chào mừng bạn đến với hệ thống thi trắc nghiệm trực tuyến</p>
			<% if (currentUser == null)
                {%>
					<p>Vui lòng đăng nhập để sử dụng các chức năng</p>
                <%}
                else
                {
                    switch (currentUser.maQ)
                    {
                        case 1:
                            %>
                            <a runat="server" href="~/QuanLyGiangVien">Quản lý giảng viên</a><br />
                            <%--<a runat="server" href="~/QuanLyDotThi">Quản lý đợt thi</a>--%>
                            <a runat="server" href="~/QuanLyBaiThi">Quản lý bài thi</a>
                            <%
                            break;
                        case 2:
                            %>
                            <%--<a runat="server" href="~/QuanLyDotThi">Quản lý đợt thi</a>--%>
                            <a runat="server" href="~/QuanLyBaiThi">Quản lý bài thi</a>
                            <%
                            break;
                        case 3:
                            %>
                            <a runat="server" href="~/MonThi">Môn thi</a>
                            <%
                            break;
                        default:
                            break;
                    }
                }
			%>
		</div>
		<% if (currentUser == null)
            {%>
			<div class="card-footer text-center">
				<a href="DangNhap.aspx" class="btn btn-primary">Đăng nhập</a>
			</div>
            <%}
		%>
	</div>

</asp:Content>
<%@ Page Title="Quản lý đợt thi" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuanLyDotThi.aspx.cs" Inherits="tntt.WebForm2" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        
		<div class="col-8 mt-3 pr-1">
            <div class="card">
				<div class="card-header">
					Danh sách đợt thi
				</div>
				<div class="card-body">
					<asp:Literal ID="ltr_error" runat="server"></asp:Literal>
					<asp:GridView ID="gv_list_dt" runat="server" CssClass="table text-center w-100" AutoGenerateColumns="false" OnRowDataBound="gv_list_dt_RowDataBound" OnRowEditing="gv_list_dt_RowEditing" OnRowUpdating="gv_list_dt_RowUpdating" OnRowCancelingEdit="gv_list_dt_RowCancelingEdit">
						<Columns>
							<asp:TemplateField Visible="true">
								<ItemTemplate>
									<asp:HiddenField ID="ngaybd" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "dNgayBD") %>' />
									<asp:HiddenField ID="ngaykt" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "dNgayKT") %>' />
									<asp:HiddenField ID="mamon" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "FK_sMaMon") %>' />
									<asp:HiddenField ID="PK_sMaDT" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "PK_sMaDT") %>' />
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="iKi" HeaderText="Kì thi" />
							<asp:TemplateField InsertVisible="false" HeaderText="Ngày bắt đầu">
								<EditItemTemplate>
									<asp:TextBox ID="dNgayBD" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "dNgayBD") %>' TextMode="DateTimeLocal"></asp:TextBox>
								</EditItemTemplate>
								<ItemTemplate>
                                    <asp:Label ID="lb_ngaybd" runat="server" Text='<%#Bind("dNgayBD") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField InsertVisible="false" HeaderText="Ngày kết thúc">
								<EditItemTemplate>
									<asp:TextBox ID="dNgayKT" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "dNgayKT") %>' TextMode="DateTimeLocal"></asp:TextBox>
								</EditItemTemplate>
								<ItemTemplate>
                                    <asp:Label ID="lb_ngaykt" runat="server" Text='<%#Bind("dNgayKT") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField InsertVisible="false" HeaderText="Môn thi">
								<EditItemTemplate>
									<asp:DropDownList ID="FK_sMaMon" runat="server"></asp:DropDownList>
								</EditItemTemplate>
								<ItemTemplate>
                                    <asp:Label ID="sTenMon" runat="server" Text='<%#Bind("sTenMon") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<%--<asp:BoundField DataField="dNgayBD" HeaderText="Ngày bắt đầu" />--%>
							<%--<asp:BoundField DataField="dNgayKT" HeaderText="Ngày kết thúc" />--%>
							<%--<asp:BoundField DataField="sTenMon" HeaderText="Môn thi" />--%>
							<asp:BoundField DataField="iSoCau" HeaderText="Số câu hỏi" />
							<asp:BoundField DataField="iThoiGian" HeaderText="Thời gian (phút)" />
							<asp:CommandField ShowEditButton="true" HeaderText="Tác vụ" EditText="Sửa" UpdateText="Cập nhật" CancelText="Huỷ" />
						</Columns>
					</asp:GridView>
					<%--<asp:SqlDataSource ID="list_mon"
						SelectCommand="select * from tbl_dotthi inner join dm_mon on FK_sMaMon = PK_sMaMon order by dNgayBD desc, iKi desc"
						DataSourceMode="DataSet"
						ProviderName="System.Data.SqlClient"
						ConnectionString="Data Source=DESKTOP-8SHMVDR\SQLEXPRESS;Initial Catalog=tntt;Integrated Security=True"
						runat="server" />--%>
				</div>

            </div>
		</div>
		<div class="col-4 mt-3">
            <div class="card">
				<div class="card-header">
					Thêm đợt thi
				</div>
				<div class="card-body">
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="tb_ki">Kì thi</asp:Label>
						<asp:TextBox ID="tb_ki" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfv_ki" ControlToValidate="tb_ki" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Kì thi không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
					</div>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="tb_nbd">Ngày bắt đầu</asp:Label>
						<asp:TextBox ID="tb_nbd" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfv_nbd" ControlToValidate="tb_nbd" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Ngày bắt đầu không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
					</div>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="tb_nkt">Ngày kết thúc</asp:Label>
						<asp:TextBox ID="tb_nkt" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfv_nkt" ControlToValidate="tb_nkt" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Ngày kết thúc không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
					</div>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="ddl_mon">Môn thi</asp:Label>
						<asp:DropDownList runat="server" ID="ddl_mon" CssClass="form-control" placeholder="Chọn môn">
						</asp:DropDownList>
						<asp:RequiredFieldValidator ID="rfv_mon" ControlToValidate="ddl_mon" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Ngày kết thúc không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
					</div>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="tb_sch">Số câu hỏi</asp:Label>
						<asp:TextBox ID="tb_sch" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfv_sch" ControlToValidate="tb_sch" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Số câu hỏi không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
					</div>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="tb_tg">Thời gian làm bài</asp:Label>
						<asp:TextBox ID="tb_tg" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
						<asp:RequiredFieldValidator ID="rfv_tg" ControlToValidate="tb_tg" runat="server" Display="Dynamic" CssClass="font-italic text-danger" ErrorMessage="Thời gian làm bài không được để trống!<br />" ValidationGroup="group_add"></asp:RequiredFieldValidator>
					</div>
					<asp:Button ID="btn_add" runat="server" Text="Thêm đợt thi" CssClass="btn btn-primary" OnClick="btn_add_Click" />
				</div>
            </div>
		</div>

    </div>

</asp:Content>

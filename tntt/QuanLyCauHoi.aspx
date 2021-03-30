<%@ Page Title="Danh sách câu hỏi" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuanLyCauHoi.aspx.cs" Inherits="tntt.QuanLyCauHoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <div class="card-header">
            Quản lý câu hỏi
        </div>
        <div class="card-body">
            <div class="row">
                <div class="form-group col-md-3">
                    <label>Môn:</label>
                    <select class="form-control" name="mon">
                    <%= listMon%>
                    </select>
                </div>
            </div>
            <asp:Button Text="Tìm kiếm" runat="server" ValidationGroup="group_filter" CssClass="btn btn-green"/>
        </div>
    </div>
    <% if (dsCauHoi != null){%>
    <div class="row mt-1">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Thêm câu hỏi
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label>Câu hỏi:</label>
                        <asp:TextBox runat="server" id="add_cau" CssClass="form-control" ValidationGroup="add_cau"/>
                        <asp:RequiredFieldValidator ErrorMessage="Vui lòng điền câu hỏi" Display="None" CssClass="text-danger" ControlToValidate="add_cau" runat="server" ValidationGroup="add_cau" />
                    </div>
                    <div class="form-group">
                        <label>Đáp án 1:</label>
                        <asp:TextBox runat="server" id="cau1" CssClass="form-control" ValidationGroup="add_cau"/>
                        <asp:CheckBox Text="Là đáp án đúng" runat="server" id="dapan1" ValidationGroup="add_cau"/>
                    </div>
                    <div class="form-group">
                        <label>Đáp án 2:</label>
                        <asp:TextBox runat="server" id="cau2" CssClass="form-control" ValidationGroup="add_cau"/>
                        <asp:CheckBox Text="Là đáp án đúng" runat="server" id="dapan2" ValidationGroup="add_cau"/>
                    </div>
                    <div class="form-group">
                        <label>Đáp án 3:</label>
                        <asp:TextBox runat="server" id="cau3" CssClass="form-control" ValidationGroup="add_cau"/>
                        <asp:CheckBox Text="Là đáp án đúng" runat="server" id="dapan3" ValidationGroup="add_cau"/>
                    </div>
                    <div class="form-group">
                        <label>Đáp án 4:</label>
                        <asp:TextBox runat="server" id="cau4" CssClass="form-control" ValidationGroup="add_cau"/>
                        <asp:CheckBox Text="Là đáp án đúng" runat="server" id="dapan4" ValidationGroup="add_cau"/>
                    </div>
                    <asp:ValidationSummary ID="VS1" runat="server" DisplayMode="List" ValidationGroup="add_cau" CssClass="text-danger"/>
                    <asp:Button Text="Thêm câu hỏi" runat="server" CssClass="btn btn-green" ValidationGroup="add_cau" />
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Sửa câu hỏi
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label>Câu hỏi:</label>
                        <asp:TextBox runat="server" id="TextBox1" CssClass="form-control" ValidationGroup="fix_cau"/>
                        <asp:RequiredFieldValidator ErrorMessage="Vui lòng điền câu hỏi" Display="None" CssClass="text-danger" ControlToValidate="TextBox1" runat="server" ValidationGroup="fix_cau" />
                    </div>
                    <div class="form-group">
                        <label>Đáp án 1:</label>
                        <asp:TextBox runat="server" id="TextBox2" CssClass="form-control" ValidationGroup="fix_cau"/>
                        <asp:CheckBox Text="Là đáp án đúng" runat="server" id="CheckBox1" ValidationGroup="fix_cau"/>
                    </div>
                    <div class="form-group">
                        <label>Đáp án 2:</label>
                        <asp:TextBox runat="server" id="TextBox3" CssClass="form-control" ValidationGroup="fix_cau"/>
                        <asp:CheckBox Text="Là đáp án đúng" runat="server" id="CheckBox2" ValidationGroup="fix_cau"/>
                    </div>
                    <div class="form-group">
                        <label>Đáp án 3:</label>
                        <asp:TextBox runat="server" id="TextBox4" CssClass="form-control" ValidationGroup="fix_cau"/>
                        <asp:CheckBox Text="Là đáp án đúng" runat="server" id="CheckBox3" ValidationGroup="fix_cau"/>
                    </div>
                    <div class="form-group">
                        <label>Đáp án 4:</label>
                        <asp:TextBox runat="server" id="TextBox5" CssClass="form-control" ValidationGroup="fix_cau"/>
                        <asp:CheckBox Text="Là đáp án đúng" runat="server" id="CheckBox4" ValidationGroup="fix_cau"/>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" ValidationGroup="fix_cau" CssClass="text-danger"/>
                    <asp:Button Text="Sửa câu hỏi" runat="server" CssClass="btn btn-yellow" ValidationGroup="fix_cau" />
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Danh sách câu hỏi
                </div>
                <div class="card-body">
                    <table class="table" width="100%" border="1">
                        <tr>
                            <th width="10px;">STT</th>
                            <th>Câu hỏi</th>
                            <th width="10px;">Tác vụ</th>
                        </tr>
                        <tr>
                        <%int i = 1; %>
                        <%foreach (System.Data.DataRow dr in dsCauHoi.Rows){%>
                            <td><%= i++%></td>
                            <td>
                                <details>
                                    <summary><%=dr["sCauHoi"]%></summary>
                                    <%foreach (System.Data.DataRow dr2 in dsDapAn.Rows){%>
                                        <%if(Equals(dr2["FK_sMaCH"],dr["PK_iMaCH"])){%>
                                            <%if((bool)dr2["iDung"]){%>
                                                <p class="bg-success"><%=dr2["sDapAn"]%></p>
                                            <%}else{%>
                                                <p><%=dr2["sDapAn"]%></p>
                                            <%}%>
                                        <%}%>
                                    <%}%>
                                </details>
                            </td>
                            <td>
                                <button class="btn btn-yellow" value='<%=dr["PK_iMaCH"]%>'>Sửa</button>
                                <button class="btn btn-red" value='<%=dr["PK_iMaCH"]%>'>Xoá</button>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>

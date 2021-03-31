<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ketqua.aspx.cs" Inherits="tntt.Ketqua" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">
                    Mã đề thi: <% Response.Write(Made); %>
                </div>
                <div class="card-body">
                    <%int i = 1; %>
                    <%int total_score=0; %>
                    <%foreach (System.Data.DataRow row in dsCauHoi.Rows){ %>
                    <table class="table" width="100%">
                        <thead>
                            <tr>
                                <th id='<% Response.Write(row["PK_iMaCH"]);%>'>Câu <% Response.Write(i++);%>:<%Response.Write(row["sCauHoi"].ToString()); %> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%foreach (System.Data.DataRow daRow in dsDapAn.Rows){ %>
                                <%if(Equals(daRow["FK_sMaCH"],row["PK_iMaCh"])){%>
                                    <tr>
                                        <td>
                                            <% if (Equals(daRow["FK_iMaDA"],daRow["PK_iMaDA"])){%>
                                                <%if(Equals(daRow["iDung"],true)){%>
                                                <div class="bg-success p-1"><% Response.Write(daRow["sDapAn"].ToString());%></div>
                                                <%total_score++;%>
                                                <%}else{%>
                                                <div class="bg-danger p-1"><% Response.Write(daRow["sDapAn"].ToString());%></div>
                                                <%}%>
                                            <%}else{%>
                                                <% if (Equals(daRow["FK_iMaDA"],daRow["PK_iMaDA"])){%>
                                                    <div class="bg-success p-1"><% Response.Write(daRow["sDapAn"].ToString());%></div>
                                                <%}else{%>
                                                    <div class="p-1"><% Response.Write(daRow["sDapAn"].ToString());%></div>
                                                <%}%>
                                            <%}%>
                                        </td>
                                    </tr>
                                <%}%>
                            <%}%>
                        </tbody>
                    </table>
                    <%} %>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card" style="position: sticky; top: 0;">
                <div class="card-header">
                    Danh sách câu hỏi
                </div>
                <div class="card-body">
                    <table border="1" width="100%">
                        <% i = 1; %>
                        <tr>
                            <% foreach (System.Data.DataRow row in dsCauHoi.Rows){%>
                            <td>
                                <a href='#<% Response.Write(row["PK_iMaCh"]);%>'><% = i++ %> </a>
                            </td>
                            <% if(i%5 == 0){%></tr><tr><%}%>
                        <%}%>
                            </tr>
                    </table>
                </div>
                <div class="card-footer">
                    <p><b>Tổng điểm:</b> <%Response.Write(total_score);%></p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

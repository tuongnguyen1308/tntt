<%@ Page Title="Làm bài" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LamBai.aspx.cs" Inherits="tntt.LamBai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <div class="card multi-card card-md text-left" style="min-width: 50%;">
			<div class="card-header">
				Mã đề thi: <% Response.Write(Made); %>
			</div>
			<div class="card-body">
				<%int i = 1; %>
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
										<label class="custom-control-label">
											<input required class="custom-control-input" name='<%Response.Write(row["PK_iMaCH"]);%>' type="radio" value='<%Response.Write(daRow["PK_iMaDA"]);%>'> <% Response.Write(daRow["sDapAn"]);%>
										</label>
									</td>
								</tr>
							<%}%>
						<%}%>
					</tbody>
				</table>
				<%} %>
				<button type="submit" name="nopbai" class="btn btn-primary" value='<%Response.Write(Mabai);%>'>Nộp bài</button> 
			</div>
		</div>
		<div class="card multi-card card-sm" style="position: sticky; top: 0;">
			<div class="card-header">
				Danh sách câu hỏi
			</div>
			<div class="card-body">
				<table border="1">
					<% i = 1; %>
					<tr>
						<% foreach (System.Data.DataRow row in dsCauHoi.Rows){%>
						<td>
							<a href='#<% Response.Write(row["PK_iMaCh"]);%>'><% Response.Write(row["PK_iMaCh"]);%> </a>
						</td>
						<% if(i%5 == 0){%></tr><tr><%}%>
					<%}%>
						</tr>
				</table>
			</div>
		</div>
    </div>
</asp:Content>

<%@ Page Title="Vào thi" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MonThi.aspx.cs" Inherits="tntt.MonThi" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="card mb-1">
        <div class="card-header">
			Lựa chọn đợt thi
        </div>
        <div class="card-body row">
            <div class="form-group col-md-3">
				<label>Năm học:</label>
				<select class="form-control" name="namhoc">
				<%for(int i = (DateTime.Now.Year + 5); i >= 2018 ; i--){ %>
					<%if(i == DateTime.Now.Year) {%>
					<option value="<%Response.Write(i);%>" selected><% Response.Write(i);%></option>
					<%}else {%>
					<option value="<%Response.Write(i);%>"><% Response.Write(i);%></option>
					<%} %>					
				<%} %>
				</select>
            </div>
            <div class="form-group col-md-3">
				<label>Học kỳ:</label>
                <select class="form-control" name="hocky">
                    <option value="1">Kỳ I</option>
                    <option value="2">Kỳ II</option>
                    <option value="3">Kỳ III</option>
                </select>
            </div>
        </div>
        <div class="card-footer text-right">
	        <asp:Button Text="Tìm kiếm" runat="server" CssClass="btn btn-blue"/>
        </div>
	</div>
    <div class="card">
        <div class="card-header">
			Danh sách môn thi
        </div>
        <div class="card-body table-responsive">
            <table class="table table-bordered" width="100%">
				<thead class="text-center">
					<tr>
						<th width="50px">STT</th>
						<th>Môn thi</th>
						<th>Thời gian bắt đầu</th>
						<th>Thời gian kết thúc</th>
						<th>Tác vụ</th>
					</tr>
				</thead>
                <tbody>
					<%Response.Write(dsMon); %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
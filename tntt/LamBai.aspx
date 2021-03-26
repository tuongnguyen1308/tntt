<%@ Page Title="Làm bài" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LamBai.aspx.cs" Inherits="tntt.LamBai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
		<div class="col-md-9">
			<div class="card">
				<div class="card-header">
					Mã đề thi: <% Response.Write(Made); %>
				</div>
				<div class="card-body">
					<form method="post">
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
					<button type="submit" name="nopbai" class="btn btn-primary" value="<%Response.Write(Mabai);%>">Nộp bài</button> 
					<span style="color:red;">* LƯU Ý: CHỌN HẾT ĐÁP ÁN TRƯỚC KHI NỘP BÀI</span>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card" style="position: sticky; top: 0;">
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
    </div>
	<div class="card multi-card" style="position:fixed;bottom:0;right:0">
		<div class="card-body">
			<div>Thời gian làm bài còn <span id="time"></span> phút</div>
		</div>
	</div>
	<script type="text/javascript">
		function startTimer(duration, display) {
			var timer = duration, minutes, seconds;
			setInterval(function () {
				minutes = parseInt(timer / 60, 10);
				seconds = parseInt(timer % 60, 10);

				minutes = minutes < 10 ? "0" + minutes : minutes;
				seconds = seconds < 10 ? "0" + seconds : seconds;
				var timeleft = minutes + ":" + seconds
				display.textContent = timeleft;

				if (--timer < 0) {
					timer = duration;
				}
			}, 1000);
		}

		window.onload = function () {
			var Minutes = 60 * <%Response.Write(tgLamBai);%>,
				display = document.querySelector('#time');
			startTimer(Minutes, display);
		};
	</script>
</asp:Content>

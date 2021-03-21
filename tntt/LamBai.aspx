<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LamBai.aspx.cs" Inherits="tntt.SinhVien.LamBai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <div class="card multi-card card-md text-left">
			<div class="card-header">
				Mã đề thi: LTWNC.01
			</div>
			<div class="card-body">
				<table class="table" width="100%">
					<thead class="thead-inverse">
						<tr>
							<th colspan="2">Câu 1: What is Lorem Ipsum?</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label for="rdo_1"><input name="rd_group1" id="rdo_1" type="radio"> A.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</label></td>
							<td><label for="rdo_2"><input name="rd_group1" id="rdo_2" type="radio"> B.When an unknown printer took a galley of type and scrambled it to make a type specimen book</label></td>
						</tr>
						<tr>
							<td><label for="rdo_3"><input name="rd_group1" id="rdo_3" type="radio"> C.It has survived not only five centuries</label></td>
							<td><label for="rdo_4"><input name="rd_group1" id="rdo_4" type="radio"> D.It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages</label></td>
						</tr>
					</tbody>
				</table>
				<table class="table" width="100%">
					<thead class="thead-inverse">
						<tr>
							<th colspan="2">Câu 2: Why do we use it?</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label for="rdo_5"><input name="rd_group2" id="rdo_5" type="radio"> A.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</label></td>
							<td><label for="rdo_6"><input name="rd_group2" id="rdo_6" type="radio"> B.The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters</label></td>
						</tr>
						<tr>
							<td><label for="rdo_7"><input name="rd_group2" id="rdo_7" type="radio"> C.Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</label></td>
							<td><label for="rdo_8"><input name="rd_group2" id="rdo_8" type="radio"> D.Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)</label></td>
						</tr>
					</tbody>
				</table>
				<button type="button" name="" class="btn btn-primary">Nộp bài</button> 
			</div>
		</div>
		<div class="card multi-card card-sm sticky-top">
			<div class="card-header">
				Tổng quan
			</div>
			<div class="card-body">
				<table class="table" width="100%" border="1">
					<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>
						<tr>
							<td>6</td>
							<td>7</td>
							<td>8</td>
							<td>9</td>
							<td>10</td>
						</tr>
						<tr>
							<td>11</td>
							<td>12</td>
							<td>13</td>
							<td>14</td>
							<td>15</td>
						</tr>
						<tr>
							<td>16</td>
							<td>17</td>
							<td>18</td>
							<td>19</td>
							<td>20</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
    </div>
</asp:Content>

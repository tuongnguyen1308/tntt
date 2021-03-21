using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tntt
{
    public partial class VaoThi : System.Web.UI.Page
    {
        public TaiKhoan currentUser = new TaiKhoan();
        public String dsMon;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            CheckQuyen(currentUser);
            dsMon = LoadMon();
            if (IsPostBack)
            {
                string namhoc = Request.Form["namhoc"];
                string hocky = Request.Form["hocky"];
                GetMon(namhoc,hocky);
            }
        }
        private void CheckQuyen(TaiKhoan currentUser)
        {
            if (currentUser == null)
            {
                Response.Redirect("Default.aspx");
            }
            else if (currentUser.maQ != 3)
            {
                Response.Redirect("Default.aspx");
            }
        }
        private void GetMon(string nam, string ky)
        {
            var lstParameter = new List<KeyValuePair<string, string>>();
            lstParameter.Add(new KeyValuePair<string, string>("@nam", nam));
            lstParameter.Add(new KeyValuePair<string, string>("@ki", ky));
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_dotthi", lstParameter);
            if(dt.Rows.Count > 0)
            {
                string table="";
                int i = 1;
                foreach (DataRow row in dt.Rows)
                {
                    table += "<tr>";
                    table += "<td>" + i++ + "</td>";
                    table += "<td>" + row["sTenMon"] + "</td>";
                    table += "<td>" + row["dNgayBD"] + "</td>";
                    table += "<td>" + row["dNgayKT"] + "</td>";
                    table += "<td> <a href='LamBai'>Vào thi</a></td>";
                    table += "</tr>";
                }
                dsMon = table;
            }
            else
            {
                dsMon = "<tr><td colspan='5' class='text-center'>Không có dữ liệu</td><tr>";
            }
        }
        private string LoadMon()
        {
            string conStr = DataProvider.Instance.conStr;
            DataTable dt = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(conStr))
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("sp_get_namthi", sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nam", SqlDbType.Int).Value = DateTime.Now.Year;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sqlCon.Close();
                sda.Fill(dt);
            }
            string table = "";
            int i = 1;
            foreach (DataRow row in dt.Rows)
            {
                table += "<tr>";
                table += "<td>" + i++ + "</td>";
                table += "<td>" + row["sTenMon"]+"</td>";
                table += "<td>" + row["dNgayBD"]+"</td>";
                table += "<td>" + row["dNgayKT"]+"</td>";
                table += "<td> <a href='LamBai'>Vào thi</a></td>";
                table += "</tr>";
            }
            return table;
        }
    }
}
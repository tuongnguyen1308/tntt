using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace tntt
{
    public partial class QuanLyCauHoi : Page
    {
        public string listMon;
        public string maMon="";
        public DataTable dsCauHoi,dsDapAn;
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            CheckQuyen(currentUser);
            if(IsPostBack){
                maMon = Request.Form["mon"];
                if(add_cau.Text != "")
                {
                    setCauHoi();
                }
                getCauHoi();
                getDapAn();
            }   
            LoadMon();
        }
        private void CheckQuyen(TaiKhoan currentUser)
        {
            if (currentUser == null)
            {
                Response.Redirect("Default.aspx");
            }
            else if (currentUser.maQ != 1 && currentUser.maQ != 2)
            {
                Response.Redirect("Default.aspx");
            }
        }
        public void LoadMon()
        {
            var lstParameter = new List<KeyValuePair<string, string>>();
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_listmon", lstParameter);
            if(dt.Rows.Count > 0)
            {
                string list="";
                foreach (DataRow row in dt.Rows)
                {
                    if(Equals(maMon,row["PK_sMaMon"]))
                        list+= "<option value='"+row["PK_sMaMon"]+ "'selected>" + row["sTenMon"]+"</option>";
                    else
                        list+= "<option value='"+row["PK_sMaMon"]+ "'>" + row["sTenMon"]+"</option>";
                }
                listMon = list;
            }
        }
        public void getCauHoi()
        {
            var lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@mamon",maMon),
            };
            dsCauHoi = DataProvider.Instance.ExecuteQuery("sp_get_listCau",lstParameter);
        }
        public void getDapAn()
        {
            var lstParameter = new List<KeyValuePair<string,string>>
            {
                new KeyValuePair<string, string>("@mamon",maMon)
            };
            dsDapAn = DataProvider.Instance.ExecuteQuery("sp_get_damon",lstParameter);
        }
        public void setCauHoi()
        {
            var lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@mamon",maMon),
                new KeyValuePair<string, string>("@sCauHoi",add_cau.Text)
            };
            DataProvider.Instance.ExecuteQuery("sp_set_cauhoi", lstParameter);
            lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@mamon",maMon)
            };
            var maCau = DataProvider.Instance.ExecuteQuery("sp_get_lastcau", lstParameter).Rows[0]["PK_iMaCH"].ToString();
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("iSTT"));
            dt.Columns.Add(new DataColumn("sDapAn"));
            dt.Columns.Add(new DataColumn("iDung"));
            dt.Columns.Add(new DataColumn("FK_sMaCH"));
            for(int i = 1;i <= 4; i++)
            {
                string dapan = Request.Form["ctl00$MainContent$cau" + i];
                string cau = Request.Form["ctl00$MainContent$dapan" + i];
                if (Equals(Request.Form["ctl00$MainContent$dapan" + i],"on"))
                    dt.Rows.Add(i, dapan, 1, maCau);
                else
                    dt.Rows.Add(i, dapan, 0, maCau);
            }
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(DataProvider.Instance.conStr);
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("sp_luudapan_ch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tbl_dapan", dt);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tntt
{
    public partial class LamBai : Page
    {
        public string Made;
        public string MaDot;
        public string Mabai;
        public string dotthi;
        public DataTable dsCauHoi = new DataTable();
        public DataTable dsDapAn = new DataTable();
        public TaiKhoan currentUser = new TaiKhoan();
        public double tgLamBai;
        string startTime;
        public int TimeLeft;
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            if(currentUser == null || currentUser.maQ != 3)
                Response.Redirect("Default");
            dotthi = Request.QueryString.Get("dotthi").ToString();
            if (GetBaiLam() == 0)GetRandDe();
            if(GetKQBai()) Response.Redirect("Ketqua?mabai="+Mabai+"&dotthi="+dotthi);
            GetCauHoi();
            GetDapAn();
            TimeLeft = (int)Convert.ToDateTime(startTime).AddMinutes(tgLamBai).Subtract(DateTime.Now).TotalSeconds;
            if (IsPostBack)
            {
                LuuBaiLam();
            }
        }

        private int GetBaiLam()
        {
            var lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@masv", currentUser.username),
                new KeyValuePair<string, string>("@dotthi", dotthi)
            };
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_baithi",lstParameter);
            if(dt.Rows.Count > 0)
                foreach(DataRow dr in dt.Rows){
                    Made = dr["PK_sMaD"].ToString();
                    Mabai = dr["PK_iMaBL"].ToString();
                    startTime = dr["dThoiGianBD"].ToString();
                    tgLamBai = (int)dr["iThoiGian"];
                }
            return dt.Rows.Count;
        }

        private void GetCauHoi()
        {
            var lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@dotthi", dotthi)
            };
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_cauhoi", lstParameter);
            dsCauHoi = dt;
        }
        
        private void GetDapAn()
        {
            var lstParameter = new List<KeyValuePair<string,string>>
            {
                new KeyValuePair<string, string>("@de",Made)
            };
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_dapan",lstParameter);
            dsDapAn = dt;
        }

        private void GetRandDe()
        {
            var lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@dotthi", dotthi)
            };
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_rande", lstParameter);
            foreach(DataRow row  in dt.Rows)
            {
                Made = row["PK_sMaD"].ToString();
                tgLamBai = (int)row["iThoiGian"];
            };
            lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@made",Made),
                new KeyValuePair<string, string>("@masv",currentUser.username),
                new KeyValuePair<string, string>("@tgbd",DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            };
            DataProvider.Instance.ExecuteQuery("sp_lambai",lstParameter);
            GetBaiLam();
        }
        private bool GetKQBai()
        {
            var lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@mabai",Mabai),
            };
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_checkBai", lstParameter);
            if(dt.Rows.Count > 0) return true;
            return false;
        }
        protected void LuuBaiLam()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("FK_iMaDA"));
            dt.Columns.Add(new DataColumn("FK_iMaBL"));
            foreach (DataRow row in dsCauHoi.Rows)
            {
                if (!string.IsNullOrEmpty(Request.Form[row["PK_iMaCH"].ToString()]))
                    dt.Rows.Add(Request.Form[row["PK_iMaCH"].ToString()].ToString(), Mabai);
            }
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(DataProvider.Instance.conStr);
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("sp_luubailam", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tbl_ctbl", dt);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Ketqua?mabai=" + Mabai + "&dotthi=" + dotthi);
        }

        // protected void Timer1_Tick(object sender, EventArgs e)
        // {
        //     if (TimeLeft > 0)
        //     {
        //         if (SecondLeft > 0)
        //         {
        //             SecondLeft = SecondLeft - 1;
        //         }
        //         else
        //         {
        //             SecondLeft = 60;
        //             TimeLeft = TimeLeft - 1;
        //         }
        //     }
        //     else
        //     {
        //         LuuBaiLam();
        //     }
        //     Label2.Text = "  " + TimeLeft + ":" + SecondLeft;
        // }
    }
}
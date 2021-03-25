using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tntt
{
    public partial class Ketqua : System.Web.UI.Page
    {
        public string Made;
        public string Mabai;
        public string dotthi;
        public DataTable dsCauHoi = new DataTable();
        public DataTable dsDapAn = new DataTable();
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            if(currentUser == null || currentUser.maQ != 3)
                Response.Redirect("Default");
            dotthi = Request.QueryString.Get("dotthi").ToString();
            GetBaiLam();
            GetCauHoi();
        }
        private void GetBaiLam()
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
                }
            lstParameter = new List<KeyValuePair<string,string>>
            {
                new KeyValuePair<string, string>("@mabai",Mabai)
            };
            dsDapAn = DataProvider.Instance.ExecuteQuery("sp_chitietbai",lstParameter);
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
    }
}
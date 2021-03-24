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
        public string dotthi;
        public DataTable dsCauHoi = new DataTable();
        public DataTable dsDapAn = new DataTable();
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            if(currentUser == null)
            {
                Response.Redirect("Default");
            }
            else if(currentUser.maQ != 3)
            {
                Response.Redirect("Default");
            }
            dotthi = Request.QueryString.Get("dotthi");
            if (GetBaiLam() > 0)
            {
                GetDe();
            }
            else
            {
                GetRandDe();
            }
            GetCauHoi();
            GetDapAn();
        }

        private int GetBaiLam()
        {
            string dotthi = Request.QueryString.Get("dotthi");
            var lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@masv", currentUser.username),
                new KeyValuePair<string, string>("@dotthi", dotthi)
            };
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_baithi",lstParameter);
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
                MaDot = row["FK_iMaDT"].ToString();
            };
            lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@made",Made),
                new KeyValuePair<string, string>("@masv",currentUser.username),
                new KeyValuePair<string, string>("@tgbd",DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"))
            };
            DataProvider.Instance.ExecuteQuery("sp_lambai",lstParameter);
        }
        private void GetDe()
        {
            var lstParameter = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("@masv",currentUser.username),
                new KeyValuePair<string, string>("@dotthi",dotthi)
            };
            DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_desv", lstParameter);
            foreach(DataRow row in dt.Rows)
            {
                Made = row["PK_sMaD"].ToString();
            }
        }
    }
}
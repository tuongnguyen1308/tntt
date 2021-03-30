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
    public partial class QuanLyDe : System.Web.UI.Page
    {
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            CheckQuyen(currentUser);
            if (!Page.IsPostBack)
            {
                LoadAllDe();
                LoadAllDotThi();
            }
        }

        private void LoadAllDe()
        {
            try
            {
                DataTable dt = DataProvider.Instance.GetView("tbl_de inner join tbl_dotthi on FK_iMaDT = PK_sMaDT order by PK_sMaD desc");
                gv_list_dotthi.DataSource = dt;
                gv_list_dotthi.DataBind();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }

        private void LoadAllDotThi()
        {
            try
            {
                DataTable dt = DataProvider.Instance.GetView("tbl_dotthi order by dNgayBD desc");
                foreach (DataRow item in dt.Rows)
                {
                    item["FK_sMaMon"] = item["dNgayBD"].ToString() + " - " + item["dNgayKT"].ToString();
                }
                ddl_dotthi.DataSource = dt;
                ddl_dotthi.DataValueField = "PK_sMaDT";
                ddl_dotthi.DataTextField = "FK_sMaMon";
                ddl_dotthi.DataBind();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
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

        protected void btn_add_Click(object sender, EventArgs e)
        {
            string madotthi = ddl_dotthi.SelectedItem.Value;
            string made = "";
            DataTable dt = DataProvider.Instance.GetView("tbl_dotthi where PK_sMaDT = N'" + madotthi + "'");
            DataTable dt_de = DataProvider.Instance.GetView("tbl_de where FK_iMaDT = N'" + madotthi + "'");
            int countDe = dt_de.Rows.Count + 1;

            DataTable list_cauhoi = new DataTable();


            foreach (DataRow item in dt.Rows)
            {
                made = ((DateTime)item["dNgayBD"]).Year.ToString() + "_" + item["iKi"] + "_" + countDe;
                list_cauhoi = DataProvider.Instance.GetView("tbl_cauhoi where FK_sMaMon = N'" + item["FK_sMaMon"] + "' order by NEWID ()", "select top " + item["iSoCau"] + " PK_iMaCH from ");
            }
            try
            {
                var lstParameter = new List<KeyValuePair<string, string>>();
                lstParameter.Add(new KeyValuePair<string, string>("@fk", madotthi));
                lstParameter.Add(new KeyValuePair<string, string>("@pk", made));
                bool flg = DataProvider.Instance.ExecuteQueryNoReturn("sp_add_de", lstParameter);
                if (!flg)
                {
                    ltr_error.Text = "Lỗi: Không thêm được đề!";
                }
                else
                {
                    foreach (DataRow item in list_cauhoi.Rows)
                    {
                        lstParameter = new List<KeyValuePair<string, string>>();
                        lstParameter.Add(new KeyValuePair<string, string>("@mad", made));
                        lstParameter.Add(new KeyValuePair<string, string>("@mach", item["PK_iMaCH"].ToString()));
                        flg = flg && DataProvider.Instance.ExecuteQueryNoReturn("sp_add_de_cauhoi", lstParameter);
                    }
                }
                if (!flg)
                {
                    ltr_error.Text = "Lỗi: Không thêm được câu hỏi cho đề!";
                }
                LoadAllDe();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }
    }
}
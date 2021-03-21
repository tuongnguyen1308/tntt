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
    public partial class QuanLyGiangVien : Page
    {
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            CheckQuyen(currentUser);
            if (!Page.IsPostBack)
            {
                GetAllGV();
            }
        }

        private void GetAllGV()
        {
            try
            {
                DataTable dt = DataProvider.Instance.GetView("tbl_taikhoan where FK_iMaQ = 2");
                gv_list_gv.DataSource = dt;
                gv_list_gv.DataBind();
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
            else if (currentUser.maQ != 1)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void gv_list_gv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ltr_error.Text = string.Empty;
            gv_list_gv.EditIndex = e.NewEditIndex;
            GetAllGV();
        }

        protected void gv_list_gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ltr_error.Text  = string.Empty;
            GridViewRow gvr = (GridViewRow)gv_list_gv.Rows[e.RowIndex];
            string pk   = gvr.Cells[0].Text;
            TextBox tb_ten  = (TextBox)gvr.Cells[1].Controls[0];
            try
            {
                var lstParameter = new List<KeyValuePair<string, string>>();
                lstParameter.Add(new KeyValuePair<string, string>("@pk", pk));
                lstParameter.Add(new KeyValuePair<string, string>("@ten", tb_ten.Text));
                bool flg = DataProvider.Instance.ExecuteQueryNoReturn("sp_update_gv", lstParameter);
                gv_list_gv.EditIndex = -1;
                GetAllGV();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }

        protected void gv_list_gv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_list_gv.EditIndex = -1;
            GetAllGV();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            string pk = tb_un.Text;
            tb_un.Text = string.Empty;
            string ten = tb_tgv.Text;
            tb_tgv.Text = string.Empty;
            string pw = tb_pw.Text;
            try
            {
                var lstParameter = new List<KeyValuePair<string, string>>();
                lstParameter.Add(new KeyValuePair<string, string>("@pk", pk));
                lstParameter.Add(new KeyValuePair<string, string>("@ten", ten));
                lstParameter.Add(new KeyValuePair<string, string>("@pw", pw));
                lstParameter.Add(new KeyValuePair<string, string>("@q", "2"));
                bool flg = DataProvider.Instance.ExecuteQueryNoReturn("sp_add_gv", lstParameter);
                GetAllGV();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }

    }
}
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
    public partial class QuanLyMon : System.Web.UI.Page
    {
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            CheckQuyen(currentUser);
            if (!Page.IsPostBack)
            {
                LoadAllMon();
            }
        }

        private void LoadAllMon()
        {
            try
            {
                DataTable dt = DataProvider.Instance.GetView("dm_mon order by sTenMon");
                gv_list_mon.DataSource = dt;
                gv_list_mon.DataBind();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }

        protected void gv_list_mon_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ltr_error.Text = string.Empty;
            gv_list_mon.EditIndex = e.NewEditIndex;
            LoadAllMon();

        }

        protected void gv_list_mon_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ltr_error.Text = string.Empty;
            GridViewRow gvr = (GridViewRow)gv_list_mon.Rows[e.RowIndex];
            HiddenField tb_pk = (HiddenField)gvr.FindControl("PK_sMaMon");
            TextBox tb_ten = (TextBox)gvr.Cells[1].Controls[0];
            string pk_new = MD5.Encrypt(tb_ten.Text);
            try
            {
                var lstParameter = new List<KeyValuePair<string, string>>();
                lstParameter.Add(new KeyValuePair<string, string>("@pk", tb_pk.Value));
                lstParameter.Add(new KeyValuePair<string, string>("@ten", tb_ten.Text));
                lstParameter.Add(new KeyValuePair<string, string>("@pk_moi", pk_new));
                bool flg = DataProvider.Instance.ExecuteQueryNoReturn("sp_update_mon", lstParameter);
                if (!flg)
                {
                    ltr_error.Text = "Lỗi: Tên môn không đươc trùng nhau!";
                }
                gv_list_mon.EditIndex = -1;
                LoadAllMon();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }

        protected void gv_list_mon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_list_mon.EditIndex = -1;
            LoadAllMon();
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
            string ten = tb_ten.Text;
            tb_ten.Text = string.Empty;
            string pk = MD5.Encrypt(ten);
            try
            {
                var lstParameter = new List<KeyValuePair<string, string>>();
                lstParameter.Add(new KeyValuePair<string, string>("@pk", pk));
                lstParameter.Add(new KeyValuePair<string, string>("@ten", ten));
                bool flg = DataProvider.Instance.ExecuteQueryNoReturn("sp_add_mon", lstParameter);
                if (!flg)
                {
                    ltr_error.Text = "Lỗi: Tên môn không đươc trùng nhau!";
                }
                LoadAllMon();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }
    }
}
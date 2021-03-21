using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tntt
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            CheckQuyen(currentUser);
            if (!Page.IsPostBack)
            {
                LoadAllDT();
                LoadAllMon();
            }
        }

        private void LoadAllDT()
        {
            try
            {
                DataTable dt = DataProvider.Instance.GetView("tbl_dotthi inner join dm_mon on FK_sMaMon = PK_sMaMon order by dNgayBD desc, iKi desc");
                gv_list_dt.DataSource = dt;
                gv_list_dt.DataBind();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }

        private void LoadAllMon()
        {
            try
            {
                DataTable dt = DataProvider.Instance.GetView("dm_mon order by sTenMon");
                ddl_mon.DataSource = dt;
                ddl_mon.DataValueField = "PK_sMaMon";
                ddl_mon.DataTextField = "sTenMon";
                ddl_mon.DataBind();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }

        protected void gv_list_dt_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ltr_error.Text = string.Empty;
            gv_list_dt.EditIndex = e.NewEditIndex;
            LoadAllDT();
            GridViewRow gvr = gv_list_dt.Rows[e.NewEditIndex];
            HiddenField mm = (HiddenField)gvr.FindControl("mamon");
            HiddenField lb_nbd = (HiddenField)gvr.FindControl("ngaybd");
            HiddenField lb_nkt = (HiddenField)gvr.FindControl("ngaykt");
            string ngaybd = lb_nbd.Value;
            string ngaykt = lb_nkt.Value;
            var dt = DateTime.ParseExact(ngaybd, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
            ngaybd = dt.ToString("yyyy-MM-ddThh:mm");
            dt = DateTime.ParseExact(ngaykt, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
            ngaykt = dt.ToString("yyyy-MM-ddThh:mm");

            DropDownList ddl = (DropDownList)gvr.FindControl("FK_sMaMon");
            ddl.DataSource = DataProvider.Instance.GetView("dm_mon order by sTenMon");
            ddl.DataValueField = "PK_sMaMon";
            ddl.DataTextField = "sTenMon";
            ddl.SelectedValue = mm.Value;
            ddl.DataBind();
            TextBox nbd = (TextBox)gvr.FindControl("dNgayBD");
            nbd.Text = ngaybd;
            TextBox nkt = (TextBox)gvr.FindControl("dNgayKT");
            nkt.Text = ngaykt;

        }

        protected void gv_list_dt_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ltr_error.Text = string.Empty;
            GridViewRow gvr = gv_list_dt.Rows[e.RowIndex];
            HiddenField pk = (HiddenField)gvr.FindControl("PK_sMaDT");
            TextBox ki = (TextBox)gvr.Cells[1].Controls[0];
            TextBox tb_nbd = (TextBox)gvr.FindControl("dNgayBD");
            TextBox tb_nkt = (TextBox)gvr.FindControl("dNgayKT");
            DateTime nbd = Convert.ToDateTime(tb_nbd.Text);
            DateTime nkt = Convert.ToDateTime(tb_nkt.Text);
            DropDownList mm = (DropDownList)gvr.FindControl("FK_sMaMon");
            TextBox sc = (TextBox)gvr.Cells[5].Controls[0];
            TextBox tg = (TextBox)gvr.Cells[6].Controls[0];
            try
            {
                var lstParameter = new List<KeyValuePair<string, string>>();
                lstParameter.Add(new KeyValuePair<string, string>("@pk", pk.Value.ToString()));
                lstParameter.Add(new KeyValuePair<string, string>("@ki", ki.Text));
                lstParameter.Add(new KeyValuePair<string, string>("@nbd", nbd.ToString("yyyy-MM-dd HH:mm:ss")));
                lstParameter.Add(new KeyValuePair<string, string>("@nkt", nkt.ToString("yyyy-MM-dd HH:mm:ss")));
                lstParameter.Add(new KeyValuePair<string, string>("@mm", mm.SelectedValue));
                lstParameter.Add(new KeyValuePair<string, string>("@sc", sc.Text));
                lstParameter.Add(new KeyValuePair<string, string>("@tg", tg.Text));
                bool flg = DataProvider.Instance.ExecuteQueryNoReturn("sp_update_dt", lstParameter);
                gv_list_dt.EditIndex = -1;
                LoadAllDT();
            }
            catch (SqlException ex)
            {
                ltr_error.Text = "Lỗi: " + ex.Message;
            }
        }

        protected void gv_list_dt_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_list_dt.EditIndex = -1;
            LoadAllDT();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            string ki = tb_ki.Text;
            tb_ki.Text = string.Empty;
            DateTime nbd = Convert.ToDateTime(tb_nbd.Text);
            DateTime nkt = Convert.ToDateTime(tb_nkt.Text);
            string mm = ddl_mon.SelectedItem.Value;
            string sch = tb_sch.Text;
            string tg = tb_tg.Text;
            string pk = MD5.Encrypt(nbd.ToString("yyyy-MM-dd HH:mm:ss") + nkt.ToString("yyyy-MM-dd HH:mm:ss") + mm);
            try
            {
                var lstParameter = new List<KeyValuePair<string, string>>();
                lstParameter.Add(new KeyValuePair<string, string>("@pk", pk));
                lstParameter.Add(new KeyValuePair<string, string>("@ki", ki));
                lstParameter.Add(new KeyValuePair<string, string>("@nbd", nbd.ToString("yyyy-MM-dd HH:mm:ss")));
                lstParameter.Add(new KeyValuePair<string, string>("@nkt", nkt.ToString("yyyy-MM-dd HH:mm:ss")));
                lstParameter.Add(new KeyValuePair<string, string>("@mm", mm));
                lstParameter.Add(new KeyValuePair<string, string>("@sc", sch));
                lstParameter.Add(new KeyValuePair<string, string>("@tg", tg));
                bool flg = DataProvider.Instance.ExecuteQueryNoReturn("sp_add_dt", lstParameter);
                LoadAllDT();
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

        protected void gv_list_dt_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {
                // Here you will get the Control you need like:
                DropDownList dl = (DropDownList)e.Row.FindControl("ddlPBXTypeNS");
            }
        }

    }
}
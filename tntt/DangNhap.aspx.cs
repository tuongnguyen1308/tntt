using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tntt
{
    public partial class DangNhap : System.Web.UI.Page
    {
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["currentUser"] = new TaiKhoan();
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];

            if (Request.Form.HasKeys())
            {
                string username = Username.Text;
                string password = Password.Text;

                var account = new TaiKhoan();

                var lstParameter = new List<KeyValuePair<string, string>>();
                lstParameter.Add(new KeyValuePair<string, string>("@un", username));
                lstParameter.Add(new KeyValuePair<string, string>("@pw", password));
                DataTable dt = DataProvider.Instance.ExecuteQuery("sp_get_account", lstParameter);
                if (dt.Rows.Count > 0)
                {
                    account = new TaiKhoan(dt.Rows[0]);
                    Session["currentUser"] = account;
                    currentUser = account;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lb_logineError.Text = "Tên tài khoản hoặc mật khẩu không đúng! </br>";
                }
            }
        }

    }
}
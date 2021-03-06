using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tntt
{
    public partial class QuanLyBaiThi : Page
    {
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.currentUser = (TaiKhoan)Session["currentUser"];
            currentUser = (TaiKhoan)Session["currentUser"];
            CheckQuyen(currentUser);
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
    }
}
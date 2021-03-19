using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tntt
{
    public partial class SiteMaster : MasterPage
    {
        public TaiKhoan currentUser = new TaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public TaiKhoan test
        {
            get { return this.currentUser; }
            set { this.currentUser = value; }
        }
    }
}
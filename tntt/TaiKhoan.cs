using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace tntt
{
    public class TaiKhoan
    {
        #region Parameters
        public string ma;
        public string username;
        public string password;
        public string ten;
        public int maQ;
        public string tenQ;

        #endregion
        #region Initializations
        public TaiKhoan() { }
        public TaiKhoan(DataRow row)
        {
            this.ma         = row["PK_sMaTK"].ToString();
            this.username   = row["sUsername"].ToString();
            this.password   = row["sPassword"].ToString();
            this.ten        = row["sTen"].ToString();
            this.maQ        = (int)row["FK_iMaQ"];
            this.tenQ       = row["sTenQ"].ToString();
        }
        #endregion
    }
}
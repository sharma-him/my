using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DaasPortal.DKPlus
{
    public partial class DaaSTopBar_New : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var Email = HttpContext.Current.Session["Email_ID"];
            var AnalyticsEmail = ConfigurationManager.AppSettings["AnalyticsEmail"];
            if (Email != null)
            {
                if (AnalyticsEmail.Contains((string)Email))
                {
                    Analytics.Visible = true;
                }
                else
                {
                    Analytics.Visible = false;
                }
            }

        }
        protected void TopMenu_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Response.Redirect(lnk.CommandName);
        }
    }
}
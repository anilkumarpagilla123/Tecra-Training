using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppVNR
{
    public partial class Student1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedinName"] != null)
                {
                    lbl.Text = "Welcome Back : &nbsp;" + Session["LoggedinName"].ToString() + "&nbsp;Logged In Time:&nbsp;" + Session["LoggedinTime"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void link_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}
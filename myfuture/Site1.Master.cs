using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myfuture
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sessionrole = Session["role"] as string;
                if (string.IsNullOrEmpty(sessionrole))
                {
                    LinkButton2.Visible = true; 
                    LinkButton3.Visible = true;
                   
                    LinkButton1.Visible = false;
                    LinkButton4.Visible = false;
                    LinkButton5.Visible = false;
                 
                }
                else if(sessionrole.Equals("user"))
                {
                    LinkButton1.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton4.Visible = true;

                    LinkButton2.Visible = false;
                    LinkButton3.Visible = false;
                }
            }
            catch(Exception ex)
            {
                Console.Write(ex);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewgoals.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        //logout
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["role"] = "";
            Response.Redirect("homepage.aspx");
        }

        //profile
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}
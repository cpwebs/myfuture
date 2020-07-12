using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace myfuture
{
    
    public partial class viewgoals : System.Web.UI.Page
    {
        public string goal = "";
        public DateTime startDate;
        public DateTime endDate;
        public int difficulty = -1;
        public string type = "";
        
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            string username = Session["username"] as string;
            SqlDataSource2.SelectParameters["user"].DefaultValue = username;
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
           
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        protected void OnSelectedIndexChanged2(object sender, EventArgs e)
        {

            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowIndex == GridView2.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="Select")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());

                goal = GridView1.Rows[index].Cells[1].Text;
                startDate = Convert.ToDateTime(GridView1.Rows[index].Cells[2].Text);
                endDate = Convert.ToDateTime(GridView1.Rows[index].Cells[3].Text);
                difficulty = Convert.ToInt32(GridView1.Rows[index].Cells[4].Text);
                type = GridView1.Rows[index].Cells[5].Text;

                string username = Session["username"] as string;

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO user_tbl(goal,startDate,endDate,difficulty,type,member_id) VALUES (@goal,@startDate,@endDate,@difficulty,@type,@username)", con);

                    cmd.Parameters.AddWithValue("@goal", goal);
                    cmd.Parameters.AddWithValue("@startDate", startDate);
                    cmd.Parameters.AddWithValue("@endDate", endDate);
                    cmd.Parameters.AddWithValue("@difficulty", difficulty);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@username", username);

                    cmd.ExecuteNonQuery();
                    con.Close();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

                GridView2.DataBind();

            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());

                goal = GridView2.Rows[index].Cells[1].Text;
                startDate = Convert.ToDateTime(GridView2.Rows[index].Cells[2].Text);
                endDate = Convert.ToDateTime(GridView2.Rows[index].Cells[3].Text);
                difficulty = Convert.ToInt32(GridView2.Rows[index].Cells[4].Text);
                type = GridView2.Rows[index].Cells[5].Text;

                string username = Session["username"] as string;

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM user_tbl WHERE goal = @goal AND member_id = @username", con);

                    cmd.Parameters.AddWithValue("@goal", goal);
                    cmd.Parameters.AddWithValue("@startDate", startDate);
                    cmd.Parameters.AddWithValue("@endDate", endDate);
                    cmd.Parameters.AddWithValue("@difficulty", difficulty);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@username", username);

                    cmd.ExecuteNonQuery();
                    con.Close();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

                GridView2.DataBind();

            }
        }
    }
}
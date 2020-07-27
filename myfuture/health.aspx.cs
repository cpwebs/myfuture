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
using System.Web.UI.DataVisualization.Charting;

namespace myfuture
{

    public partial class health : System.Web.UI.Page
    {
        public string goal = "";
        public DateTime startDate;
        public DateTime endDate;
        public int difficulty = -1;
        public string type = "";

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }

            string username = Session["username"] as string;
            SqlDataSource2.SelectParameters["user"].DefaultValue = username;
            
        }

        private void ShowData()
        {
            String myConnection = ConfigurationManager.ConnectionStrings["con"].ToString();
            SqlConnection con = new SqlConnection(myConnection);
            String query = "Select sleep from health_tbl";
            SqlCommand cmd = new SqlCommand(query, con);
            DataTable tb = new DataTable();
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                tb.Load(dr, LoadOption.OverwriteChanges);
                con.Close();
            }
            catch { }

            if (tb != null)
            {
                String chart = "";
                chart = "<canvas id=\"line-chart\" width=\"100%\" height=\"80\"></canvas>";
                chart += "<script>";
                chart += "new Chart(document.getElementById(\"line-chart\"), { type: 'bar', data: {labels: ['Day 1','Day 2','Day 3','Day 4','Day 5','Day 6','Day 7'";

                /*
                 *  for (int i = 0; i < 50; i++)
                    chart += i.ToString() + ",";
                    chart = chart.Substring(0, chart.Length - 1);
                 */


                chart += "],datasets: [{ data: [";

                // get data from database and add to chart
                 string value = "";
                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    value += tb.Rows[i]["sleep"].ToString() + ",";
                }
                value = value.Substring(0, value.Length - 1);
                
                chart += value;

                chart += "],label: \"Hours\",borderColor: \"#3e95cd\",fill: true}"; // Chart color
                chart += "]},options: { title: { display: true,text: 'Sleep'}, scales: { yAxes: [{ ticks:{max: 24,   min: 0}}]}}"; // Chart title
                chart += "});";
                chart += "</script>";

                ltChart.Text = chart;
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string dt = Request.Form[dateTextbox.UniqueID];
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Selected Date: " + dt + "');", true);
        }
    }
}
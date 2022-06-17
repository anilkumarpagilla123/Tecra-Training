using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace WebAppVNR
{
    public partial class Editaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDatabyID();
            }
        }

        public void GetDatabyID()
        {
            SqlConnection con = new SqlConnection("Data Source=ANIL-KUMAR-PAGI\\SQLEXPRESS;Initial catalog=db_vnr1;Integrated security=true");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_vnrdate where userid=@userid", con);
                cmd.Parameters.AddWithValue("@Userid", Request.QueryString["UserID"]);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtname.Text = dr[1].ToString();
                    txtemail.Text = dr[2].ToString();
                    txtpwd.Text = dr[3].ToString();
                    txtdob.Text = dr[4].ToString();
                    rdgender.Items.FindByValue(dr[5].ToString()).Selected = true;
                    dddldept.Items.FindByValue(dr[6].ToString()).Selected = true;
                    ddlrole.Items.FindByValue(dr[7].ToString()).Selected = true;
                    ddlstatus.Items.FindByValue(dr[8].ToString()).Selected = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=ANIL-KUMAR-PAGI\\SQLEXPRESS;Initial catalog=db_vnr1;Integrated security=true");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update tbl_vnrdate set name=@name,emailid=@emailid,password=@password,dob=@dob,gender=@gender,department=@department,role=@role,status=@status where userid=@userid", con);
               
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@emailid", txtemail.Text);
                cmd.Parameters.AddWithValue("@password", txtpwd.Text);
                cmd.Parameters.AddWithValue("@dob", txtdob.Text);
                cmd.Parameters.AddWithValue("@gender", rdgender.SelectedValue);
                cmd.Parameters.AddWithValue("@department", dddldept.SelectedValue);
                cmd.Parameters.AddWithValue("@role", ddlrole.SelectedValue);
                cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedValue);
                cmd.Parameters.AddWithValue("@userid", Request.QueryString["Userid"]);
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    Response.Redirect("userdetails.aspx");
                }
                else
                {
                    Response.Write("Something Went Wrong!");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}
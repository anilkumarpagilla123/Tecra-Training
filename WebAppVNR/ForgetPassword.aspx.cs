using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace WebAppVNR
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panlogin.Visible = true;
            Panotp.Visible = false;
            PanelUpdatepwd.Visible = false;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("data Source=ANIL-KUMAR-PAGI\\SQLEXPRESS;initial Catalog=db_vnr1;Integrated Security=true");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select EmailID from tbl_vnrdate where emailid=@emailid", con);
                ViewState["Email"] = txtemail.Text;
                cmd.Parameters.AddWithValue("@EmailID", ViewState["Email"]);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    Random rand = new Random();
                    ViewState["OTP"] = rand.Next(1111, 9999).ToString();
                    bool chk = SendEmail();
                    if (chk == true)
                    {
                        panlogin.Visible = false;
                        Panotp.Visible = true;
                        PanelUpdatepwd.Visible = false;
                    }
                }
                else
                {
                    lblerror.Text = "EmailID Dosnt Exists!";
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

        public bool SendEmail()
        {
            bool check = false;
            try
            {
                MailMessage obj = new MailMessage();
                obj.From = new MailAddress("onlyonemoin@gmail.com");
                obj.To.Add("onlyonemoin@gmail.com");
                obj.IsBodyHtml = true;
                obj.Subject = "OTP for Login";
                obj.Body = "your OTP is:" + ViewState["OTP"];

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("onlyonemoin@gmail.com", "gtxgoiksyrkxpsej");
                smtp.EnableSsl = true;
                smtp.Send(obj);
                check = true;
            }
            catch (Exception)
            {

                throw;
            }
            return check;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtotp.Text))
            {
                panlogin.Visible = false;
                Panotp.Visible = true;
                PanelUpdatepwd.Visible = false;
                lbl.Text = "please Enter OTP";
            }
            if (txtotp.Text.Equals(ViewState["OTP"]))
            {

                panlogin.Visible = false;
                Panotp.Visible = false;
                PanelUpdatepwd.Visible = true;
            }
            else
            {
                panlogin.Visible = false;
                Panotp.Visible = true;
                PanelUpdatepwd.Visible = false;
                lbl.Text = "Otp is Not Correct!";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("data Source=ANIL-KUMAR-PAGI\\SQLEXPRESS;initial Catalog=db_vnr1;Integrated Security=true");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update tbl_vnrdate set password=@password where emailid=@emailid",con);
                cmd.Parameters.AddWithValue("@password",txtnewpassword.Text);
                cmd.Parameters.AddWithValue("@emailid", ViewState["Email"]);
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    Label1.Text = "Something Went Wrong!";
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
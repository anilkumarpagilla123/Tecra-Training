using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Net;
using System.Net.Mail;
namespace WebAppVNR
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panlogin.Visible = true;
            Panotp.Visible = false;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=ANIL-KUMAR-PAGI\\SQLEXPRESS;initial catalog=db_vnr1;Integrated security=true");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_vnrdate where emailid=@emailid and password=@password", con);
                cmd.Parameters.AddWithValue("@emailid", txtemail.Text);
                cmd.Parameters.AddWithValue("@password", FormsAuthentication.HashPasswordForStoringInConfigFile(txtpwd.Text, "SHA1"));
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["Status"].ToString().ToLower() == "true")
                    {
                        if (dr["Role"].ToString() == "Student")
                        {
                            Session["LoggedinName"] = dr["Name"].ToString();
                            Session["LoggedinTime"] = System.DateTime.Now.ToShortTimeString();
                            Random rand = new Random();

                            HttpCookie cookie = new HttpCookie("userInfo");
                            ViewState["OTP"] = rand.Next(1111, 9999).ToString();

                            cookie.Expires = DateTime.Now.AddMinutes(2);
                            Response.Cookies.Add(cookie);

                            bool chk = SendEmail();
                            if (chk == true)
                            {
                                panlogin.Visible = false;
                                Panotp.Visible = true;
                            }

                            //   Response.Redirect("StudentHome.aspx");
                        }
                        else if (dr["Role"].ToString() == "HOD")
                        {
                            Response.Redirect("HODHome.aspx");
                        }
                        else
                        {
                            Response.Redirect("home.aspx");
                        }



                    }
                    else
                    {
                        Response.Write("User is Inactive");
                    }

                }
                else
                {
                    Response.Write("Username or pwd is Invalid!");
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

                HttpCookie reqCookies = Request.Cookies["userInfo"];





                MailMessage obj = new MailMessage();
                obj.From = new MailAddress("onlyonemoin@gmail.com");
                obj.To.Add("anilkumartec1@gmail.com");
                obj.IsBodyHtml = true;
                obj.Subject = "OTP for Login";
                obj.Body = "your OTP is:" + ViewState["OTP"].ToString();

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

            HttpCookie reqCookies1 = Request.Cookies["userInfo"];
            if (String.IsNullOrEmpty(txtotp.Text))
            {
                panlogin.Visible = false;
                Panotp.Visible = true;
                lbl.Text = "please Enter OTP";
            }
            if (txtotp.Text.Equals(ViewState["OTP"].ToString()))
            {
                Response.Redirect("StudentHome.aspx");
            }
            else
            {
                panlogin.Visible = false;
                Panotp.Visible = true;
                lbl.Text = "Otp is Not Correct!";
            }
        }


    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace WebApplication1
{
    public partial class Country : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCountry();
            }
        }


        public void GetCountry()
        {
            SqlConnection con = new SqlConnection("Data Source=ANIL-KUMAR-PAGI\\SQLEXPRESS;initial catalog=db_vnr1;Integrated security=true");
            con.Open();
            SqlCommand cmd = new SqlCommand("select Country,CountryId from Country", con);
            SqlDataReader dr = cmd.ExecuteReader();
            ddlcountry.DataSource = dr;
            ddlcountry.Items.Clear();
            ddlcountry.Items.Add("--Please Select country--");
            ddlcountry.DataTextField = "Country";
            ddlcountry.DataValueField = "CountryId";
            ddlcountry.DataBind();
            con.Close();


        }
        public void GetStatebyCountry()
        {

            SqlConnection con = new SqlConnection("Data Source=ANIL-KUMAR-PAGI\\SQLEXPRESS;initial catalog=db_vnr1;Integrated security=true");
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT StateId , CountryId , State FROM countryState WHERE CountryId ='" + ddlcountry.SelectedValue + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            ddlstates.DataSource = dr;
            ddlstates.Items.Clear();
            ddlstates.Items.Add("--Please Select State--");
            ddlstates.DataValueField = "StateId";
            ddlstates.DataTextField = "State";
            ddlstates.DataBind();
            con.Close();
        }
        public void GetCitybyState()
        {
            SqlConnection con = new SqlConnection("Data Source=ANIL-KUMAR-PAGI\\SQLEXPRESS;initial catalog=db_vnr1;Integrated security=true");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from stateCity where StateId ='" + ddlstates.SelectedValue + "'", con);

            SqlDataReader dr = cmd.ExecuteReader();
            ddlcity.DataSource = dr;
            ddlcity.Items.Clear();
            ddlcity.Items.Add("--Please Select city--");
            ddlcity.DataTextField = "City";
            ddlcity.DataValueField = "CityID";
            ddlcity.DataBind();


        }

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetStatebyCountry();
        }

        protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlstates_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCitybyState();
        }
    }
}
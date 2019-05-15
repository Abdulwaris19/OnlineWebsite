using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Sign_in : System.Web.UI.Page
{
    //SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=Shopping_cart;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Sign_Click(object sender, EventArgs e)
    {
        Customer customer = new Customer(S_EmailTextbox,S_PasswordTextbox,lbl_Sign);
        //con.Open();

        //string sql_Check = "";
        //sql_Check = "Select * from Register_user where Email='" +S_EmailTextbox.Text + "' and _Password='"+S_PasswordTextbox.Text+ "'";
        //SqlCommand command1 = new SqlCommand(sql_Check, con);
        //SqlDataAdapter Sda = new SqlDataAdapter(command1);
        //DataTable dt = new DataTable();

        //Sda.Fill(dt);
        //if (dt.Rows.Count != 0)
        //{
        //    string sql_name = "Select Last_name from Register_user where Email='" + S_EmailTextbox.Text + "'";
        //    SqlCommand cmd_name = new SqlCommand(sql_name,con);
        //    SqlDataReader sdr = cmd_name.ExecuteReader() ;
        //    sdr.Read();
        //    Session["Name"] = sdr[0]; 
        //    Session["Email"] = S_EmailTextbox.Text;
        //    Response.Redirect("index.aspx");
        //}
        //else
        //{
        //    lbl_Sign.Text = "Invalid email or password";

        //}
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    //SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=Shopping_cart;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        _Database Database = new _Database();
        Database.Register_user(FNameTextbox, LNameTextbox, EmailTextbox,AddressTextBox,PhoneTextbox, PasswordTextbox,ConfirmPassTextbox,lbl_Status);

        //con.Open();
        
        //string sql_Check = "";
        
        //sql_Check = "Select * from Register_user where Email='"+EmailTextbox.Text+"'";
        //SqlCommand command1 = new SqlCommand(sql_Check, con);
        //SqlDataAdapter Sda = new SqlDataAdapter(command1);
        //DataTable dt = new DataTable();
       
        //Sda.Fill(dt);
        //    lbl_Status.ForeColor = System.Drawing.Color.Red;
        // if (dt.Rows.Count!=0)
        //{
        //    lbl_Status.Text = "Account creation failed or Account already exist";

        //    FNameTextbox.Text = null;
        //    LNameTextbox.Text = null;
        //    EmailTextbox.Text = null;
        //    PhoneTextbox.Text = null;
        //    PasswordTextbox.Text = null;
        //    ConfirmPassTextbox.Text = null;
        //    con.Close();
        //}
        //else {
        //    string sql_insert = "";
        //    sql_insert = "INSERT INTO Register_user Values('" + FNameTextbox.Text + "','" + LNameTextbox.Text + "','" + EmailTextbox.Text + "'," + Convert.ToInt64(PhoneTextbox.Text) + ",'" + PasswordTextbox.Text + "','" + ConfirmPassTextbox.Text + "')";
        //    SqlCommand command = new SqlCommand(sql_insert, con);
        //    command.ExecuteNonQuery();
        //    command.Dispose();
        //    lbl_Status.ForeColor = System.Drawing.Color.Green;
        //    lbl_Status.Text = "Account created suceesfully";
        //    FNameTextbox.Text = null;
        //    LNameTextbox.Text = null;
        //    EmailTextbox.Text = null;
        //    PhoneTextbox.Text = null;
        //    PasswordTextbox.Text = null;
        //    ConfirmPassTextbox.Text = null;
        //    con.Close();
        //}

    }

    protected void Admin_Checkbox_CheckedChanged(object sender, EventArgs e)
    {
     
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Users : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserRep();
        }

       



        if (FilerCheckBox.Checked == true)
        {
            DateTextBox.Visible = true;
            BtnUFilter.Visible = true;
           
        }
        else
        {
            DateTextBox.Visible = false;
            BtnUFilter.Visible = false;

        }
       Con.Close();
    }

    private void BindUserRep()
    {
        using (SqlCommand cmdUserView = new SqlCommand("Select * from Customer", Con))

        {
            using (SqlDataAdapter SDA_UView = new SqlDataAdapter(cmdUserView))
            {
                DataTable DT_UserView = new DataTable();
                SDA_UView.Fill(DT_UserView);
                RepeaterUTable.DataSource = DT_UserView;
                RepeaterUTable.DataBind();
            }
        }
    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {
    }

    protected void SearchTextBox_TextChanged(object sender, EventArgs e)
    {
     
    }

    protected void Btn_Search_Click(object sender, EventArgs e)
    {
        Con.Open();
        string query_Search = "Select * from Customer where [First Name]='" +USearchTextBox.Text + "'";
        SqlCommand cmd_Search = new SqlCommand(query_Search,Con);
        SqlDataAdapter SDA_UView = new SqlDataAdapter(cmd_Search);
        DataTable DT_UserView = new DataTable();
        SDA_UView.Fill(DT_UserView);
        RepeaterUTable.DataSource = DT_UserView;
        RepeaterUTable.DataBind();
        Con.Close();

    }

    protected void FilerCheckBox_CheckedChanged(object sender, EventArgs e)
    {
       
    }

    protected void BtnUFilter_Click(object sender, EventArgs e)
    {
        if (FilerCheckBox.Checked == true && DateTextBox.Text != "")
        {
            BindUserRep();
            Con.Open();
            string query_FSearch = "Select * from Customer where [Entry_Date]='" + DateTextBox.Text + "'";
            SqlCommand cmd_FSearch = new SqlCommand(query_FSearch, Con);
            SqlDataAdapter SDA_FView = new SqlDataAdapter(cmd_FSearch);
            DataTable DT_FUserView = new DataTable();
            SDA_FView.Fill(DT_FUserView);
            RepeaterUTable.DataSource = DT_FUserView;
            RepeaterUTable.DataBind();
            Con.Close();

        }
        else if (FilerCheckBox.Checked == false)
        {
            BindUserRep();
        }
    }
}
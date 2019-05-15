using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProducts : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRepProView();
        }

        if (FilerCheckBox.Checked == true)
        {
            DateTextBox.Visible = true;
            BtnPfilter.Visible = true;

        }
        else
        {
            DateTextBox.Visible = false;
            BtnPfilter.Visible = false;


        }
    }

    private void BindRepProView()
    {
        using (SqlCommand cmdProView = new SqlCommand("Select * from Product",Con))

        {
            using (SqlDataAdapter SDA_PView = new SqlDataAdapter(cmdProView))
            {
                DataTable DT_ProView = new DataTable();
                SDA_PView.Fill(DT_ProView);
                RepeaterProTable.DataSource = DT_ProView;
                RepeaterProTable.DataBind();
            }
        }
    }

    protected void FilerCheckBox_CheckedChanged(object sender, EventArgs e)
    {
       
        
    }

    protected void BtnProSearch_Click(object sender, EventArgs e)
    {
        Con.Open();
        string query_BSearch = "Select * from Product where [ProductName]='" + ProSearchTextBox.Text + "'";
        SqlCommand cmd_BSearch = new SqlCommand(query_BSearch, Con);
        SqlDataAdapter SDA_BUView = new SqlDataAdapter(cmd_BSearch);
        DataTable DT_BUserView = new DataTable();
        SDA_BUView.Fill(DT_BUserView);
        RepeaterProTable.DataSource = DT_BUserView;
        RepeaterProTable.DataBind();
        Con.Close();
        
    }

    protected void BtnPfilter_Click(object sender, EventArgs e)
    {
        if (FilerCheckBox.Checked == true && DateTextBox.Text != "")
        {

            BindRepProView();
            Con.Open();
            string query_PSearch = "Select * from Product where [ProductRegDate]='" + DateTextBox.Text + "'";
            SqlCommand cmd_PSearch = new SqlCommand(query_PSearch, Con);
            SqlDataAdapter SDA_PView = new SqlDataAdapter(cmd_PSearch);
            DataTable DT_PUserView = new DataTable();
            SDA_PView.Fill(DT_PUserView);
            RepeaterProTable.DataSource = DT_PUserView;
            RepeaterProTable.DataBind();
            Con.Close();

        }
        else { BindRepProView(); }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(Session["Email"]!=null)
        //{
        //    SearchTextBox.Visible = false;
        //    btn_Search.Visible = false;
        //    FilerCheckBox.Visible=false;
           
          
        //}
        //else
        //{

        //}

        if (!IsPostBack)
        {
            BindRepOrderView();
        }

        if (FilerCheckBox.Checked == true)
        {
            StatusTextBox.Visible = true;
            BtnOFilter.Visible = true;

        }
        else
        {
            StatusTextBox.Visible = false;
           BtnOFilter.Visible = false;


        }
    }
    private void BindRepOrderView()
    {
        using (SqlCommand cmdOView = new SqlCommand("Select * from [Order]", Con))

        {
            using (SqlDataAdapter SDA_OView = new SqlDataAdapter(cmdOView))
            {
                DataTable DT_OView = new DataTable();
                SDA_OView.Fill(DT_OView);
                RepeaterOrderTable.DataSource = DT_OView;
                RepeaterOrderTable.DataBind();
            }
        }
    }
    protected void btn_Sign_out_Click(object sender, EventArgs e)
    {
        Session["Email"] = null;
        Session["Name"] = null;
       
        Response.Redirect("Admin.aspx");
    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {
        Con.Open();
        string query_OSearch = "Select * from [Order] where [CustomerName]='" + SearchTextBox.Text + "'";
        SqlCommand cmd_OSearch = new SqlCommand(query_OSearch, Con);
        SqlDataAdapter SDA_OAView = new SqlDataAdapter(cmd_OSearch);
        DataTable DT_OrderView = new DataTable();
        SDA_OAView.Fill(DT_OrderView);
        RepeaterOrderTable.DataSource = DT_OrderView;
        RepeaterOrderTable.DataBind();
        Con.Close();
    }

    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        if (FilerCheckBox.Checked == true && StatusTextBox.Text != "")
        {

            BindRepOrderView();
            Con.Open();
            string query_OSearch = "Select * from [Order] where [OrderStatus]='" + StatusTextBox.Text + "'";
           
            SqlCommand cmd_OSearch = new SqlCommand(query_OSearch, Con);
            SqlDataAdapter SDA_OView = new SqlDataAdapter(cmd_OSearch);
            DataTable DT_OrderOView = new DataTable();
            SDA_OView.Fill(DT_OrderOView);
            RepeaterOrderTable.DataSource = DT_OrderOView;
            RepeaterOrderTable.DataBind();
            Con.Close();

        }
        else { BindRepOrderView(); }
    }

    protected void BtnAOSignout_Click(object sender, EventArgs e)
    {
        AdminClass AdminSignOut = new AdminClass();
        AdminSignOut.ASignOut();
    }
}
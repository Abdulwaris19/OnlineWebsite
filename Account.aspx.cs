using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindAccountRep();
        }
       
        Con.Close();
        Con.Open();
        string Tincome = "";
        Tincome = "Select SUM(OrderPrice) From Account";
        SqlCommand cmd_Tincome = new SqlCommand(Tincome,Con);
        int income= Convert.ToInt32(cmd_Tincome.ExecuteScalar());

        string TPro = "";
        TPro = "Select SUM(ProductPrice) From Product";
        SqlCommand cmd_TPro = new SqlCommand(TPro, Con);
        int ProT = Convert.ToInt32(cmd_TPro.ExecuteScalar());

        TIncomeTextBox.Text = income.ToString();
       int Profit =income-ProT;
        ProPrice.Text =ProT.ToString();
        ProfitTextBox.Text = Profit.ToString();
        Con.Close();
    }
    private void BindAccountRep()
    {
        using (SqlCommand cmdProductView = new SqlCommand(" Select ProductID,ProductPrice,ProductSPrice from Product ", Con))

        {
            using (SqlDataAdapter SDA_AView = new SqlDataAdapter(cmdProductView))
            {
                DataTable DT_ProductView = new DataTable();
                SDA_AView.Fill(DT_ProductView);
                RepeaterPro.DataSource = DT_ProductView;
                RepeaterPro.DataBind();
            }
            
        }
        using (SqlCommand cmdAccountView = new SqlCommand(" Select AccountID,OrderID,OrderPrice,OrderDate from Account ", Con))

        {
            using (SqlDataAdapter SDA_AView = new SqlDataAdapter(cmdAccountView))
            {
                DataTable DT_AccountView = new DataTable();
                SDA_AView.Fill(DT_AccountView);
                RepeaterAccountTable.DataSource = DT_AccountView;
                RepeaterAccountTable.DataBind();
            }
        }
    }

    protected void Btnaccount_Click(object sender, EventArgs e)
    {
     

    }

    protected void BtnAFiter_Click(object sender, EventArgs e)
    {
     
    }
}
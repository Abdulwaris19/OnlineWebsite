using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminOrderView : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Btn_Status_Click(object sender, EventArgs e)
    {
        try {
            Con.Open();
            string sql_Update = "";
            sql_Update = "Update [Order] Set OrderStatus='" + StatusTextBox.Text + "' where OrderID='" + Order_TextBox.Text+"'";
            SqlCommand cmd_update = new SqlCommand(sql_Update, Con);
           
            cmd_update.ExecuteNonQuery();
            cmd_update.Dispose();
            Con.Close();
            Lbl_BodyText.ForeColor = System.Drawing.Color.Green;
            Lbl_BodyText.Text = "Update Successfull";
            //StatusTextBox.Text.T
        }
        catch 
        {
           Lbl_BodyText.ForeColor=System.Drawing.Color.Red;
            Lbl_BodyText.Text = "Update Failed";
        }
    }

    protected void BtnEnter_Click(object sender, EventArgs e)
    {
       

    
        
            Con.Open();
            string CustomerID = Order_TextBox.Text;
            string sql_OrderView = "";
            sql_OrderView = "Select CustomerName,CustomerAddress,CustomerCardNumber,OrderTotalPrice,OrderStatus from [Order] where CustomerID='" + CustomerID + "'";
            SqlCommand commandOview = new SqlCommand(sql_OrderView, Con);
            SqlDataReader SDA_order = commandOview.ExecuteReader();
            SDA_order.Read();
            OrderCustTextBox.Text = SDA_order["CustomerName"].ToString();
            AddressTextBox.Text = SDA_order["CustomerAddress"].ToString();

            CardNumberTextBox.Text = SDA_order["CustomerCardNumber"].ToString();
            AmountTextBox.Text = SDA_order["OrderTotalPrice"].ToString();

            Con.Close();
        
        
        

    }
}
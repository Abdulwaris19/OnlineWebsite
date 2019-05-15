using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_userview : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["CID"]!=null && Session["ProductLength"]!=null)
        {

       
            string CustomerID = Session["CID"].ToString();
          

            Con.Open();
           string sql_FetchLastOID = "";
            sql_FetchLastOID = "select MAX(OrderID) from [Order]";
            SqlCommand FIO = new SqlCommand(sql_FetchLastOID,Con);
            int OrderFID = Convert.ToInt32(FIO.ExecuteScalar());
          
          
            Con.Close();
            Session["FOID"] = OrderFID.ToString();
            string _ProductQuantity=Session["ProductLength"].ToString();
            string sql_OrderView = "";

            Con.Open();
            sql_OrderView = "Select CustomerName,CustomerAddress,CustomerCardNumber,OrderTotalPrice,OrderStatus from [Order] where [Order].OrderID="+OrderFID+" ";
            SqlCommand commandOview = new SqlCommand(sql_OrderView, Con);
            SqlDataReader SDA_order = commandOview.ExecuteReader();
            SDA_order.Read();
            Order_TextBox.Text =OrderFID.ToString();
            OrderCustTextBox.Text = SDA_order["CustomerName"].ToString();
            AddressTextBox.Text = SDA_order["CustomerAddress"].ToString();
            QuantitiyTextBox.Text = _ProductQuantity;
            Session["ProLength"] = QuantitiyTextBox.Text;
            CardNumberTextBox.Text = SDA_order["CustomerCardNumber"].ToString();
           AmountTextBox.Text = SDA_order["OrderTotalPrice"].ToString();
            StatusTextBox.Text = SDA_order["OrderStatus"].ToString();
            Con.Close();


        }
        else
        {
            Response.Redirect("Sign_in.aspx");
        }
    }

    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/index.aspx");
    }

    protected void BtnOrderSignout_Click(object sender, EventArgs e)
    {
        Session["CiEmail"] = null;
        Session["CName"] = null;
        lbl_name.Text = null;
        Response.Redirect("index.aspx");
        HttpCookie CartProducts = Request.Cookies["CartProID"];
        CartProducts.Expires = DateTime.Now.AddDays(-1);
    }
}
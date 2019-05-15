using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payment : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Session["CID"] != null)
        {
            string CustomerID = Session["CID"].ToString();
            Con.Open();

            string sql_COrderView = "";
            sql_COrderView = " Select LastName,Address from Customer where CustomerID='" + CustomerID + "'";
            SqlCommand commanCOview = new SqlCommand(sql_COrderView, Con);
            SqlDataReader SDA_Corder = commanCOview.ExecuteReader();
            SDA_Corder.Read();
            PayName_TextBox.Text = SDA_Corder["LastName"].ToString();
            PayAddressTextBox.Text = SDA_Corder["Address"].ToString();
            Con.Close();
        }
        PayName_TextBox.ReadOnly = true;
        PayAddressTextBox.ReadOnly = true;
        BindPriceData();
        if (Lbl_CartTotal.InnerText == "")
        {

            CartEmptyPay.Visible = true;
            CartEmptyPay.InnerText = "Yor Cart Is Empty Please Buy Our Product";
            visiblebody.Visible = false;
        }
      
        else if(Lbl_CartTotal.InnerText != "" && Session["CID"] != null)
        {
            visiblebody.Visible = true;
            CartEmptyPay.Visible = false;
            Con.Close();
            Con.Open();
            string CustomerID = Session["CID"].ToString();
            string sql_COrderView = "";
            sql_COrderView =" Select LastName,Address from Customer where CustomerID='" + CustomerID + "'";
            SqlCommand commanCOview = new SqlCommand(sql_COrderView, Con);
            SqlDataReader SDA_Corder = commanCOview.ExecuteReader();
            SDA_Corder.Read();
            PayName_TextBox.Text = SDA_Corder["LastName"].ToString();
            PayAddressTextBox.Text = SDA_Corder["Address"].ToString();
            Con.Close();
        }
       

    }

    private void BindPriceData()
    {
        Con.Open();
        if (Request.Cookies["CartProID"] != null)
        {
            if (Request.Cookies["CartProID"] != null)
            {
               
                string CookieProData = Request.Cookies["CartProID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieProData.Split(',');
                if (CookieProData.Length > 0)
                {

                    DataTable DT_CartRep = new DataTable();
                    Int64 CartTotal = 0;
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string ProductID = CookieDataArray[i].ToString().Split('-')[0];
                        using (SqlCommand cmdCRep = new SqlCommand("Select A.ProductName as Name,A.Details,A.ProductSPrice as Price,B.ProductID,B.Name,B.Extension,C.BrandName as Brand from Product A inner join ProductImage B on A.ProductID = B.ProductID inner join Brand C on A.PBrandID = C.BrandID where B.ProductID=" + ProductID + "", Con))
                        {
                            cmdCRep.CommandType = CommandType.Text;
                            using (SqlDataAdapter SDA_Rep = new SqlDataAdapter())
                            {
                                SDA_Rep.SelectCommand = cmdCRep;

                                SDA_Rep.Fill(DT_CartRep);
                                Lbl_CartTotal.InnerText = CartTotal.ToString();
                                Con.Close();
                            }

                        }
                        CartTotal += Convert.ToInt64(DT_CartRep.Rows[i]["Price"]);
                    }

                    PricDetailsDiv.Visible = true;
                    Lbl_CartTotal.InnerText = CartTotal.ToString();
                }
                else if (Request.Cookies["CartProID"] == null)
                {

                    Response.Redirect("~/Product_userview.aspx");

                }
            }

            else if (Request.Cookies["CartProID"] == null)
            {

                Response.Redirect("~/Product_userview.aspx");

            }


        }

    }

    protected void Btn_pay_Click(object sender, EventArgs e)
    {
        if (Lbl_CartTotal.InnerText == "")
        {
            Lbl_Pay.ForeColor = System.Drawing.Color.Red;
            Lbl_Pay.Text = "Please buy our product";
        }
        else if (Session["CID"] != null)
        {
            string CustomerID = Session["CID"].ToString();



            Con.Open();
            string Date = DateTime.Now.ToShortDateString();
            string sql_Payinsert = "";
            sql_Payinsert = "INSERT INTO Payment Values('" + CustomerID + "','" + PayName_TextBox.Text + "','" + PayAddressTextBox.Text + "','" + PayCardTextBox.Text + "'," + Lbl_CartTotal.InnerText + ",'" + Date + "')";
            Session["CustID"] = CustomerID;
            Session["CustomerName"] = PayName_TextBox.Text;
            Session["CustAddress"] = PayAddressTextBox.Text;
            Session["CustCardNumber"] = PayCardTextBox.Text;
            Session["CartTotal"] = Lbl_CartTotal.InnerText;
            SqlCommand command = new SqlCommand(sql_Payinsert, Con);
            command.ExecuteNonQuery();
            command.Dispose();
            Con.Close();
            Lbl_Pay.ForeColor = System.Drawing.Color.Green;
            Lbl_Pay.Text = "Payment Successfull";
            Btn_Order.Visible = true;
            
            Con.Open();
            string sql_paymentId = "Select MAX(PaymentID) from Payment where CustomerID=" + CustomerID + "";

            SqlCommand cmd_name = new SqlCommand(sql_paymentId, Con);
            SqlDataReader sdr = cmd_name.ExecuteReader();
            sdr.Read();

            Session["PaymentId"] = sdr[0];
            Con.Close();

            string PayId = Session["PaymentId"].ToString();
            Con.Open();
            string sql_Order = "";
            sql_Order = "INSERT INTO [Order] Values('" + CustomerID + "','" + PayName_TextBox.Text + "','" + PayAddressTextBox.Text + "','" + PayCardTextBox.Text + "','Received','" + Date + "'," + Lbl_CartTotal.InnerText + ",'" + PayId + "')";
            SqlCommand cmdO = new SqlCommand(sql_Order, Con);
            cmdO.CommandType = CommandType.Text;
            cmdO.ExecuteNonQuery();
            Response.Cookies.Clear();
            //HttpCookie CartProducts = Request.Cookies["CartProID"];
            //CartProducts.Values["CartProPID"] = null;
            //CartProducts.Expires = DateTime.Now.AddDays(-1);
            //Response.Cookies.Add(CartProducts);
            cmdO.Dispose();
            Con.Close();
            Con.Open();
            string sql_LastOID = "";
            sql_LastOID = "select MAX(OrderID) from [Order]";
            SqlCommand FI = new SqlCommand(sql_LastOID, Con);
            int OrderF = Convert.ToInt32(FI.ExecuteScalar());


            Con.Close();
            Session["FetchID"] = OrderF.ToString();
            Con.Open();

            string sql_OrderId = "Select OrderDate,OrderTotalPrice from [Order] where OrderID=" + OrderF + "";
           SqlCommand cmd_FO = new SqlCommand(sql_OrderId, Con);
            SqlDataReader sdrFO = cmd_FO.ExecuteReader();
            sdrFO.Read();
            Session["ODate"] = sdrFO[0];
            Session["OPrice"] = sdrFO[1];
       
     Con.Close();
            if (Session["FetchID"]!= null)
            {
                string OrderID = Session["FetchID"].ToString();
                string OrderPrice = Session["OPrice"].ToString();
                string OrderDate = Session["ODate"].ToString();

                Con.Open();
                string Account = "";
                Account = "Insert INTO Account Values ('" + OrderID + "','" + OrderPrice + "','" + OrderDate + "')";
                SqlCommand cmdAcc = new SqlCommand(Account, Con);
                cmdAcc.CommandType = CommandType.Text;
                cmdAcc.ExecuteNonQuery();
                cmdAcc.Dispose();
                Con.Close();

                HttpCookie CartProducts = Request.Cookies["CartProID"];
                CartProducts.Values["CartProPID"] = null;
                CartProducts.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(CartProducts);
            }
        
        }
        
        else {
            Lbl_Pay.ForeColor = System.Drawing.Color.Red;
            Lbl_Pay.Text = "Please Sign in";
            Btn_Order.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }

    protected void Btn_Order_Click(object sender, EventArgs e)
    {
      
        
            Response.Redirect("~/Order_userview.aspx");
        
    }

    protected void Btn_signout_Payment_Click(object sender, EventArgs e)
    {
       
    }

    protected void BtnPaymentSignOut_Click(object sender, EventArgs e)
    {
        HttpCookie CartProducts = Request.Cookies["CartProID"];
        CartProducts.Values["CartProPID"] = null;
        CartProducts.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(CartProducts);
        Session["CEmail"] = null;
        Session["CName"] = null;
        lbl_name.Text = null;
        Response.Redirect("index.aspx");
     

    }
}
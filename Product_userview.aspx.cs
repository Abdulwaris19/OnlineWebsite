using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product_userview : System.Web.UI.Page
{
  
    protected void Page_Load(object sender,  EventArgs e)
    {
       
       _Database db_ProBind = new _Database();
        if (!IsPostBack)
        {
            db_ProBind.BindProductRepeater(Product_Rep);
       }
        if(Session["Cname"]!=null)
        {
            HSign_in.Visible = false;
            
        }
        else
        {
            HCart.Visible = false;
            HOrder.Visible = false;
            HPayment.Visible = false;
            HSign_in.Visible = true;
            Btn_CSignOut.Visible = false;
        }
    }


    protected void Btn_CSignOut_Click(object sender, EventArgs e)
    {
        HttpCookie CartProducts = Request.Cookies["CartProID"];
        CartProducts.Values["CartProPID"] = null;
        CartProducts.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(CartProducts);
        Session["Cname"] = null;
        Response.Redirect("Product_userview.aspx");
    }
}
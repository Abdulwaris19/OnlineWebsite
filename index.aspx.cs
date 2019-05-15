using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class index : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        Index Home = new Index();
        Home.visiblity(HSign_in, HCart, HOrder, HPayment, Btn_CSignOut, lbl_name);

    }

    protected void btn_signOut_Click(object sender, EventArgs e)
    {
        
    }

    protected void Btn_CSignOut_Click(object sender, EventArgs e)
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
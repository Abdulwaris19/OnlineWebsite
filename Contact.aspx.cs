using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CEmail"] != null)
        {
           
            lbl_name.Text = " Welcome " + Session["CName"].ToString() + "";
            HCart.Visible = true;
            HOrder.Visible = true;
            HPayment.Visible = true;
            btn_Sign_out.Visible = true;
            HSign_in.Visible = false;
        }
        else
        {
            HCart.Visible = false;
            HOrder.Visible = false;
            HPayment.Visible = false;
            btn_Sign_out.Visible = false;
            HSign_in.Visible = true;
        }
    }

    protected void btn_Sign_out_Click(object sender, EventArgs e)
    {
        HttpCookie CartProducts = Request.Cookies["CartProID"];
        CartProducts.Values["CartProPID"] = null;
        CartProducts.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(CartProducts);
        Session["CEmail"] = null;
        Session["CName"] = null;
        lbl_name.Text = null;
        btn_Sign_out.Visible = false;
        Response.Redirect("index.aspx");
       
    }
}
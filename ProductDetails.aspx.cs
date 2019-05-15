using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetails : System.Web.UI.Page
{
    _Database db_ProBind = new _Database();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CName"]!=null)
        {
            if (Request.QueryString["ProductID"] == null)
            {
                Response.Redirect("Product_userview.aspx");
            }
            else {
                if (!IsPostBack)
                {
                    db_ProBind.BindProductImages(RepImage);
                    db_ProBind.BindProductDetials(ProDetailsRep);
                }
            }
        }
        else
        {
            Response.Redirect("~/index.aspx");
        }
    }

    protected void RepImage_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    protected void ProDetailsRep_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    
    protected void Btn_AddCart_Click(object sender, EventArgs e)
    {
        
    }



    protected void Btn_SignOutDetails_Click(object sender, EventArgs e)
    {
        
        {
         
            Session["CEmail"] = null;
            Session["CName"] = null;
            lbl_name.Text = null;
            Response.Redirect("index.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        db_ProBind.Btn_AddCart(Btn_Addcart);
        Response.Redirect("~/Product_userview.aspx");
    }
}
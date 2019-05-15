using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductUserView
/// </summary>
public class ProductUserView
{
    public ProductUserView()
    {
        //
        // TODO: Add constructor logic here
        //
   

   }
    public void SignOut()
    {
        HttpCookie CartProducts = System.Web.HttpContext.Current.Request.Cookies["CartProID"];
        CartProducts.Values["CartProPID"] = null;
        CartProducts.Expires = DateTime.Now.AddDays(-1);
        System.Web.HttpContext.Current.Response.Cookies.Add(CartProducts);
        System.Web.HttpContext.Current.Session["Cname"] = null;
        System.Web.HttpContext.Current.Response.Redirect("Product_userview.aspx");
    }
}
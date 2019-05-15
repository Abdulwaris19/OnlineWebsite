using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Index
/// </summary>
public class Index
{
    public Index()
    {

        //
        // TODO: Add constructor logic here
        //
    }
    public void visiblity(HyperLink Sign, HyperLink Cart, HyperLink Order,HyperLink Payement,Button SignOut,Label HeaderName )
    {
        if (System.Web.HttpContext.Current.Session["CName"]!=null)

        {
           HeaderName.Text = "Welcome " + System.Web.HttpContext.Current.Session["CName"].ToString() + "";
            Sign.Visible = false;
            Cart.Visible = true;
            Order.Visible = true;
            Payement.Visible = true;
            SignOut.Visible = true;
        }

        else if(System.Web.HttpContext.Current.Session["CName"] == null)
   
        {
            HeaderName.Text = "";
            Sign.Visible = true;
            Cart.Visible = false;
            Order.Visible = false;
            Payement.Visible = false;
            SignOut.Visible = false;
        }

    
    }
}
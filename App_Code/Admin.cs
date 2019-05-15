using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Class1
/// </summary>
public class AdminClass
{
    public AdminClass()
    {
            
    }
    public AdminClass(TextBox A_Email, TextBox A_Password, Label Signin)
    {
        _Database Admin = new _Database();
        Admin.Admin_Sign(A_Email, A_Password, Signin);
        //
        // TODO: Add constructor logic here
        //
    }
    public void Admin_visiblity(HyperLink Sign, HyperLink Order, Button SignOut, Label HeaderName,HyperLink Home,HyperLink Product,TextBox Email,TextBox Password,CheckBox Remember,Button Signin,Label BodyName,RequiredFieldValidator REmail,RequiredFieldValidator RPassword,HyperLink Brand,HyperLink Category,HyperLink navbar)
    {
        if (System.Web.HttpContext.Current.Session["AName"] != null && System.Web.HttpContext.Current.Session["AEmail"] != null)
        {
            HeaderName.Text = "Welcome " + System.Web.HttpContext.Current.Session["AName"].ToString() + "";
            
          
            Sign.Visible = false;
            Brand.Visible = true;
            Category.Visible = true;
          
            Order.Visible = true;
            navbar.Visible = true;
            SignOut.Visible = true;
            Home.Visible = true;
            Product.Visible = true;
       
            Email.Visible = false;
            Password.Visible = false;
            Remember.Visible = false;
            Signin.Visible = false;
            BodyName.Text = "";
            REmail.Visible = false;
            RPassword.Visible = false;


        }

        else if (System.Web.HttpContext.Current.Session["AName"] == null && System.Web.HttpContext.Current.Session["AEmail"] == null)

        {
            HeaderName.Text = "";
            navbar.Visible = false;

            Sign.Visible = true;
            Brand.Visible = false;
            Category.Visible = false;

            Order.Visible = false;
           
            SignOut.Visible = false;
            Home.Visible = false;
            Product.Visible = false;
           
            Email.Visible = true;
            Password.Visible = true;
            Remember.Visible = true;
            Signin.Visible = true;
            REmail.Visible = true;
            RPassword.Visible = true;
        }

    }

    public void ASignOut()
    {
        System.Web.HttpContext.Current.Session["AEmail"] = null;
        System.Web.HttpContext.Current.Session["AName"] = null;
        System.Web.HttpContext.Current.Response.Redirect("Admin.aspx");

    }
}


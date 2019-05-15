using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    public Customer(TextBox CEmail,TextBox CPassword,Label CSign )
    {
        _Database Cust = new _Database();
        Cust.Customer_Sign(CEmail,CPassword,CSign);
        //
        // TODO: Add constructor logic here
        //
    }
}
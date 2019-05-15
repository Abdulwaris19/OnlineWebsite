using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConnectionString
/// </summary>
public class ConnectionString
{
    public ConnectionString()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static SqlConnection Connection()
    {
        string Con = System.Configuration.ConfigurationManager.ConnectionStrings[@"Data Source = DESKTOP - HKSTUJA\SQLEXPRESS; Initial Catalog = OnlineShopping; Integrated Security = True"].ConnectionString;
        SqlConnection aconnection = new SqlConnection(Con);
        return aconnection; 
    }
}
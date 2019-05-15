using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{
    public Cart()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void BindPro()
    {
        Con.Open();
        if (System.Web.HttpContext.Current.Request.Cookies["CartProID"] != null)
        {
            if (System.Web.HttpContext.Current.Request.Cookies["CartProID"] != null)
            {

                string CookieProData = System.Web.HttpContext.Current.Request.Cookies["CartProID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieProData.Split(',');
                if (CookieProData.Length > 0)
                {
                    Lbl_CartCount.Text = "My Cart  (Items : " + CookieDataArray.Length + ")";
                    string ProductL = "" + CookieDataArray.Length + "";
                    System.Web.HttpContext.Current.Session["ProductLength"] = ProductL;


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
                                Lbl_CartTotal.Text = CartTotal.ToString();
                                Con.Close();
                            }

                        }
                        CartTotal += Convert.ToInt64(DT_CartRep.Rows[i]["Price"]);
                    }

                    RepCartProducts.DataSource = DT_CartRep;
                    RepCartProducts.DataBind();
                    PricDetailsDiv.Visible = true;
                    Btn_BuyNow.Visible = true;
                    Lbl_CartTotal.Text = CartTotal.ToString();
                }
                else
                {
                    Lbl_CartCount.Text = "Your Cart is Empty";


                }
            }

            else
            {
                Lbl_CartCount.Text = "Your Cart is Empty";

            }


        }
    }
}
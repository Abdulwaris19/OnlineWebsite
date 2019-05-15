using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["CName"] != null)
        {
            if (!IsPostBack)
            {
                BindProducts();
                if (Request.Cookies["CartProID"] == null)
                {
                    Btn_BuyNow.Visible = false;
                    Lbl_CartCount.Text = "Your Cart is Empty";
                    PricDetailsDiv.Visible = false;
                }
                else
                {
                    Btn_BuyNow.Visible = true;
                }

            }
        }
        else
        {
            Response.Redirect("~/index.aspx");
        }
    }

    

    private void BindProducts()
    {

        Con.Open();
        if (Request.Cookies["CartProID"] != null)
        {
            if (Request.Cookies["CartProID"] != null)
            {
                
                string CookieProData = Request.Cookies["CartProID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieProData.Split(',');
                if (CookieProData.Length > 0)
                {
                    Lbl_CartCount.Text = "My Cart  (Items : " + CookieDataArray.Length + ")";
                    string ProductL = ""+CookieDataArray.Length+"";
                    Session["ProductLength"] =ProductL;
                   

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
    protected void RepCartProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        

    }


    protected void btn_RemoveItem_Click(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string CookiePID = Request.Cookies["CartProID"].Value.Split('=')[1];

        Button btn = (Button)(sender);
        string PIDSize = btn.CommandArgument;
        List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        CookiePIDList.Remove(PIDSize);
        string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
        if (CookiePIDUpdated == "")
        {
            HttpCookie CartProducts = Request.Cookies["CartProID"];
            CartProducts.Values["CartProPID"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);
        }
        else
        {
            Session["CartList"] = CookiePIDUpdated;
            HttpCookie CartProducts = Request.Cookies["CartProID"];
            CartProducts.Values["CartProID"] = CookiePIDUpdated;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);
        }
        Response.Redirect("~/Cart.aspx");
    }


    protected void Btn_BuyNow_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Payment.aspx");
    }

    protected void BtnCartSignout_Click(object sender, EventArgs e)
    {
        
    }

    protected void BtnCartSignout_Click1(object sender, EventArgs e)
    {
       
    }

    protected void BtnCartSignOut_Click(object sender, EventArgs e)
    {
        
        if (Request.Cookies["CartProID"] != null)
        {
            HttpCookie CartProducts = Request.Cookies["CartProID"];
            CartProducts.Values["CartProPID"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);
            Session["CEmail"] = null;
            Session["CName"] = null;
            lbl_name.Text = null;
            Response.Redirect("~/index.aspx");
        }
        else
        {
            Session["CEmail"] = null;
            Session["CName"] = null;
            lbl_name.Text = null;
            Response.Redirect("~/index.aspx");

        }




    }
}

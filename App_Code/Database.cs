
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.IO;

/// <summary>
/// Summary description for Database
/// </summary>
public class _Database
{
    SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-HKSTUJA\SQLEXPRESS;Initial Catalog=OnlineShopping;Integrated Security=True");
    public _Database()
    {
        //
        // TODO: Add constructor logic here
        //


    }

    public void Register_user(TextBox Fname, TextBox Lname, TextBox Email, TextBox Address, TextBox Phone, TextBox Password, TextBox ConfirmPassword, Label Sign_up)
    {

        Con.Open();

        string sql_Check = "";

        sql_Check = "Select * from Customer where Email='" + Email.Text + "'";
        SqlCommand command1 = new SqlCommand(sql_Check, Con);
        SqlDataAdapter Sda = new SqlDataAdapter(command1);
        System.Data.DataTable dt = new System.Data.DataTable();

        Sda.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Sign_up.ForeColor = System.Drawing.Color.Red;
            Sign_up.Text = "Account creation failed or Account already exist";
            Fname.Text = null;
            Lname.Text = null;
            Email.Text = null;
            Phone.Text = null;
            Password.Text = null;
            ConfirmPassword.Text = null;
            Address.Text = null;
            Con.Close();
        }
        else
        {
            string Date = DateTime.Now.ToShortDateString();
            string sql_insert = "";
            sql_insert = "INSERT INTO Customer Values('" + Fname.Text + "','" + Lname.Text + "','" + Email.Text + "','" + Address.Text + "'," + Convert.ToInt64(Phone.Text) + ",'" + Password.Text + "','" + Date + "')";
            SqlCommand command = new SqlCommand(sql_insert, Con);
            command.ExecuteNonQuery();
            command.Dispose();
            Sign_up.ForeColor = System.Drawing.Color.Green;
            Sign_up.Text = "Account created suceesfully";
            Fname.Text = null;
            Lname.Text = null;
            Email.Text = null;
            Phone.Text = null;
            Password.Text = null;
            ConfirmPassword.Text = null;
            Address.Text = null;
            Con.Close();
        }
    }
    public void Admin_Sign(TextBox A_Email, TextBox A_Password, Label A_Sign)
    {
        string A_sql_query = "";
        A_sql_query = "Select * from _Admin where Email='" + A_Email.Text + "' and Password='" + A_Password.Text + "'";
        SqlCommand A_command = new SqlCommand(A_sql_query, Con);
        SqlDataAdapter Sda = new SqlDataAdapter(A_command);
        DataTable dt = new DataTable();

        Sda.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Con.Open();
            string sql_Aname = "Select AdminID,AdminName from _Admin where Email='" + A_Email.Text + "'";
            SqlCommand cmd_name = new SqlCommand(sql_Aname, Con);
            SqlDataReader sdr = cmd_name.ExecuteReader();
            sdr.Read();
            System.Web.HttpContext.Current.Session["AID"] = sdr[0];
            System.Web.HttpContext.Current.Session["AName"] = sdr[1];
           
            System.Web.HttpContext.Current.Session["AEmail"] = A_Email.Text;
            System.Web.HttpContext.Current.Response.Redirect("Admin.aspx");


        }
        else
        {
            A_Sign.Text = "Invalid email or password";

        }
    }

    public void Customer_Sign(TextBox C_Email, TextBox C_Password, Label C_Sign)
    {
        Con.Open();
        string sql_Check = "";
        sql_Check = "Select * from Customer where Email='" + C_Email.Text + "' and Password='" + C_Password.Text + "'";
        SqlCommand command1 = new SqlCommand(sql_Check, Con);
        SqlDataAdapter Sda = new SqlDataAdapter(command1);
        DataTable dt = new DataTable();

        Sda.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            string sql_Cname = "Select CustomerID,LastName from Customer where Email='" + C_Email.Text + "'";
            SqlCommand cmd_name = new SqlCommand(sql_Cname, Con);
            SqlDataReader sdr = cmd_name.ExecuteReader();
            sdr.Read();
            System.Web.HttpContext.Current.Session["CID"] = sdr[0];
            System.Web.HttpContext.Current.Session["CName"] = sdr[1];
            System.Web.HttpContext.Current.Session["CEmail"] = C_Email.Text;
            System.Web.HttpContext.Current.Response.Redirect("index.aspx");
        }
        else
        {
            C_Sign.Text = "Invalid email or password";

        }

    }

    public void Insert_Product(TextBox ProName, TextBox Quantity, DropDownList Brand, DropDownList Category, TextBox Price, TextBox SPrice, FileUpload ImageUpload, TextBox Details, Label AddPro)
    {   //Insert Products

        try
        {
            string Date = DateTime.Now.ToShortDateString();
            SqlCommand cmd = new SqlCommand("ProInser", Con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductName", ProName.Text);
            cmd.Parameters.AddWithValue("@PCatID", Category.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PBrandID", Brand.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@ProductQuantity", Quantity.Text);
            cmd.Parameters.AddWithValue("@ProductPrice", Price.Text);
            cmd.Parameters.AddWithValue("@ProductSPrice", SPrice.Text);
            cmd.Parameters.AddWithValue("@Details", Details.Text);
            cmd.Parameters.AddWithValue("@ProductRegDate", Date);
            Con.Open();
            Int16 PID = Convert.ToInt16(cmd.ExecuteScalar());
            AddPro.ForeColor = System.Drawing.Color.Green;
            AddPro.Text = "Product Added Successfully";
            //ProName.Text = null;
            System.Web.HttpContext.Current.Session["PPrice"]= Price.Text;
            System.Web.HttpContext.Current.Session["PSPrice"]= SPrice.Text;
            Category.SelectedIndex = Category.Items.IndexOf(Category.Items.FindByText("--Select--"));
            Brand.SelectedIndex = Brand.Items.IndexOf(Brand.Items.FindByText("--Select--"));
            Quantity.Text = null;
            Price.Text = null;
            SPrice.Text = null;
            Details.Text = null;

            //Insert and upload Image
            if (ImageUpload.HasFile)
            {
                string SavePath = System.Web.HttpContext.Current.Server.MapPath("~/images/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extension = Path.GetExtension(ImageUpload.PostedFile.FileName);
                ImageUpload.SaveAs(SavePath + "\\" + ProName.Text + Extension);
                SqlCommand cmdUpload = new SqlCommand("Insert into ProductImage values('" + PID + "','" + ProName.Text + "','" + Extension + "')", Con);
                cmdUpload.ExecuteNonQuery();
            }
            ProName.Text = null;

        }
        catch (Exception ex)
        {
            AddPro.ForeColor = System.Drawing.Color.Red;
            AddPro.Text = ex.ToString();
        }
        finally
        {
            Con.Close();
        }
    }
    public void Bind(DropDownList ProCat, DropDownList ProBrand)
    {

        //Bind Category DropDown
        Con.Open();
        string sql_CateCheck = "";
        sql_CateCheck = "Select * from Category ";
        SqlCommand commandCate = new SqlCommand(sql_CateCheck, Con);
        SqlDataAdapter Cat_Sda = new SqlDataAdapter(commandCate);
        System.Data.DataTable Cate_dt = new System.Data.DataTable();

        Cat_Sda.Fill(Cate_dt);
        Con.Close();
        if (Cate_dt.Rows.Count != 0)
        {
            ProCat.DataSource = Cate_dt;
            ProCat.DataTextField = "CatName";
            ProCat.DataValueField = "CatID";
            ProCat.DataBind();
            ProCat.Items.Insert(0, new ListItem("-Select-", "0"));

        }

        else { }
        //Bind Brand DropDown
        Con.Open();
        string sql_BCheck = "";
        sql_BCheck = "Select * from Brand ";
        SqlCommand commandB = new SqlCommand(sql_BCheck, Con);
        SqlDataAdapter B_Sda = new SqlDataAdapter(commandB);
        System.Data.DataTable B_dt = new System.Data.DataTable();

        B_Sda.Fill(B_dt);
        Con.Close();
        if (B_dt.Rows.Count != 0)
        {
            ProBrand.DataSource = B_dt;
            ProBrand.DataTextField = "BrandName";
            ProBrand.DataValueField = "BrandID";
            ProBrand.DataBind();
            ProBrand.Items.Insert(0, new ListItem("-Select-", "0"));

        }

        else { }


    }
    public void Update_Product(TextBox Name, TextBox Quantity, TextBox Brand, TextBox Category, TextBox Details, TextBox Price, FileUpload PImage)
    {

    }
    public void Insert_Brand(TextBox BrandName, Label BrandPage)
    {

        try
        {
            Con.Open();
            string sql_BCheck = "";

            sql_BCheck = "Select * from Brand where BrandName='" + BrandName.Text + "'";
            SqlCommand commandB = new SqlCommand(sql_BCheck, Con);
            SqlDataAdapter Sda = new SqlDataAdapter(commandB);
            System.Data.DataTable dt = new System.Data.DataTable();

            Sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                BrandPage.ForeColor = System.Drawing.Color.Red;
                BrandPage.Text = "Already Exist";

            }
            else
            {
                string sql_Binsert = "";
                sql_Binsert = "INSERT INTO Brand Values('" + BrandName.Text + "')";
                SqlCommand command = new SqlCommand(sql_Binsert, Con);
                command.ExecuteNonQuery();
                BrandPage.ForeColor = System.Drawing.Color.Green;
                BrandPage.Text = "Added Successfully";
                command.Dispose();
                Con.Close();
            }
        }
        catch (Exception ex)
        {
            BrandPage.ForeColor = System.Drawing.Color.Red;
            BrandPage.Text = ex.ToString();
        }
    }
    public void Insert_Category(TextBox CatName, Label CatPage)
    {
        try
        {
            Con.Open();
            string sql_CatCheck = "";

            sql_CatCheck = "Select * from Category where CatName='" + CatName.Text + "'";
            SqlCommand commandCat = new SqlCommand(sql_CatCheck, Con);
            SqlDataAdapter Sda = new SqlDataAdapter(commandCat);
            System.Data.DataTable dt = new System.Data.DataTable();

            Sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                CatPage.ForeColor = System.Drawing.Color.Red;
                CatPage.Text = "Already Exist";
            }
            else
            {
                string sql_CatInsert = "";
                sql_CatInsert = "INSERT INTO Category Values('" + CatName.Text + "')";
                SqlCommand command = new SqlCommand(sql_CatInsert, Con);
                command.ExecuteNonQuery();
                CatPage.ForeColor = System.Drawing.Color.Green;
                CatPage.Text = "Added Successfully";
                command.Dispose();
                Con.Close();
            }
        }
        catch (Exception ex)
        {
            CatPage.ForeColor = System.Drawing.Color.Red;
            CatPage.Text = ex.ToString();
        }

    }
    public void BindProductRepeater(Repeater ProductRep)
    {
        Con.Open();

        using (SqlCommand cmdRep = new SqlCommand("BindProducts", Con))
        {
            cmdRep.CommandType = CommandType.StoredProcedure;
            using (SqlDataAdapter SDA_Rep = new SqlDataAdapter())
            {
                SDA_Rep.SelectCommand = cmdRep;
                DataTable DT_Rep = new DataTable();
                SDA_Rep.Fill(DT_Rep);
                ProductRep.DataSource = DT_Rep;
                ProductRep.DataBind();
                Con.Close();
            }
        }
    }
    public void BindProductImages(Repeater ImgRepDetails)
    {
        Int64 ProductID = Convert.ToInt64(System.Web.HttpContext.Current.Request.QueryString["ProductID"]);
        Con.Open();

        using (SqlCommand cmdRep = new SqlCommand("Select * from ProductImage where ProductID=" + ProductID + "", Con))
        {
            cmdRep.CommandType = CommandType.Text;
            using (SqlDataAdapter SDA_Rep = new SqlDataAdapter())
            {
                SDA_Rep.SelectCommand = cmdRep;
                DataTable DT_ImgRep = new DataTable();
                SDA_Rep.Fill(DT_ImgRep);
                ImgRepDetails.DataSource = DT_ImgRep;
                ImgRepDetails.DataBind();
                Con.Close();
            }
        }
    }
    public void BindProductDetials(Repeater ProDetails)
    {
        Int64 ProductID = Convert.ToInt64(System.Web.HttpContext.Current.Request.QueryString["ProductID"]);
        Con.Open();

        using (SqlCommand cmdRep = new SqlCommand("Select A.ProductName,A.Details,A.ProductSPrice,C.BrandName from Product A Inner Join Brand C on A.PBrandID=C.BrandID  where ProductID=" + ProductID + "", Con))
        {
            cmdRep.CommandType = CommandType.Text;
            using (SqlDataAdapter SDA_Rep = new SqlDataAdapter())
            {
                SDA_Rep.SelectCommand = cmdRep;
                DataTable DT_ImgRep = new DataTable();
                SDA_Rep.Fill(DT_ImgRep);
                ProDetails.DataSource = DT_ImgRep;
                ProDetails.DataBind();
                Con.Close();
            }
        }
    }
    public void Btn_AddCart(Button Cart)
    {
        Con.Open();
        Int64 ProductID = Convert.ToInt64(System.Web.HttpContext.Current.Request.QueryString["ProductID"]);
        if (System.Web.HttpContext.Current.Request.Cookies["CartProID"] != null)
        {
            string CookiesCart = System.Web.HttpContext.Current.Request.Cookies["CartProID"].Value.Split('=')[1];
            CookiesCart = CookiesCart + "," + ProductID;
            System.Web.HttpCookie CartProducts = new HttpCookie("CartProID");
            CartProducts.Values["CartProID"] = CookiesCart;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            System.Web.HttpContext.Current.Response.Cookies.Add(CartProducts);
            Con.Close();
        }
        else
        {
            System.Web.HttpCookie CartProducts = new HttpCookie("CartProID");
            CartProducts.Values["CartProID"] = ProductID.ToString();
            CartProducts.Expires = DateTime.Now.AddDays(30);
            System.Web.HttpContext.Current.Response.Cookies.Add(CartProducts);
            Con.Close();
        }
    }
    public void BindCartProducts(Repeater BindCartRep, Label CartCount, Label PriceTotal)
    {
        Con.Open();
        if (System.Web.HttpContext.Current.Request.Cookies["CartProID"] != null)
        {
            string CookieProData = System.Web.HttpContext.Current.Request.Cookies["CartProID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieProData.Split(',');
            if (CookieProData.Length > 0)
            {
                CartCount.Text = "My Cart  (Items : " + CookieDataArray.Length + ")";

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
                            PriceTotal.Text = CartTotal.ToString();
                            Con.Close();
                        }

                    }
                    CartTotal += Convert.ToInt64(DT_CartRep.Rows[i]["Price"]);
                }

                BindCartRep.DataSource = DT_CartRep;
                BindCartRep.DataBind();
            }
            else
            {
                CartCount.Text = "My Cart (Items : 0)";

            }
        }

        else
        {
            CartCount.Text = "My Cart (Items : 0)";
        }
        Con.Close();
    }
  
   


    }

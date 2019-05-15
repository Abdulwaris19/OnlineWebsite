using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product : System.Web.UI.Page
{
    _Database dbPRoduct = new _Database();
    protected void Page_Load(object sender, EventArgs e)
    {
        _Database dbPRoduct = new _Database();
        if (!IsPostBack)
        {
            dbPRoduct.Bind(CatDropDownList, BrandDropDownList);
           
           
        
        }
    }


    protected void Add_checkbox_CheckedChanged(object sender, EventArgs e)
    {
      
    }

    protected void Delete_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
     
    }

    protected void Modify_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
     
    }

    protected void btn_Sign_out_Click(object sender, EventArgs e)
    {

    }

    protected void Btn_Upload_Click(object sender, EventArgs e)
    {
        dbPRoduct.Insert_Product(Pname_TextBox, QuantityTextBox, BrandDropDownList, CatDropDownList, Price_TextBox, PriceSellTextBox, FileUpload, Details_TextBox,Lbl_AddPro);
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Brand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btn_AddBrand_Click(object sender, EventArgs e)
    {
        _Database dbBrand = new _Database();
        dbBrand.Insert_Brand(BName_TextBox, Lbl_BrandPage);
    }
}
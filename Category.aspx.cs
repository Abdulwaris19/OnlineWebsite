using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btn_AddCat_Click(object sender, EventArgs e)
    {
        _Database dbCat = new _Database();
        dbCat.Insert_Category(CatName_TextBox,Lbl_CategoryPage);
       
    }
}
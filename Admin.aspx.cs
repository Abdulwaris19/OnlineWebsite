using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
 
    protected void Page_Load(object sender, EventArgs e)
    {
        AdminClass AdminHome = new AdminClass();

        AdminHome.Admin_visiblity(
            ASign_in,         
            AOrder,
            Btn_ASignOut,
            lbl_Aname,
            AHome,
            AProducts,  
            A_EmailTextbox,
            A_PasswordTextbox,
            A_Remembercheckbox,
            Btn_ASign,
            lbl_BodyName,
          A_EmailValidator,
          A_PasswordValidator,
          HBrand,HCategory,navbardrop
           
            );
        
    }

    protected void Btn_ASign_Click(object sender, EventArgs e)
    {
        AdminClass AdminSign = new AdminClass(A_EmailTextbox,A_PasswordTextbox,lbl_A_Sign);

    }

    protected void Btn_ASignOut_Click(object sender, EventArgs e)
    {
        AdminClass AdminSignOut = new AdminClass();
        AdminSignOut.ASignOut();
    }
}
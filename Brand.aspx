<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Brand.aspx.cs" Inherits="Brand" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

          <!-- Bootstrap -->
          <link href="css/bootstrap.min.css" rel="stylesheet" />

          <!-- CSS -->
          <link href="Custom.css" rel="stylesheet" />

    <title>Brand</title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        
      
        <div class="form-group">
            <br />
            <br />
             <div class="row">
                  <div class="col-md-6 offset-md-3">
                        <asp:Label ID="Lbl_BHead" CssClass="font-italic" style="font-size:28px; font-weight:bold" runat="server" Text="Brand"></asp:Label>
                      <hr />
                   </div>
             </div>
            
            <br />
            <br />
            <br />
            <br />
                    <!--Name-->
          
             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="lbl_Brand" class="col-form-label" runat="server" Text="Brand"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="BName_TextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="BNameValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="BName_Textbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />
            <!--Name End-->
              <div class="row">
                <div class="col-md-2 offset-md-6">
                    <asp:Button ID="Btn_AddBrand" class="btn btn-block btn-info" runat="server" Text="Add" OnClick="Btn_AddBrand_Click" />
                </div>
            </div>

            <br />
            <div class="row">
                <div class="col-md-3 offset-md-5">
                    <asp:Label ID="Lbl_BrandPage" CssClass="form-text" runat="server" Text=""></asp:Label>
                </div>
            </div>
      <!--End-->

    </div>
      </div>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

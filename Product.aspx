<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
       <script src="js/jquery-3.2.1.min.js"></script>
       <script src="js/bootstrap.min.js"></script>
       <script src="js/npm.js"></script>

          <!-- Bootstrap -->
          <link href="css/bootstrap.min.css" rel="stylesheet" />

          <!-- CSS -->
          <link href="Custom.css" rel="stylesheet" />

    <title>Products</title>

</head>
<body>
    <form id="form1" runat="server">
    <div>        
    <!--navbar -->

      <nav class="navbar navbar-expand navbar-dark bg-secondary">
                <div class="collapse navbar-collapse"">
                      <ul class="navbar-nav ml-auto">
                          <li class="nav-item "><asp:HyperLink ID="HHome" CssClass="nav-link" runat="server" href="Admin.aspx">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link active" runat="server">Products</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCart" CssClass="nav-link" runat="server" href="Brand.aspx">Brand</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCategory" CssClass="nav-link" runat="server" href="Category.aspx">Category</asp:HyperLink></li>
                         <li class="nav-item"><asp:HyperLink ID="HOrder" CssClass="nav-link" runat="server" href="Order.aspx">Orders</asp:HyperLink></li>
                          <asp:Button ID="btn_sign_out" class="btn btn-block btn-sm btn-success" runat="server" Text="Sign out" OnClick="btn_Sign_out_Click" />
                     </ul>
               </div>
        </nav>

        <!--Navbar End-->

        <!--Start-->

        <div class="form-group">
            <br />
            <br />
             <div class="row">
                  <div class="col-md-6 offset-md-3">
                      <asp:Label ID="Lbl_product" CssClass="font-italic" style="font-size:28px; font-weight:bold" runat="server" Text="Add Product"></asp:Label>
                      <hr />
                   </div>
             </div>
            
            <br />
             <br />
              <div class="row">
                  <div class="col-md-3">
                         <asp:CheckBox ID="Add_checkbox" class="form-check align-self-center" AutoPostBack="true" Text="Add Products"  runat="server" OnCheckedChanged="Add_checkbox_CheckedChanged" />
                  </div>

                  <div class="col-md-3">
                         <asp:CheckBox ID="Modify_CheckBox" class="form-check align-self-center" AutoPostBack="true" Text="Modify Products"  runat="server" OnCheckedChanged="Modify_CheckBox_CheckedChanged" />
                  </div>

             </div>
            <br />
        <!--Name-->
          
             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="lbl_Name" class="col-form-label" runat="server" Text="Name"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="Pname_TextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="PnameValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="Pname_Textbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />
            <!--Name End-->

             <!--Quantity-->

             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="Lbl_Quantity" class="col-form-label" runat="server" Text="Quantity"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="QuantityTextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="QuantityValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="Pname_Textbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />

            <!--Quantity End-->



            
               <!--Brand-->
             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="Lbl_Brand" class="col-form-label" runat="server" Text="Brand"></asp:Label>
                       </div>

                       <div class="col-md-4">
                           <asp:DropDownList ID="BrandDropDownList" CssClass="form-control align-self-center" runat="server" AutoPostBack="true"></asp:DropDownList>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="Brand_Validator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="Pname_Textbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />

            <!--Brand End-->

          <!--Category-->
             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="Lbl_Category" class="col-form-label" runat="server" Text="Category"></asp:Label>
                       </div>

                       <div class="col-md-4">
                           <asp:DropDownList ID="CatDropDownList" CssClass-="form-control align-self-center" runat="server" AutoPostBack="true"></asp:DropDownList>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="Category_Validator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="Pname_Textbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />
           
            <!--Category End-->

            
               <!--Details-->
             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="Lbl_Details" class="col-form-label" runat="server" Text="Details"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="Details_TextBox" Style="resize:none" class="form-control align-self-center" runat="server" TextMode="MultiLine"></asp:TextBox>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="Details_Validator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="Pname_Textbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />
        <br />
            <!--Details End-->

            
               <!--Price-->
             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="Lbl_Price" class="col-form-label" runat="server" Text="Price"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="Price_TextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="Price_Validator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="Price_Textbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />

            <!--Price End-->

             <!--Price Selling-->
             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="Lbl_PriceSell" class="col-form-label" runat="server" Text="Selling Price"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="PriceSellTextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="PriceSellValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="PriceSellTextbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />

            <!--Price Selling End-->
           
            <!--Images-->

            <asp:FileUpload ID="FileUpload" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style="color:Red" runat="server" ErrorMessage="required*" ControlToValidate="FileUpload"></asp:RequiredFieldValidator>

            <!--Images End-->
           
            <div class="row">
                <div class="col-md-2 offset-md-2">
                    <asp:Label ID="Lbl_UImg" CssClass="form-text" runat="server" Text="Upload Image"></asp:Label>
                </div>
            </div>
            
         
        <!--end-->
             <!--Upload-->
     <div class="row">

            <div class="col-md-2 offset-md-8">
                  <asp:Button ID="Btn_Upload" class="btn btn-block btn-info" runat="server" Text="Add" OnClick="Btn_Upload_Click" />
           </div>

       </div>
   <!--Upload End-->
            <br />
       <div class="row">

            <div class="col-md-3 offset-md-5">
                <asp:Label ID="Lbl_AddPro" CssClass="form-text" Font-Size="Large" runat="server" Text=""></asp:Label>
           </div>

       </div>

   </div>
        </div>
  
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

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

    <title>Admin_Login</title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
         <!--navbar -->
      <nav class="navbar navbar-expand navbar-dark bg-secondary">
                <div class="collapse navbar-collapse"">
                    <div class="navbar-brand">
                        <asp:Label ID="lbl_Aname" class="card-text" runat="server" Text=""></asp:Label></div>
                      <ul class="navbar-nav ml-auto">
                          <li class="nav-item "><asp:HyperLink ID="AHome" CssClass="nav-link active" runat="server" href="Admin.aspx">Home</asp:HyperLink></li>
                          <li class="nav-item dropdown">
                     <asp:HyperLink class="nav-link dropdown-toggle" href="#" id="navbardrop" runat="server" data-toggle="dropdown"> Reports </asp:HyperLink>
                     <div class="dropdown-menu">
                         <a class="dropdown-item" href="ViewProducts.aspx">Products</a>
                         <a class="dropdown-item" href="Users.aspx">Users</a>
                         <a class="dropdown-item" href="Order.aspx">Orders</a>
                         <a class="dropdown-item" href="Account.aspx">Account</a>
                     </div>
                </li>
                          <li class="nav-item"><asp:HyperLink ID="AProducts" CssClass="nav-link" runat="server" href="Product.aspx">Products</asp:HyperLink></li>  
                          <li class="nav-item"><asp:HyperLink ID="HBrand" CssClass="nav-link" runat="server" href="Brand.aspx">Brand</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCategory" CssClass="nav-link" runat="server" href="Category.aspx">Category</asp:HyperLink></li > 
                          <li class="nav-item"><asp:HyperLink ID="AOrder" CssClass="nav-link" runat="server" href="Order.aspx">Orders</asp:HyperLink></li>  
                          <li class="nav-item"><asp:HyperLink ID="ASign_in" CssClass="nav-link active" runat="server" href="Admin.aspx">Sign in</asp:HyperLink></li>
                          <asp:Button ID="Btn_ASignOut" CssClass="btn btn-block btn-sm btn-success " runat="server" Text="Sign out" OnClick="Btn_ASignOut_Click" />
                     </ul>
               </div>
        </nav>

        <br />
        
        <!--Navbar End-->

        <!--Admin Login-->

        <div class="form-group">
            <br />
            <br />
            <br />
            <br />
             <div class="row">
                  <div class="col-md-6 offset-md-3">
                      <asp:Label ID="lbl_BodyName" runat="server" CssClass="font-italic" style="font-size:28px;font-weight:bold" Text="Admin Log in"></asp:Label>
                   </div>
             </div>
            
            <br />

            <div class="row">
                  <div class="col-md-6 offset-md-3">
                         <asp:TextBox ID="A_EmailTextbox" class="form-control align-self-center" placeholder="Email" runat="server"></asp:TextBox>
                   </div>
                  <div class="col-md-1">
                         <asp:RequiredFieldValidator ID="A_EmailValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="A_EmailTextbox" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-md-1">
                        <asp:RegularExpressionValidator ID="A_EmailValidFormat" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="red" ControlToValidate="A_EmailTextbox" ErrorMessage="Invalid Format" Display="Dynamic"></asp:RegularExpressionValidator>
                  </div>
           </div>
            
            <br />

            <div class="row">
                   <div class="col-md-6 offset-md-3">
                           <asp:TextBox ID="A_PasswordTextbox" class="form-control align-self-center" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                   </div>
                    <div class="col-md-1">
                           <asp:RequiredFieldValidator ID="A_PasswordValidator" TextMode="Password" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="A_PasswordTextbox"></asp:RequiredFieldValidator>
                    </div>
           </div>

            <br/>

             <div class="row">
                <div class="col-md-6 offset-md-2">
                    <asp:CheckBox ID="A_Remembercheckbox" class="form-check align-self-center" AutoPostBack="true" Text="Remember Password"  runat="server" />
                </div>
                 </div>
           

          <div class="row">
               <div class="col-md-2 offset-md-7">
                   <asp:Button ID="Btn_ASign" CssClass="btn btn-block btn-success" runat="server" Text="Sign in" OnClick="Btn_ASign_Click" />
               </div>
           </div>

            <br />

            <div class="row">
                 <div class="col-md-6 offset-md-4">
                       <asp:Label ID="lbl_A_Sign" ForeColor="red" runat="server" Text=""></asp:Label>
                </div>
           </div>
    
      </div>

        <!--Admin Login End-->

        <!--Navbar End-->

    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

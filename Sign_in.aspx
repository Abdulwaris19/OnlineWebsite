<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sign_in.aspx.cs" Inherits="Sign_in" %>

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

    <title>Sign in</title>

</head>
<body>
    <form id="form1" runat="server">
 
    <div>
  <!--navbar -->
      <nav class="navbar navbar-expand navbar-dark bg-secondary">
                <div class="collapse navbar-collapse"">
                      <ul class="navbar-nav ml-auto">
                          <li class="nav-item "><asp:HyperLink ID="HLink" CssClass="nav-link" runat="server" href="index.aspx">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link" runat="server" href="Product_userview.aspx">Products</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HContact" CssClass="nav-link" runat="server" href="Contact.aspx">Contact us</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HyperLink1" CssClass="nav-link active" runat="server">Sign in</asp:HyperLink></li>
                       </ul>
                </div>
        </nav>

        <!--Navbar End-->

        <div class="form-group">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
             <div class="row">
                  <div class="col-md-6 offset-md-3">
                       <h3 class="font-italic">Sign in</h3>
                   </div>
             </div>
            
            <br />

            <div class="row">
                  <div class="col-md-6 offset-md-3">
                         <asp:TextBox ID="S_EmailTextbox" class="form-control align-self-center" placeholder="Email" runat="server"></asp:TextBox>
                   </div>
                  <div class="col-md-1">
                         <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="S_EmailTextbox" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-md-1">
                        <asp:RegularExpressionValidator ID="EmailValidFormat" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="red" ControlToValidate="S_EmailTextbox" ErrorMessage="Invalid Format" Display="Dynamic"></asp:RegularExpressionValidator>
                  </div>
           </div>
            
            <br />

            <div class="row">
                   <div class="col-md-6 offset-md-3">
                           <asp:TextBox ID="S_PasswordTextbox" class="form-control align-self-center" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                   </div>
                    <div class="col-md-1">
                           <asp:RequiredFieldValidator ID="PasswordValidator" TextMode="Password" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="S_PasswordTextbox"></asp:RequiredFieldValidator>
                    </div>
           </div>

            <br/>

             <div class="row">
                <div class="col-md-6 offset-md-2">
                    <asp:CheckBox ID="Remembercheckbox" class="form-check align-self-center" AutoPostBack="true" Text="Remember Password"  runat="server" />
                </div>
                 </div>
           

          <div class="row">
               <div class="col-md-6 offset-md-5">
                     <asp:Button ID="btn_sign" runat="server" Class="btn btn-success" Text="Sign in" OnClick="btn_Sign_Click" />
    
                     <asp:Label ID="Lbl_info" runat="server" Text="Don't have an account"></asp:Label><a href="Register.aspx"> Sign up</a>
               </div>
           </div>

            <br />

            <div class="row">
                 <div class="col-md-6 offset-md-4">
                       <asp:Label ID="lbl_Sign" ForeColor="red" runat="server" Text=""></asp:Label>
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

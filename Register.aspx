<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

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

    <title>Registration</title>

</head>

<body>

    <form id="form1" runat="server">
    <div>
         <!--navbar -->
      <nav class="navbar navbar-expand navbar-dark bg-secondary">
                <div class="collapse navbar-collapse"">
                      <ul class="navbar-nav ml-auto">
                          <li class="nav-item "><asp:HyperLink ID="HLink" CssClass="nav-link" runat="server">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link" runat="server" href="Product.aspx">Products</asp:HyperLink></li> 
                          <li class="nav-item"><asp:HyperLink ID="HContact" CssClass="nav-link" runat="server" href="Contact.aspx">Contact</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HSign_in" CssClass="nav-link" runat="server" href="Sign_in.aspx">Sign in</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HyperLink2" CssClass="nav-link active" runat="server" href="Sign_in.aspx">Sign up</asp:HyperLink></li>

                     </ul>
               </div>
        </nav>

        <!--Navbar End-->

        <div class="form-group">
            <br />
            <br />

             <div class="row">
                  <div class="col-md-6 offset-md-3">
                       <h3 class="font-italic">Sign Up</h3>
                   </div>
             </div>
            
            <br />

          <div class="row">
                 <div class="col-md-6 offset-md-3">
                      <asp:TextBox ID="FNameTextbox" class="form-control align-self-center" placeholder="First Name" runat="server"></asp:TextBox>
                 </div>
                <div class="col-md-1">
                      <asp:RequiredFieldValidator ID="FnameValidator1" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="FNameTextbox"></asp:RequiredFieldValidator>
                 </div>
         </div>

            <br />

            <div class="row">
                  <div class="col-md-6 offset-md-3">
                      <asp:TextBox ID="LNameTextbox" class="form-control align-self-center" placeholder="Last Name" runat="server"></asp:TextBox>
                  </div>
                  <div class="col-md-1">
                       <asp:RequiredFieldValidator ID="LNameValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="LNameTextbox"></asp:RequiredFieldValidator>
                 </div>
           </div>

            <br />

           <div class="row">
                  <div class="col-md-6 offset-md-3">
                         <asp:TextBox ID="EmailTextbox" class="form-control align-self-center" placeholder="Email" runat="server"></asp:TextBox>
                   </div>
                  <div class="col-md-1">
                         <asp:RequiredFieldValidator ID="EmailValidator" Display="Dynamic" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="EmailTextbox"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-md-1">
                        <asp:RegularExpressionValidator Display="Dynamic"  ID="EmailValidFormat" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="red" ControlToValidate="EmailTextbox" ErrorMessage="Invalid Format"></asp:RegularExpressionValidator>
                  </div>
           </div>
            <br />

           <div class="row">
                   <div class="col-md-6 offset-md-3">
                         <asp:TextBox ID="PhoneTextbox" class="form-control align-self-center" placeholder="Phone" runat="server"></asp:TextBox>
                  </div>
                   <div class="col-md-1">
                         <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="PhoneTextbox"></asp:RequiredFieldValidator>
                 </div>
           </div>

            <br />

            <div class="row">
                   <div class="col-md-6 offset-md-3">
                           <asp:TextBox ID="PasswordTextbox" class="form-control align-self-center" placeholder="Password" runat="server"></asp:TextBox>
                   </div>
                    <div class="col-md-1">
                           <asp:RequiredFieldValidator Display="Dynamic"  ID="PasswordValidator" TextMode="Password" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="PasswordTextbox"></asp:RequiredFieldValidator>
                    </div>
           </div>

            <br />

          <div class="row">
                <div class="col-md-6 offset-md-3">
                     <asp:TextBox ID="ConfirmPassTextbox" class="form-control align-self-center" placeholder="Confirm Password" runat="server"></asp:TextBox>
                </div>
               <div class="col-md-1">
                    <asp:RequiredFieldValidator ID="ConfirmPassValidator" Display="Dynamic"  TextMode="Password" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="ConfirmPassTextbox"></asp:RequiredFieldValidator>
               </div>
               <div class="col-md-1">
                    <asp:CompareValidator ID="PassCompareValidator" Display="Dynamic"  runat="server" ForeColor="red" ErrorMessage="Password do not match" ControlToValidate="PasswordTextbox" ControlToCompare="ConfirmPassTextbox"></asp:CompareValidator>
              </div>
         </div>

            <br/>

             <div class="row">
                <div class="col-md-6 offset-md-3">
                     <asp:TextBox ID="AddressTextBox" class="form-control align-self-center" placeholder="Address" runat="server"></asp:TextBox>
                </div>
               <div class="col-md-1">
                    <asp:RequiredFieldValidator ID="Address_validator" TextMode="Password" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="AddressTextbox"></asp:RequiredFieldValidator>
               </div>
                     </div>

            <br/>

          <div class="row">
               <div class="col-md-6 offset-md-4">
                     <asp:Button ID="btn_register" runat="server" Class="btn btn-success" Text="Register" OnClick="btn_register_Click" /><span>
                     <asp:Label ID="Lbl_info" runat="server" Text=" Already have an account"></asp:Label><a href="Sign_in.aspx"> Sign in</a></span>
               </div>
           </div>

            <br />

            <div class="row">
                 <div class="col-md-6 offset-md-4">
                       <asp:Label ID="lbl_Status" ForeColor="Green" runat="server" Text=""></asp:Label>
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

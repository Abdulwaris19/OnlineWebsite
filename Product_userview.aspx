<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product_userview.aspx.cs" Inherits="Product_userview" %>

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

    <title>Products</title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        
          <!--navbar -->
      <nav class="navbar navbar-expand navbar-dark bg-secondary">
                <div class="collapse navbar-collapse"">
                    <div class="navbar-brand">
                        <asp:Label ID="lbl_name" class="card-text" runat="server" Text=""></asp:Label></div>
                      <ul class="navbar-nav ml-auto">
                          <li class="nav-item "><asp:HyperLink ID="HLink" CssClass="nav-link" runat="server" href="index.aspx">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link active  " runat="server">Products</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCart" CssClass="nav-link" runat="server" href="Cart.aspx">Cart</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HOrder" CssClass="nav-link" runat="server"  href="Order_userview">Orders</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HPayment" CssClass="nav-link" runat="server">Payment</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HContact" CssClass="nav-link" runat="server" href="Contact.aspx">Contact</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HSign_in" CssClass="nav-link" runat="server" href="Sign_in.aspx">Sign in</asp:HyperLink></li> 
                          <asp:Button ID="Btn_CSignOut" runat="server" class="btn btn-block btn-sm btn-success" Text="Sign out" OnClick="Btn_CSignOut_Click" />                     </ul>
               </div>
        </nav>
        <br />
        
        <!--Navbar End-->
        <h4 class="figure-caption" style="font-size:32px">Products</h4>
        <hr />
        <!--Start-->
       
        <div class="row" style="padding-top:50px">
            <asp:Repeater id="Product_Rep" runat="server">
       <ItemTemplate>
                 <div class="col-md-3">
              <a style="text-decoration:none" href="ProductDetails.aspx?ProductID=<%#Eval("ProductID") %>">
                      <div class="img-thumbnail ml-2">
                          <img src="images/ProductImages/<%#Eval("ProductID") %>/<%#Eval("Name") %><%#Eval("Extension") %>" alt="<%#Eval("ImageName") %>" height="200px"/>
                                <div class="figure-caption">
                                      <h3><%# Eval("ProductName") %></h3>
                                      <p class="form-text"><%# Eval("Brand") %></p>
                                      <p class="text-wrap"><%# Eval("Details") %></p>
                                     <h4 class="form-text">Price <%#Eval("Price") %></h4>
                               </div>
                      </div>
               </a>
                 </div>
       </ItemTemplate>
   </asp:Repeater>
            </div>

        <!--End-->
    </div>
       <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

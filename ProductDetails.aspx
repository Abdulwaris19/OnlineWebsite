<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>


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

    <title>Products Details</title>
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
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link" runat="server">Products</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCart" CssClass="nav-link" runat="server" href="Cart.aspx">Cart</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HOrder" CssClass="nav-link" runat="server" href="Order_userview.aspx">Orders</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HPayment" CssClass="nav-link" runat="server">Payment</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HContact" CssClass="nav-link" runat="server" href="Contact.aspx">Contact</asp:HyperLink></li>

                          <asp:Button ID="Btn_SignOutDetails" Class="btn btn-block btn-sm btn-success" runat="server" Text="Sign out" OnClick="Btn_SignOutDetails_Click" />
                        </ul>
               </div>
        </nav>
        <br />
        
        <!--Navbar End-->
        <h4 class="figure-caption" style="font-size:32px">Products Details</h4>
        <hr />
        <br/>
        <!--Product Details-->
        <div class="row">
            <asp:Repeater ID="RepImage" runat="server" OnItemCommand="RepImage_ItemCommand">
                <ItemTemplate>
            <div  class="col-md-6">
                  <div class="figure-img">
                      <img src="images/ProductImages/<%#Eval("ProductID") %>/<%#Eval("Name") %><%#Eval("Extension") %>" height:"450px" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'" />
                  </div>
           </div>
                     </ItemTemplate>
               </asp:Repeater>
            <asp:Repeater ID="ProDetailsRep" runat="server" OnItemCommand="ProDetailsRep_ItemCommand">
                <ItemTemplate>
             <div class="col-md-6">
             <h4 class="figure-caption text-left" style="font-size:42px"><%# Eval("ProductName") %></h4>
             <h4 class="figure-caption text-left" style="font-size:20px">Brand: <%# Eval("BrandName") %></h4>
             <h4 class="figure-caption text-left" style="font-size:20px">Price <%#Eval("ProductSPrice") %></h4>
             <hr />
             <h4 class="figure-caption text-left" style="font-size:14px">Details:</h4>
             <p class="figure-caption text-wrap text-left">
                 <%# Eval("Details") %>

             </p>
                  </ItemTemplate>
          </asp:Repeater>
                 <asp:Button ID="Btn_Addcart" CssClass="btn btn-block btn-sm  btn-danger col-md-8 mt-5" Style="border-radius:18px" runat="server" Text="Add to Cart" OnClick="Button1_Click" />
          </div>
                   
     </div>
          
        <%--CssClass="btn btn-block btn-sm  btn-danger col-md-8 mt-5" Style="border-radius:18px" runat="server" Text="Add to Cart"--%>
        
        <!--Product Details-->




         <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

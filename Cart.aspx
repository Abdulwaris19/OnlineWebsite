<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   
          <!-- Bootstrap -->
          <link href="css/bootstrap.min.css" rel="stylesheet" />

          <!-- CSS -->
          <link href="Custom.css" rel="stylesheet" />

    <title>Cart</title>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    
        <!--navbar -->
      <nav class="navbar navbar-expand navbar-dark bg-secondary">
                <div class="collapse navbar-collapse"">
                    <div class="navbar-brand">
                        <asp:Label ID="lbl_name" class="card-text" runat="server" Text=""></asp:Label></div>
                      <ul class="navbar-nav ml-auto">
                          <li class="nav-item "><asp:HyperLink ID="HLink" CssClass="nav-link" runat="server" href="index.aspx">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link" runat="server" href="Product_userview.aspx">Products</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCart" CssClass="nav-link active" runat="server">Cart</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HOrder" CssClass="nav-link" runat="server" href="Order_userview.aspx">Orders</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HPayment" CssClass="nav-link" runat="server" href="Payment.aspx">Payment</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HContact" CssClass="nav-link" runat="server" href="Contact.aspx">Contact</asp:HyperLink></li>
                              
                          <asp:Button ID="BtnCartSignOut" class="btn btn-block btn-sm btn-success" runat="server" Text="Sign out" OnClick="BtnCartSignOut_Click" /></ul>
               </div>
        </nav>
        <br />
     
        <!--Navbar End-->
        <div class="row">
          <div class="col-md-12">
              <asp:Label class="figure-caption" style="font-size:36px;font-weight:bold" ID="Lbl_Empty" runat="server" Text=""></asp:Label>
              <asp:Label class="figure-caption" style="font-size:36px;font-weight:bold" ID="Lbl_CartCount" runat="server" Text=""></asp:Label>
        <hr />
              </div>
        </div>
        <br />
        <br />
        <!--Start-->
        <div class="row">
            <div class="col-md-6">
                <asp:Repeater ID="RepCartProducts" runat="server" OnItemCommand="RepCartProducts_ItemCommand">
                    <ItemTemplate>
                <div class="media">
                    <a href="ProductDetails.aspx?ProductID=<%#Eval("ProductID") %>" style="text-decoration:none" target="_blank">
                     <img src="images/ProductImages/<%#Eval("ProductID") %>/<%#Eval("Name") %><%#Eval("Extension") %>" height="150px" alt="<%#Eval("Name") %>" />
                    </a>
                    <div class="media-body">
                     <h5 class="text-left"><%# Eval("Name") %></h5>
                    <h6 class="text-left">Details :<%#Eval("Details") %></h6>
                   <p class="text-left">Brand : <%# Eval("Brand") %></p>
                    <p class="text-left">Price : <%#Eval("Price","{0:c}") %>
                    <br />
                    <br />
                    <br />
                <%-- <asp:Button ID="btn_RemoveItem"  CommandArgument='<%#Eval("ProductID") %>' CssClass="col-md-3 btn btn-sm btn-block  btn-warning" style="border-radius:15px" runat="server" Text="Remove Item" OnClick="btn_RemoveItem_Click" />--%>
                    <asp:Button ID="Btn_remove"  CommandArgument='<%#Eval("ProductID") %>' CssClass="col-md-3 btn btn-sm btn-block  btn-warning" style="border-radius:15px" runat="server" Text="Remove Item" OnClick="Button1_Click" />
                        </div>
                    </div>
                        </ItemTemplate>
                 </asp:Repeater>
               <%--  <asp:Button ID="Btn_remove"  CommandArgument='<%#Eval("ProductID") %>' CssClass="col-md-3 btn btn-sm btn-block  btn-warning" style="border-radius:15px" runat="server" Text="Remove Item" OnClick="Button1_Click" />--%>
                </div>
          
     <div class="col-md-6" id="PricDetailsDiv" runat="server">
            <h5 class="text-left" style="font-weight:normal">Price Details</h5>
         <hr />
            <h6 class="text-left">Cart Total
            <span class="offset-md-5" style="font-weight:normal">
                <asp:Label ID="Lbl_CartTotal" classs="form-text" runat="server" Text=""></asp:Label></span>
            </h6>
         <br />
         <br />
          <br />
          
         <asp:Button ID="Btn_BuyNow" CssClass="btn offset-md-2 btn-block btn-sm btn-info col-md-8" style="border-radius:15px" runat="server" Text="Buy Now" OnClick="Btn_BuyNow_Click" />
          
     </div>
  </div>
       
            
        <!--End-->

    </div>
          <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   
    </form>
</body>
</html>

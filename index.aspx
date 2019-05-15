<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   
          <!-- Bootstrap -->
          <link href="css/bootstrap.min.css" rel="stylesheet" />

          <!-- CSS -->
          <link href="Custom.css" rel="stylesheet" />

    <title>Home</title>
</head>
<body style="overflow-x:hidden">
    <form id="form1" runat="server">
    <div>
    
          <!--navbar -->
      <nav class="navbar navbar-expand navbar-dark bg-secondary">
                <div class="collapse navbar-collapse"">
                    <div class="navbar-brand">
                        <asp:Label ID="lbl_name" class="card-text" runat="server" Text=""></asp:Label></div>
                      <ul class="navbar-nav ml-auto">
                          <li class="nav-item "><asp:HyperLink ID="HLink" CssClass="nav-link active" runat="server">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link" runat="server" href="Product_userview.aspx">Products</asp:HyperLink></li>


                       <%--  <div class="dropdown">
                              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Reports </button>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenu2"> 
                                  <a class="dropdown-item" type="button" href="ViewProducts.aspx">View Product</a>
                                   <a class="dropdown-item" type="button" href="Users.aspx">User</a>
                                   <a class="dropdown-item" type="button" href="Order.aspx" >Order</a>

                              </div>

                         </div>--%>




                          <li class="nav-item"><asp:HyperLink ID="HCart" CssClass="nav-link" runat="server" href="Cart.aspx">Cart</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HOrder" CssClass="nav-link" runat="server" href="Order_userview.aspx">Orders</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HPayment" CssClass="nav-link" runat="server" href="Payment.aspx">Payment</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HContact" CssClass="nav-link" runat="server" href="Contact.aspx">Contact</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HSign_in" CssClass="nav-link" runat="server" href="Sign_in.aspx">Sign in</asp:HyperLink></li> 
                          <asp:Button ID="Btn_CSignOut" runat="server" class="btn btn-block btn-sm btn-success" Text="Sign out" OnClick="Btn_CSignOut_Click" />              

                      </ul>
               </div>
        </nav>
        
        
        <!--Navbar End-->


        <!--Start-->
   
        <div class="row">
                 <div class="col-md-12" style="background:url(images/back.jpg);background-size:100% 100%;background-attachment:fixed;height:93vh;width:90vw"></div>
        </div>


        <br />


        <div class="row">
                   <div class="col-md-3 ml-5">
                         <img src="images/fb.png" style="width:75px"  />
                         <p class="text-justify">Rloex Perpetual Silver latest with water resistance feature and having a gold body which is very attractive to people</p>
                   </div>

                    <div class="col-md-3 offset-md-1">
                         <img src="images/tw.png" style="width:75px" />
                         <p class="text-justify">Rloex Perpetual Dark latest with water resistance feature and having a gold body which is very attractive to people</p>
                    </div>

                    <div class="col-md-3 offset-md-1">
                         <img src="images/fb.png" style="width:75px" />
                         <p class="text-justify">Rloex Perpetual latest with water resistance feature and having a gold body which is very attractive to people</p>
                    </div>
        </div>
      

        <footer class="col-md-12 modal-footer" >
            
                 <h5 class="figure-caption mr-auto offset-md-5"> Copyright 2019 TECHex </h5> 
            
        </footer>
        
               

        <!--End-->
  </div>    
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminOrderView.aspx.cs" Inherits="AdminOrderView" %>

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

    <title>Admin Order</title>

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
                          <li class="nav-item "><asp:HyperLink ID="AHome" CssClass="nav-link" runat="server" href="Admin.aspx">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="AProducts" CssClass="nav-link" runat="server" href="Product.aspx">Products</asp:HyperLink></li> 
                           <li class="nav-item"><asp:HyperLink ID="ABrand" CssClass="nav-link" runat="server" href="Brand.aspx">Brand</asp:HyperLink></li>  
                          <li class="nav-item"><asp:HyperLink ID="ACategory" CssClass="nav-link" runat="server" href="CAtegory.aspx">Category</asp:HyperLink></li>        
                          <li class="nav-item"><asp:HyperLink ID="AOrder" CssClass="nav-link active" runat="server" href="Order.aspx">Orders</asp:HyperLink></li>           
                          <asp:Button ID="BtnASignOut" class="btn btn-block btn-sm btn-success" runat="server" Text="Sign out" />
                     </ul>
               </div>
        </nav>
        <br />
        
        <!--Navbar End-->


        <br />
        
         <div class="row">
            <div class="col-md-12">
                <h1 class="figure-caption" style="font-size:28px;font-weight:bold">Order</h1>
                <hr />

            </div>
            
        </div>
         <br />
        <br />
        <!--Start-->

           <!--ID-->
          
             <div class="row">

              <div class="col-md-2 offset-md-2">
                          <asp:Label ID="Lbl_OrderID" class="col-form-label text-justify" runat="server" Text="Order ID"></asp:Label>
                </div>

                  <div class="col-md-4">
                         <asp:TextBox ID="Order_TextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                 </div>
                 <div class="col-md-2">
                 <asp:Button ID="BtnEnter" CssClass="btn btn-block btn-info" runat="server" Text="Enter" OnClick="BtnEnter_Click" />
            </div>
                </div>
        <!--ID End-->
          <br />
          <!--Name-->
          
             <div class="row">

              <div class="col-md-2 offset-md-2">
                       <asp:Label ID="Lbl_CustName" class="col-form-label text-left" runat="server" Text="Name"></asp:Label>
                </div>

                  <div class="col-md-4">
                         <asp:TextBox ID="OrderCustTextBox" class="form-control align-self-center" runat="server" ReadOnly="true"></asp:TextBox>
                 </div>
 
             </div>
        <!--Name End-->
        <br />
          <!--Address-->
          
             <div class="row">

              <div class="col-md-2 offset-md-2">
                          <asp:Label ID="Lbl_Address" class="col-form-label" runat="server" Text="Address"></asp:Label>
                </div>

                  <div class="col-md-4">
                         <asp:TextBox ID="AddressTextBox" class="form-control align-self-center" runat="server" ReadOnly="true"></asp:TextBox>
                 </div>
 
             </div>
        <!--Address End-->

    
          <br />
          <!--Card Number-->
             <div class="row">

              <div class="col-md-2 offset-md-2">
                          <asp:Label ID="lbl_CardNumber" class="col-form-label" runat="server" Text="Card_Number"></asp:Label>
                </div>

                  <div class="col-md-4">
                         <asp:TextBox ID="CardNumberTextBox" class="form-control align-self-center" runat="server" ReadOnly="true"></asp:TextBox>
                 </div>
 
             </div>
          <!--Card Number End-->
          <br />
           <!--Amount-->
             <div class="row">

              <div class="col-md-2 offset-md-2">
                          <asp:Label ID="Lbl_Amount" class="col-form-label" runat="server" Text="Amount"></asp:Label>
                </div>

                  <div class="col-md-4">
                         <asp:TextBox ID="AmountTextBox" class="form-control align-self-center" runat="server" ReadOnly="true"></asp:TextBox>
                 </div>
 
             </div>
        <!--Amount End-->
          <br />
          <!--Status-->
             <div class="row">

              <div class="col-md-2 offset-md-2">
                          <asp:Label ID="Lbl_Status" class="col-form-label" runat="server" Text="Status"></asp:Label>
                </div>

                  <div class="col-md-4">
                         <asp:TextBox ID="StatusTextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                 </div>
 
             </div>
        <!--Status End-->
        <br />
        <br />
        <!--BodyText-->
             <div class="row">

              <div class="col-md-4 offset-md-4">
                          <asp:Label ID="Lbl_BodyText" class="col-form-label" runat="server" Text=""></asp:Label>
                </div>
 
             </div>
        <!--Body Text End-->
        <br />
        <!--Go Back Btn-->
             <div class="row">
              <div class="col-md-2 offset-md-8">
                  <asp:Button ID="Btn_Status" CssClass="btn btn-block btn-info" runat="server" Text="Update Status" OnClick="Btn_Status_Click" />
              </div>
         </div>
        <!--Go Back Btn End-->

      
        <!--end-->



    </div>
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>


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

    <title>Payment</title>
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
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link" runat="server" href="Product_userview.aspx">Products</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCart" CssClass="nav-link" runat="server" href="Cart.aspx">Cart</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HOrder" CssClass="nav-link" runat="server"  href="Order_userview.aspx">Orders</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HPayment" CssClass="nav-link active " runat="server">Payment</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HContact" CssClass="nav-link" runat="server" href="Contact.aspx">Contact</asp:HyperLink></li>
                          <asp:Button ID="BtnPaymentSignOut" class="btn btn-block btn-sm btn-success" runat="server" Text="Sign out" OnClick="BtnPaymentSignOut_Click" />
                        </ul>
               </div>
        </nav>
        <br />
        
        <!--Navbar End-->
        <h4 class="figure-caption" style="font-size:32px">Payment</h4>
        <hr />
        <br/>
            <h3 class="figure-caption" style="font-size:32px" id="CartEmptyPay" runat="server"></h3>
        <div class="form-group" id="visiblebody" runat="server">
            <br />
        <!--Payment Details-->
    <!--Name-->
       

               <div class="col-md-12">
        
             <div class="row">
                
                        <div class="col-md-2 offset-md-1">
                              <asp:Label ID="lbl_PayName" class="col-form-label" runat="server" Text="Name"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="PayName_TextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       
                  <!--Payment Details-->
                
            <div class="col-md-4" id="PricDetailsDiv"  runat="server">
                        <h5 class="text-left" style="font-weight:normal">Price Details</h5>
                          <hr />
                        <h5 class="text-left">Total Price
                        <h6 id="Lbl_CartTotal" class="form-text text-danger text-right" runat="server"></h6>
                        </h5>
                  <asp:Button ID="Btn_pay" CssClass="btn btn-block btn-info" runat="server" Text="Pay" OnClick="Btn_pay_Click" />
         </div>
                   <!--Payment Details End-->
                 
          </div>
      
            <!--Name End-->
            <!--Address-->
          
             <div class="row" style="margin-top:-85px;">
                        <div class="col-md-2 offset-md-1">
                              <asp:Label ID="LblPayAddress" class="col-form-label" runat="server" Text="Address"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="PayAddressTextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       
                </div>
        <br />
            <!--Address End-->

             <!--Credit Card-->
          
             <div class="row">
                        <div class="col-md-2 offset-1">
                              <asp:Label ID="LblPayCard" class="col-form-label" runat="server" Text="Card No"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="PayCardTextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="PayCardValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="PayCardTextbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
                   <br />
                  
                    <!--Credit Card End-->
                   <div class="row">
                       <div class="col-md-4 offset-md-8">
                           <asp:Button ID="Btn_Order" CssClass="btn btn-block btn-info" Style="border-radius:15px;" runat="server" Text="Check Order" OnClick="Btn_Order_Click" Visible="false" />
                       </div>
                   </div>
            </div>
             </div>
         </div>   
              
        <br />
        <br />
        <br />
    
           
               <div class="row">
                   <div class="col-md-4 offset-md-2">
                       <asp:Label ID="Lbl_Pay" CssClass="form-text" runat="server" Text=""></asp:Label>
                   </div>
               </div>


         <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

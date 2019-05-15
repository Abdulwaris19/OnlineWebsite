<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

          <!-- Bootstrap -->
          <link href="css/bootstrap.min.css" rel="stylesheet" />

          <!-- CSS -->
          <link href="css/Custom.css" rel="stylesheet" />

    <title>Contacts</title>
    </head>
<body style="overflow-x:hidden">
    <form id="form1" runat="server">
    <div>
 <!--navbar -->
      <nav class="navbar navbar-expand navbar-dark bg-secondary">
                <div class="collapse navbar-collapse"">
                    <div class="navbar-brand">
                        <asp:Label ID="lbl_name" class="card-text" runat="server" Text=""></asp:Label>
                    </div>
                      <ul class="navbar-nav ml-auto">
                                   <li class="nav-item "><asp:HyperLink ID="HLink" CssClass="nav-link" runat="server" href="index.aspx">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HProducts" CssClass="nav-link" runat="server" href="Product_userview.aspx">Products</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCart" CssClass="nav-link" runat="server" href="Cart.aspx">Cart</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HOrder" CssClass="nav-link" runat="server"  href="Order_userview.aspx">Orders</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HPayment" CssClass="nav-link " runat="server">Payment</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HContact" CssClass="nav-link active" runat="server" href="Contact.aspx">Contact</asp:HyperLink></li>
                           <li class="nav-item"><asp:HyperLink ID="HSign_in" CssClass="nav-link" runat="server" href="Sign_in.aspx">Sign in</asp:HyperLink></li> 
                          <asp:Button ID="btn_Sign_out" class="btn btn-block btn-sm btn-success" runat="server" Text="Sign out" OnClick="btn_Sign_out_Click" />
                     </ul>
               </div>
        </nav>

        <!--Navbar End-->

        <!--Start-->

       

     <div class="col-md-12" style="background:url(images/backg.png);background-size:cover; height:8rem">
        <br />
        <br />
        <h2 class="align-text-bottom text-light">Contact Us</h2> 
         </div>
        <!--contact form-->
        <div class="row">
        <div class="card col-md-6 mt-2" style="height:27.5rem;margin-left:2rem">
            <br />
         <h5 class="card-text">Contact Us Today</h5>
            <br />
            <div class="card-body col-md-12">
                <br />
                <div class="row">
                 <asp:TextBox ID="card_Fname" CssClass="form-control col-md-5" runat="server" placeholder="First Name"></asp:TextBox>
             &nbsp<asp:TextBox ID="card_Lname" CssClass="form-control col-md-5" runat="server" placeholder="Last Name"></asp:TextBox>
                </div>
                     <br />
                <div class="row">
                 <asp:TextBox ID="card_Email" CssClass="form-control col-md-5" runat="server" placeholder="Email Address"></asp:TextBox>
             &nbsp <asp:TextBox ID="card_Phone" CssClass="form-control col-md-5" runat="server" placeholder="Phone Number"></asp:TextBox>
                </div>
                <br />
            <div class="row">
                <asp:TextBox ID="card_Country" CssClass="form-control col-md-5" runat="server" placeholder="Country"></asp:TextBox>
             &nbsp<asp:TextBox ID="card_State" CssClass="form-control col-md-5" runat="server" placeholder="State"></asp:TextBox>
              </div>
                <textarea id="card_message" style="resize:none; width:25rem;" class="form-control" rows="4" placeholder="Comments"></textarea>
                <br />
                <asp:Button ID="btn_submit" class="btn btn-danger" style="margin-left:17rem" runat="server" Text="Submit" />
               </div>  
        </div>
         <!--contact form-->

        <div class="col-md-5 mt-5" style="margin-left:1rem">
            <h4 style="margin-top:-2rem;">Map</h4>
             <div style="background:url(images/ubit1.JPG);height:12rem; background-size:cover">
             </div>
          
             <div class="mt-2">
                 <h6 class="text-left text-danger">Email: Warismalick339@gmail.com</h6>
                   <h6 class="text-left">Phone : 0900-78601</h6> 
                   <h6 class="text-left">Address: Department of Computer Science (U.B.I.T)-University of Karachi</h6>
                     
                  <a href="www.facebook.com/xtylish.shaikh"><img src="images/fb.png" style="width:75px" /></a>
                  <a href="www.twitter.com/warismalcik"><img src="images/tw.png" style="width:75px" /></a>
                
             </div> 
           
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

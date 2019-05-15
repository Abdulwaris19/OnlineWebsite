<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

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

    <title>Account</title>

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
                          <li class="nav-item"><asp:HyperLink ID="AOrder" CssClass="nav-link" runat="server" href="AdminOrderView.aspx">Orders</asp:HyperLink></li>  
                          <li class="nav-item"><asp:HyperLink ID="ASign_in" CssClass="nav-link" runat="server" href="Admin.aspx">Sign in</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="AUsers" CssClass="nav-link" runat="server">Users</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="AAccounts" CssClass="nav-link active" runat="server">Accounts</asp:HyperLink></li>
                       
                     </ul>
               </div>
        </nav>
        <br />
        
        <!--Navbar End-->
        <!--Start-->

        <div class="form-group">
           
        
             <div class="row">
                  <div class="col-md-6 offset-md-3">
                       <h3 class="font-italic">Welcome Admin</h3>
                      <hr />
                   </div>
             </div>


            
            <div class="row">
                   <div class="col-md-3 offset-md-4" >
                        <h3 class="font-italic">Accounts</h3>
                       
                   </div>
             </div>
            
          
            <br />
            <div class="row">
                 <div class="col-md-2 offset-md-3">
                       <asp:Label ID="lbl_Prod" runat="server" Text="Total Product Price"></asp:Label>
                    <asp:TextBox ID="ProPrice" CssClass="form-control" runat="server" Text=""  ReadOnly="true"></asp:TextBox>

                </div>
                 <div class="col-md-2">
                       <asp:Label ID="LblTIncome" runat="server" Text="Total Income"></asp:Label>
                    <asp:TextBox ID="TIncomeTextBox" CssClass="form-control" runat="server" Text=""  ReadOnly="true"></asp:TextBox>

                </div>
                <div class="col-md-2">
                    <asp:Label ID="LblProfit" runat="server" Text="Profit"></asp:Label>

                    <asp:TextBox ID="ProfitTextBox" CssClass="form-control" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                </div>
               
                


            </div>
            <br />

            <div class="row">
              <!--table-->
            <asp:Repeater ID="RepeaterPro" runat="server">
                <HeaderTemplate>
                     <table class="table col-md-6">
                <thead>
                    <tr>
        
                       
                        <th>ProductID</th>
                         <th>Price</th>
                         <th>Sell Price</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        
                        <td><%#Eval("ProductID") %></td>              
                        <td><%#Eval("ProductPrice") %></td>
                         <td><%#Eval("ProductSPrice") %></td>
                        
                     
                       
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
             </table>
                </FooterTemplate>
          
                    
                
                </asp:Repeater>
            <!--table-->

           <!--table-->
            <asp:Repeater ID="RepeaterAccountTable" runat="server">
                <HeaderTemplate>
                     <table class="table col-md-6 ">
                <thead>
                    <tr>
        
                       
                        <th>Account ID</th>
                        <th>Order ID</th>
                         <th>Income</th>
                         <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        
                        <td><%#Eval("AccountID") %></td>
                        <td><%#Eval("OrderID") %></td>
                        <td><%#Eval("OrderPrice") %></td>
                        <td><%#Eval("OrderDate") %></td>
                        
                     
                       
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
             </table>
                </FooterTemplate>
          
                    
                
                </asp:Repeater>
            <!--table-->

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

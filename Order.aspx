<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

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

    <title>Order</title>

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
                          <li class="nav-item"><asp:HyperLink ID="HCart" CssClass="nav-link" runat="server" href="Brand.aspx">Brand</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="HCategory" CssClass="nav-link" runat="server" href="Category.aspx">Category</asp:HyperLink></li>  
                          <li class="nav-item"><asp:HyperLink ID="AOrder" CssClass="nav-link active" runat="server" >Orders</asp:HyperLink></li>
                          <asp:Button ID="BtnAOSignout" class="btn btn-block btn-sm btn-success" runat="server" Text="Sign out" OnClick="BtnAOSignout_Click" />  
      
                     </ul>
               </div>
        </nav>

       <br /> 
        <!--Navbar End-->
        
        <!--Start-->

        <div class="form-group">
           
            
            <div class="row">
                   <div class="col-md-3 offset-md-4" >
                        <h3 class="font-italic">Orders</h3>
                       <hr />
                       
                   </div>
             </div>
            <br />
           
            <div class="row">
                   <div class="col-md-9 offset-md-1">
                          <asp:TextBox ID="SearchTextBox" Placeholder="Search" CssClass="form-control align-self-center" runat="server"></asp:TextBox>                
                   </div>
                   <div class="col-md-2">
                         <asp:Button ID="btn_Search" class="btn btn-block btn-success" runat="server" Text="Search" OnClick="btn_Search_Click" />               
                   </div>               
                  <br />      
                 <br />   
              </div>
             <div class="row">
                 <div class="col-md-3 offset-md-9">
                       <asp:CheckBox ID="FilerCheckBox" runat="server" CssClass="form-check" Text="Filter" AutoPostBack="true" />  
                           
                 </div>              
              </div>
               <div class="row">
                   <div class="col-md-2 offset-md-1">
                 <h6>Update Status <a style="text-decoration:none;color:blueviolet" href="AdminOrderView.aspx">Click Here</a></h6>         
                   </div>
                                 
              </div>

              <div class="row">
                  <div class="col-md-2 offset-md-6">
                       <asp:TextBox ID="StatusTextBox" CssClass="form-control" placeholder="Status" runat="server"></asp:TextBox>               
                           <asp:Button ID="BtnOFilter" CssClass="btn btn-block btn-sm btn-info" runat="server" Text="Filter" OnClick="BtnFilter_Click" />
                  </div>
                   <div class="col-md-2">
              </div>

             <!--table-->
            <asp:Repeater ID="RepeaterOrderTable" runat="server">
                <HeaderTemplate>
                     <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer ID</th>
                        <th>Customer Name</th>
                        <th>Card No</th>
                        <th>Date</th>
                        <th>Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("OrderID") %></td>
                        <td><%#Eval("CustomerID") %></td>
                        <td><%#Eval("CustomerName") %></td>
                        <td><%#Eval("CustomerCardNumber") %></td>
                        <td><%#Eval("OrderDate") %></td>
                        <td><%#Eval("OrderTotalPrice") %></td>
                        <td><%#Eval("OrderStatus") %></td>
                        
                        
                       
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
             </table>
                </FooterTemplate>
          
                    
                
                </asp:Repeater>
            <!--table-->
        </div>
        
            <!--End-->

        </div>
        
            <!--End-->

  

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>


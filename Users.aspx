<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

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

    <title>Users</title>

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
                          <li class="nav-item "><asp:HyperLink ID="AHome" CssClass="nav-link " runat="server" href="Admin.aspx">Home</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="AProducts" CssClass="nav-link" runat="server" href="Product.aspx">Products</asp:HyperLink></li>    
                          <li class="nav-item"><asp:HyperLink ID="AOrder" CssClass="nav-link" runat="server" href="AdminOrderView.aspx">Orders</asp:HyperLink></li>  
                          <li class="nav-item"><asp:HyperLink ID="ASign_in" CssClass="nav-link" runat="server" href="Admin.aspx">Sign in</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="AUsers" CssClass="nav-link" runat="server">Users</asp:HyperLink></li>
                          <li class="nav-item"><asp:HyperLink ID="AAccounts" CssClass="nav-link" runat="server">Accounts</asp:HyperLink></li>
                      
                     </ul>
               </div>
        </nav>
        <br />
        
        <!--Navbar End-->
        
        <!--Start-->

        <div class="form-group">
            <br />
            <br />
             <div class="row">
                  <div class="col-md-6 offset-md-3">
                       <h3 class="font-italic">Welcome Admin</h3>
                      <hr />
                   </div>
             </div>


            
            <div class="row">
                   <div class="col-md-3 offset-md-4" >
                        <h3 class="font-italic">Users</h3>
                       
                   </div>
             </div>
            <br />
            <div class="row">
                   <div class="col-md-7 offset-md-1">
                          <asp:TextBox ID="USearchTextBox" Placeholder="Search" CssClass="form-control align-self-center" runat="server" OnTextChanged="SearchTextBox_TextChanged"></asp:TextBox>                
                   </div> 
                <div class="col-md-2">
                    <asp:Button ID="Btn_Search" runat="server" CssClass="btn btn-block btn-success" Text="Search" OnClick="Btn_Search_Click" />          
                   </div>              
                   <div class="col-md-2">
                       <asp:CheckBox ID="FilerCheckBox" runat="server" CssClass="form-check" Text="Filter" AutoPostBack="true" OnCheckedChanged="FilerCheckBox_CheckedChanged" />               
                   </div>               
                <br />
                <br />    
              </div>
              <div class="row">
                  <div class="col-md-2 offset-md-6">
                       <asp:TextBox ID="DateTextBox" CssClass="form-control" placeholder="dd/mm/yyyy" runat="server"></asp:TextBox>  
                      <asp:Button ID="BtnUFilter" CssClass="btn btn-block btn-sm btn-info" runat="server" Text="Filter" OnClick="BtnUFilter_Click" />             
                   </div>            
                        
              </div>
            <br />
             <!--table-->
            <asp:Repeater ID="RepeaterUTable" runat="server">
                <HeaderTemplate>
                     <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>FirsName</th>
                        <th>LastName</th>
                       
                        <th>Email</th>
                        <th>Address</th>
                        <th>Details</th>
                        <th>Registraion Date</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("CustomerID") %></td>
                        <td><%#Eval("First Name") %></td>
                        <td><%#Eval("LastName") %></td>
                        <td><%#Eval("Email") %></td>
                        <td><%#Eval("Address") %></td>
                        <td><%#Eval("Phone No") %></td>
                        <td><%#Eval("Entry_Date") %></td>
                       
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

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>


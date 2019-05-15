<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

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

    <title>Category</title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
     

          <!--Start-->

        <div class="form-group">
            <br />
            <br />
             <div class="row">
                  <div class="col-md-6 offset-md-3">
                        <asp:Label ID="Lbl_CatHead" CssClass="font-italic" style="font-size:28px; font-weight:bold" runat="server" Text="Category"></asp:Label>
                      <hr />
                   </div>
             </div>
            
             <br />
             <br />
             <br />
             <br />

          
      
                    <!--Name-->
          
             <div class="row">
                        <div class="col-md-2 offset-md-2">
                              <asp:Label ID="lbl_Category" class="col-form-label" runat="server" Text="Category"></asp:Label>
                       </div>

                       <div class="col-md-4">
                             <asp:TextBox ID="CatName_TextBox" class="form-control align-self-center" runat="server"></asp:TextBox>
                      </div>
 
                       <div class="col-md-1">
                             <asp:RequiredFieldValidator ID="CatNameValidator" runat="server" ErrorMessage="required*" ForeColor="red" ControlToValidate="CatName_Textbox"></asp:RequiredFieldValidator>
                       </div>
                </div>
        <br />
            <!--Name End-->
            <div class="row">
                <div class="col-md-2 offset-md-6">
                    <asp:Button ID="Btn_AddCat" class="btn btn-block btn-info" runat="server" Text="Add" OnClick="Btn_AddCat_Click" />
                </div>
            </div>
            <br />
               <div class="row">
                <div class="col-md-3 offset-md-5">
                    <asp:Label ID="Lbl_CategoryPage" CssClass="form-text" runat="server" Text=""></asp:Label>
                </div>
            </div>

      <!--End-->


           </div>
     </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    </form>
</body>
</html>

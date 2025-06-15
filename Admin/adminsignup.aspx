<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminsignup.aspx.vb" Inherits="WebApplication1.adminsignup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Sign Up</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signup-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #333;
        }

        input[type="text"], input[type="password"], select {
            width: 100% !important;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        select {
            appearance: none;
            background: white;
        }

        .button-row {
            display: flex;
            gap: 16px;
            margin-top: 24px;
        }

        input[type="submit"], input[type="button"] {
            flex: 1;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #218838;
        }

        input[id*="clear"] {
            background-color: #6c757d;
        }

        input[id*="clear"]:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup-container">

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="txtname" runat="server" TextMode="SingleLine"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Email Id"></asp:Label>
                <asp:TextBox ID="txtemail" runat="server" TextMode="SingleLine"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="UserType"></asp:Label>
                <asp:DropDownList ID="txtlist" runat="server">
                    <asp:ListItem>Customer</asp:ListItem>
                    <asp:ListItem>Waiter</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Phone"></asp:Label>
                <asp:TextBox ID="txtphn" runat="server" TextMode="SingleLine"></asp:TextBox>
            </div>

            <div class="button-row">
                <asp:Button ID="signup" runat="server" Text="Sign Up" />
                <asp:Button ID="clear" runat="server" Text="Clear" />
            </div>

        </div>
    </form>
</body>
</html>

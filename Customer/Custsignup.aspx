<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Custsignup.aspx.vb" Inherits="WebApplication1.signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Signup</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f1f3f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .signup-card {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 700px;
        }

        .signup-card table {
            width: 100%;
        }

        .signup-card td {
            padding: 10px 0;
        }

        .signup-card label {
            font-size: 16px;
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
            color: #333;
        }

        .signup-card input[type="text"],
        .signup-card input[type="email"],
        .signup-card input[type="password"],
        .signup-card input[type="tel"],
        .signup-card select {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .signup-card input:focus,
        .signup-card select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0,123,255,0.2);
        }

        .signup-card .aspNetButton {
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        .signup-card .aspNetButton:hover {
            background-color: #218838;
        }

        .signup-card .clear-button {
            background-color: #6c757d;
        }

        .signup-card .clear-button:hover {
            background-color: #5a6268;
        }

        .button-group {
            display: flex;
            gap: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup-card">
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Label runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtname" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label runat="server" Text="Email Id"></asp:Label>
                        <asp:TextBox ID="txtemail" runat="server" TextMode="Email" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="Usertype"></asp:Label>
                        <asp:DropDownList ID="txtusertype" runat="server">
                            <asp:ListItem>User</asp:ListItem>
                            <asp:ListItem>Waiter</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="txtphn" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="txtphone" runat="server" TextMode="Phone" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-group">
                        <asp:Button ID="Register" runat="server" Text="Sign Up" CssClass="aspNetButton" OnClick="Unnamed1_Click" />
                        <asp:Button ID="Button1" runat="server" Text="Clear" CssClass="aspNetButton clear-button" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

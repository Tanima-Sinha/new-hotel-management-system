<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Custlogin.aspx.vb" Inherits="WebApplication1.login1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Login</title>
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

        .login-card {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 600px;
        }

        .login-card table {
            width: 100%;
        }

        .login-card td {
            padding: 10px 0;
        }

        .login-card label {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
            color: #333;
        }

        .login-card input[type="text"],
        .login-card input[type="email"],
        .login-card input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .login-card input[type="text"]:focus,
        .login-card input[type="email"]:focus,
        .login-card input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0,123,255,0.2);
        }

        .login-card .aspNetButton {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        .login-card .aspNetButton:hover {
            background-color: #0056b3;
        }

        .login-card .secondary-button {
            background-color: #6c757d;
        }

        .login-card .secondary-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <table>
                <tr>
                    <td>
                        <label for="txtemail">Email Id</label>
                        <asp:TextBox ID="txtemail" runat="server" TextMode="Email" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><br />
                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="login" runat="server" Text="Log In" CssClass="aspNetButton" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="signup" runat="server" Text="Sign Up" CssClass="aspNetButton secondary-button" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

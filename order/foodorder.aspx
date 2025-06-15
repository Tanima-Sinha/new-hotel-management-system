<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="foodorder.aspx.vb" Inherits="WebApplication1.foodorder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Order</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 0;
        }

        .form-container {
            background-color: #fff;
            padding: 30px 40px;
            margin: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 500px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            vertical-align: middle;
        }

        .form-container label {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }

        .form-container input[type="text"],
        .form-container select {
            width: 100%;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            box-sizing: border-box;
        }

        .form-container input[type="text"]:focus,
        .form-container select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.25);
        }

        .form-container input[type="submit"],
        .form-container .aspNetButton {
            background-color: #28a745;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover,
        .form-container .aspNetButton:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Food Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server">Dhosa and Chapati</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Food Price"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server">300</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Enter Number of Foods"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <asp:Button ID="btnfoodorder" runat="server" CssClass="aspNetButton" Text="Order" />
                    </td>
                </tr>
            </table>
        </div>

        <div class="form-container">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Food Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server">Chicken Biriyani</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Food Price"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server">500</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Enter Number of Foods"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <asp:Button ID="btnfoododer2" runat="server" CssClass="aspNetButton" Text="Order" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

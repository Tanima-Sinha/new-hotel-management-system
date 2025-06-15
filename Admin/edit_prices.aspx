<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="edit_prices.aspx.vb" Inherits="WebApplication1.edit_prices" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Prices</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .btn-save {
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-save:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 20px;
            font-size: 15px;
            text-align: center;
        }

        @media (max-width: 600px) {
            body {
                padding: 20px;
            }

            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Edit Prices</h2>

            <label for="txtRoomPrice"><asp:Label ID="lblRoomPrice" runat="server" Text="Room Price:"></asp:Label></label>
            <asp:TextBox ID="txtRoomPrice" runat="server" />

            <label for="txtFoodPrice"><asp:Label ID="lblFoodPrice" runat="server" Text="Food Price:"></asp:Label></label>
            <asp:TextBox ID="txtFoodPrice" runat="server" />

            <label for="txtRestaurantPrice"><asp:Label ID="lblRestaurantPrice" runat="server" Text="Restaurant Price:"></asp:Label></label>
            <asp:TextBox ID="txtRestaurantPrice" runat="server" />

            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn-save" OnClick="btnSave_Click" />

            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" CssClass="message" />
        </div>
    </form>
</body>
</html>

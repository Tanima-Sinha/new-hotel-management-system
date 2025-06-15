<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="foodorder_confirmation.aspx.vb" Inherits="WebApplication1.foodorder_confirmation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Order Confirmation</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 60px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container asp\:Label {
            font-size: 20px;
            font-weight: bold;
            color: #333333;
        }

        .btn {
            height: 58px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin: 10px;
            cursor: pointer;
        }

        #btnconfirmorder {
            background-color: #28a745;
            color: white;
            width: 207px;
        }

        #btncancelorder {
            background-color: #dc3545;
            color: white;
            width: 223px;
        }

        #pnlChoice {
            margin-top: 30px;
        }

        #lblChoice {
            font-size: 18px;
            color: #333333;
        }

        #btnRoom, #btnRestaurant {
            width: 120px;
            height: 45px;
            font-size: 14px;
            margin: 10px;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <asp:Label ID="Label1" runat="server" Text="Are You Confirm To Order Food?"></asp:Label>
            <br /><br />

            <asp:Button ID="btnconfirmorder" runat="server" Text="Confirm Order" CssClass="btn" />
            <asp:Button ID="btncancelorder" runat="server" Text="Cancel Order" CssClass="btn" />

            <!-- Room/Restaurant Choice Panel -->
            <asp:Panel ID="pnlChoice" runat="server" Visible="false">
                <br /><br />
                <asp:Label ID="lblChoice" runat="server" Text="Do you want to have food in Room or Restaurant?" Font-Bold="True" />
                <br /><br />
                <asp:Button ID="btnRoom" runat="server" Text="Room" OnClick="btnRoom_Click" />
                <asp:Button ID="btnRestaurant" runat="server" Text="Restaurant" OnClick="btnRestaurant_Click" />
            </asp:Panel>

        </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="resturantbook.aspx.vb" Inherits="WebApplication1.resturantbook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant Booking</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 20px;
            gap: 40px;
        }

        .card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
            padding: 25px 55px;
            width: 100%;
            max-width: 400px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bolder;
            color: #333;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .btn-book {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            background-color: #007bff;
            color: #ffffff;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .btn-book:hover {
            background-color: #0056b3;
        }

        @media screen and (max-width: 480px) {
            .card {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">

            <!-- Vivanta Card -->
            <div class="card">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Restaurant Type"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Text="Vivanta"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Price"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" Text="1000"></asp:TextBox>
                </div>
                <asp:Button ID="btnbookrest" runat="server" Text="Book" CssClass="btn-book" />
            </div>

            <!-- PaperMoon Card -->
            <div class="card">
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Restaurant Type"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" Text="PaperMoon"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Price"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server" Text="1500"></asp:TextBox>
                </div>
                <asp:Button ID="btnbookrest2" runat="server" Text="Book" CssClass="btn-book" />
            </div>

        </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="bookingrest_confirmation.aspx.vb" Inherits="WebApplication1.bookingrest_confirmation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking Confirmation</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background-color: #f2f4f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            max-width: 700px;
            margin: 100px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h2 {
            font-size: 20px;
            color: #333333;
            margin-bottom: 30px;
        }

        .btn {
            padding: 14px 24px;
            font-size: 15px;
            font-weight: 600;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin: 10px;
            width: 90%;
            max-width: 300px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        @media (min-width: 600px) {
            .btn-group {
                display: flex;
                justify-content: space-between;
                gap: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>
                <asp:Label ID="Label1" runat="server" Text="Are You Confirm For Booking Restaurant?"></asp:Label>
            </h2>
            <div class="btn-group">
                <asp:Button ID="btnconfirmresturant" runat="server" CssClass="btn" Text="Confirm Booking Restaurant" />
                <asp:Button ID="btncancelresturant" runat="server" CssClass="btn" Text="Cancel Booking Restaurant" />
            </div>
        </div>
    </form>
</body>
</html>

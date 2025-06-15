<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="room.aspx.vb" Inherits="WebApplication1.room" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book a Room</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
            justify-content: center;
            padding: 40px;
        }

        .room-card {
            background-color: #fff;
            padding: 30px 25px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            width: 300px;
        }

        .room-card h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #444;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .book-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            border-radius: 8px;
            margin-top: 10px;
        }

        .book-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            
            <!-- Family Room Card -->
            <div class="room-card">
                <h2>Family Room</h2>
                <div class="form-group">
                    <label>Room Type</label>
                    <asp:TextBox ID="TextBox1" runat="server" Text="Family and Kids" />
                </div>
                <div class="form-group">
                    <label>Room Price</label>
                    <asp:TextBox ID="TextBox2" runat="server" Text="1500" />
                </div>
                <div class="form-group">
                    <label>Available Rooms</label>
                    <asp:TextBox ID="TextBox3" runat="server" Text="10" />
                </div>
                <div class="form-group">
                    <label>How many rooms?</label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>No selection</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="family_room" runat="server" Text="Book" CssClass="book-button" />
            </div>

            <!-- Single Room Card -->
            <div class="room-card">
                <h2>Single Room</h2>
                <div class="form-group">
                    <label>Room Type</label>
                    <asp:TextBox ID="TextBox4" runat="server" Text="Single" />
                </div>
                <div class="form-group">
                    <label>Room Price</label>
                    <asp:TextBox ID="TextBox5" runat="server" Text="1000" />
                </div>
                <div class="form-group">
                    <label>Available Rooms</label>
                    <asp:TextBox ID="TextBox6" runat="server" Text="8" />
                </div>
                <div class="form-group">
                    <label>How many rooms?</label>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>No selection</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="single_room" runat="server" Text="Book" CssClass="book-button" />
            </div>

        </div>
    </form>
</body>
</html>

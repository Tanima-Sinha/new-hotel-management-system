<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="homepage.aspx.vb" Inherits="WebApplication1.homepage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home | WebApplication1</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa; 
            color: #333;
            line-height: 1.7; 
            overflow-x: hidden;
        }

        .hero {
            background: url('https://via.placeholder.com/1600x600?text=Welcome+Image') no-repeat center center/cover;
            color: white;
            text-align: center;
            padding: 180px 0; 
            position: relative;
            margin-bottom: 40px; 
        }

        .hero-overlay {
            background-color: rgba(0, 0, 0, 0.6); 
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .hero h1 {
            font-size: 4em;
            margin-bottom: 25px;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.7);
            color: #ffc107; 
        }

        .hero p {
            font-size: 1.3em;
            max-width: 700px; 
            margin: 0 auto 40px; 
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
        }

        .hero .asp-button {
            background-color: #007bff;
            color: white;
            padding: 18px 35px; 
            text-decoration: none;
            border-radius: 10px; 
            font-size: 1.2em;
            transition: background-color 0.3s ease, transform 0.2s ease;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15); 
        }

        .hero .asp-button:hover {
            background-color: #0056b3;
            transform: translateY(-3px); 
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .dropdown-section {
            padding: 50px 30px; 
            text-align: center;
            background-color: #fff;
            box-shadow: 0 3px 7px rgba(0, 0, 0, 0.07); 
            margin-bottom: 40px; 
        }

        .dropdown-section h2 {
            font-size: 2.8em; 
            margin-bottom: 35px;
            color: #28a745; 
        }

        .dropdown-row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 25px; 
            margin-bottom: 40px; 
        }

        select {
            padding: 14px 18px; 
            font-size: 17px;
            border: 1px solid #ced4da; 
            border-radius: 8px;
            min-width: 220px; 
            transition: border-color 0.3s ease;
        }

        select:focus {
            outline: none;
            border-color: #007bff; 
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); 
        }

        .button-group {
            margin-top: 40px; 
            display: flex;
            justify-content: center;
            gap: 25px; 
            flex-wrap: wrap;
        }

        .button-group .asp-button {
            background-color: #dc3545; 
            color: white;
            padding: 15px 30px; 
            border: none;
            border-radius: 8px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .button-group .asp-button:hover {
            background-color: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
        }

        .featured-section {
            padding: 70px 30px; 
            text-align: center;
            background-color: #e9ecef; 
        }

        .featured-section h2 {
            font-size: 3em; 
            margin-bottom: 40px;
            color: #6f42c1; 
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); 
            gap: 40px; 
            margin-top: 40px;
        }

        .feature-item {
            background-color: #fff;
            padding: 30px; 
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.06); 
            text-align: left;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .feature-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.08);
        }

        .feature-item h3 {
            font-size: 1.7em;
            margin-bottom: 15px;
            color: #007bff; 
        }

        .feature-item p {
            color: #555; 
            line-height: 1.8;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="hero">
            <div class="hero-overlay">
                <h1>Welcome to Our Amazing Service</h1>
                <p>Experience the best solutions tailored just for you. Discover a world of possibilities and join our vibrant community today!</p>
                <asp:Button ID="HeroButton" runat="server" Text="Explore Now" CssClass="asp-button" />
            </div>
        </div>

        <div class="dropdown-section">
            <h2>Get Started Quickly</h2>
            <div class="dropdown-row">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem>Sign Up</asp:ListItem>
                    <asp:ListItem>Sign up as customer</asp:ListItem>
                    <asp:ListItem>Sign up as admin</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                    <asp:ListItem>Log In</asp:ListItem>
                    <asp:ListItem>Login as customer</asp:ListItem>
                    <asp:ListItem>Login as admin</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
                    <asp:ListItem>Book</asp:ListItem>
                    <asp:ListItem>Book room</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="button-group">
                <asp:Button ID="Button2" runat="server" Text="Make an Order" CssClass="asp-button" />
                <asp:Button ID="btnprofile" runat="server" Text="Your Profile" CssClass="asp-button" />
            </div>
        </div>

        <div class="featured-section">
            <h2>Key Features You'll Love</h2>
            <div class="feature-grid">
                <div class="feature-item">
                    <h3>Intuitive Interface</h3>
                    <p>Our platform boasts a user-friendly design, making navigation seamless and enjoyable for everyone.</p>
                </div>
                <div class="feature-item">
                    <h3>Powerful Functionality</h3>
                    <p>Unlock a wide range of tools and features designed to help you achieve your goals efficiently and effectively.</p>
                </div>
                <div class="feature-item">
                    <h3>Dedicated Support</h3>
                    <p>Our expert support team is always ready to assist you with any questions or issues you may encounter.</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
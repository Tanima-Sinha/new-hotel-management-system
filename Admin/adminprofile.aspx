<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminprofile.aspx.vb" Inherits="WebApplication1.adminprofile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            padding: 40px;
        }

        .profile-box, .edit-box {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            max-width: 600px;
        }

        h3 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            margin-bottom: 12px;
        }

        strong {
            display: inline-block;
            width: 120px;
            color: #555;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .action-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 20px;
        }

        .action-buttons > * {
            padding: 10px 20px;
            font-size: 15px;
            border: none;
            border-radius: 8px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .action-buttons > *:hover {
            background-color: #0056b3;
        }

        .dropdown-panel {
            margin-top: 20px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .dropdown-panel select {
            height: 42px;
            font-size: 15px;
            padding: 8px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .edit-button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            height: 42px;
        }

        .edit-button:hover {
            background-color: #218838;
        }

        @media screen and (max-width: 768px) {
            .profile-box, .edit-box {
                width: 100%;
            }

            .dropdown-panel {
                flex-direction: column;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <!-- View Profile Panel -->
            <asp:Panel ID="ProfilePanel" runat="server" Visible="False" CssClass="profile-box">
                <h3>Admin Profile</h3>
                <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server" /></p>
                <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
                <p><strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" /></p>
                <p><strong>User Type:</strong> <asp:Label ID="lblUserType" runat="server" /></p>
            </asp:Panel>

            <!-- Edit Profile Panel -->
            <asp:Panel ID="EditProfilePanel" runat="server" Visible="False" CssClass="edit-box">
                <h3>Edit Profile</h3>
                <p><strong>Email:</strong> <asp:TextBox ID="txtemail" runat="server" /></p>
                <p><strong>Password:</strong> <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" /></p>
                <p><strong>Phone:</strong> <asp:TextBox ID="TextBox1" runat="server" /></p>
                <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn btn-success" />
            </asp:Panel>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <asp:Button ID="btnProfile" runat="server" Text="View Profile" OnClick="btnProfile_Click" />
                <asp:Button ID="btneditprofile" runat="server" Text="Edit Profile" OnClick="btneditprofile_Click" />
            </div>

            <!-- Dropdown & Edit Button -->
            <div class="dropdown-panel">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem>Edit Price</asp:ListItem>
                    <asp:ListItem>Edit Room Price</asp:ListItem>
                    <asp:ListItem>Edit Food Price</asp:ListItem>
                    <asp:ListItem>Edit Restaurant Price</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnEditPrices" runat="server" Text="Edit Prices" CssClass="edit-button" OnClick="btnEditPrices_Click" />
            </div>

        </div>
    </form>
</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CustProfile.aspx.vb" Inherits="WebApplication1.CustProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Profile</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            margin-top: 60px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 700px;
        }

        h3 {
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
        }

        .profile-box p,
        .edit-box p {
            margin: 10px 0;
            font-size: 16px;
        }

        .edit-box input[type="email"],
        .edit-box input[type="password"],
        .edit-box input[type="tel"] {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .edit-box input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0,123,255,0.25);
        }

        .button-row {
            margin-top: 30px;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 10px 18px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- View Profile Panel -->
            <asp:Panel ID="ProfilePanel" runat="server" Visible="False" CssClass="profile-box">
                <h3>Customer Profile</h3>
                <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server" /></p>
                <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
                <p><strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" /></p>
                <p><strong>User Type:</strong> <asp:Label ID="lblUserType" runat="server" /></p>
            </asp:Panel>

            <!-- Edit Profile Panel -->
            <asp:Panel ID="EditProfilePanel" runat="server" Visible="False" CssClass="edit-box">
                <h3>Edit Profile</h3>
                <p><strong>Email:</strong><br />
                    <asp:TextBox ID="txtemail" runat="server" TextMode="Email" />
                </p>
                <p><strong>Password:</strong><br />
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" />
                </p>
                <p><strong>Phone:</strong><br />
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Phone" />
                </p>
                <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="btnSaveProfile_Click" />
            </asp:Panel>

            <!-- Action Buttons -->
            <div class="button-row">
                <asp:Button ID="btnProfile" runat="server" Text="View Profile" CssClass="btn btn-primary" OnClick="btnProfile_Click" />
                <asp:Button ID="Btnhistory" runat="server" Text="View History" CssClass="btn btn-secondary" OnClick="btnHistory_Click" />
                <asp:Button ID="btneditprofile" runat="server" Text="Edit Profile" CssClass="btn btn-primary" OnClick="btneditprofile_Click" />
            </div>
        </div>
    </form>
</body>
</html>

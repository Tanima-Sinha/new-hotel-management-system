Imports System.Data.SqlClient

Public Class adminprofile
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True")


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loggedInUser") Is Nothing Then
            Response.Redirect("adminlogin.aspx")
        End If
    End Sub

    Protected Sub btnProfile_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnProfile.Click

        Dim email As String = Session("loggedInUser").ToString()
        Dim cmd As New SqlCommand("SELECT ad_name, ad_email, ad_phn, ad_usertype FROM admin WHERE ad_email = @Email", con)
        cmd.Parameters.AddWithValue("@Email", email)

        con.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.Read() Then
            lblName.Text = reader("ad_name").ToString()
            lblEmail.Text = reader("ad_email").ToString()
            lblPhone.Text = reader("ad_phn").ToString()
            lblUserType.Text = reader("ad_usertype").ToString()
            ProfilePanel.Visible = True
        End If
        con.Close()

    End Sub


    Protected Sub btneditprofile_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btneditprofile.Click

        Dim email As String = Session("loggedInUser").ToString()
        Dim cmd As New SqlCommand("SELECT ad_email, ad_phn, ad_pwd FROM admin WHERE ad_email = @Email", con)
        cmd.Parameters.AddWithValue("@Email", email)

        con.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.Read() Then
            txtemail.Text = reader("ad_email").ToString()
            txtPwd.Text = reader("ad_pwd").ToString()
            TextBox1.Text = reader("ad_phn").ToString()
            EditProfilePanel.Visible = True
            ProfilePanel.Visible = False
        End If
        reader.Close()
        con.Close()

    End Sub


    Protected Sub btnSaveProfile_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSaveProfile.Click

        Dim email As String = Session("loggedInUser").ToString()
        Dim newEmail As String = txtemail.Text
        Dim newPhone As String = TextBox1.Text
        Dim newPwd As String = txtPwd.Text

        Dim cmd As New SqlCommand("UPDATE admin SET ad_email = @NewEmail, ad_phn = @Phone, ad_pwd = @Pwd WHERE ad_email = @OldEmail", con)
        cmd.Parameters.AddWithValue("@NewEmail", newEmail)

        cmd.Parameters.AddWithValue("@Phone", newPhone)
        cmd.Parameters.AddWithValue("@Pwd", newPwd)
        cmd.Parameters.AddWithValue("@OldEmail", email)

        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()

        lblEmail.Text = newEmail
        lblPhone.Text = newPhone
        EditProfilePanel.Visible = False
        ProfilePanel.Visible = True


    End Sub

   

    Protected Sub btnEditPrices_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEditPrices.Click
        Response.Redirect("edit_prices.aspx")
    End Sub
End Class
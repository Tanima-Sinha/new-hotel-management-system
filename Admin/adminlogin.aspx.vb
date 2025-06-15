Imports System.Data.SqlClient

Public Class adminlogin
    Inherits System.Web.UI.Page

    Dim conn As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("email") IsNot Nothing AndAlso Session("password") IsNot Nothing Then
                txtemail.Text = Session("email").ToString()
                txtpwd.Text = Session("password").ToString()
            End If
        End If

    End Sub

    Protected Sub login_Click(ByVal sender As Object, ByVal e As EventArgs) Handles login.Click

        Try

            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM admin WHERE ad_email=@Email AND ad_pwd=@Pwd", conn)
            cmd.Parameters.AddWithValue("@Email", txtemail.Text)
            cmd.Parameters.AddWithValue("@Pwd", txtpwd.Text)

            conn.Open()
            Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())
            conn.Close()


            If count > 0 Then
                MsgBox("Login successful!")

                ' Optional: You can store login session for user tracking
                Session("loggedInUser") = txtemail.Text

                Response.Redirect("adminprofile.aspx")
            Else
                MsgBox("Invalid email or password.")
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
        End Try


    End Sub
End Class
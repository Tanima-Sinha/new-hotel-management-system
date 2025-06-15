Imports System.Data.SqlClient

Public Class login1
    Inherits System.Web.UI.Page

    Dim conn As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not IsPostBack AndAlso Session("loggedInUser") IsNot Nothing Then
        'Response.Redirect("CustProfile.aspx")
        'End If


    End Sub

    Protected Sub login_Click(ByVal sender As Object, ByVal e As EventArgs) Handles login.Click

        Try

            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM customer WHERE cust_email=@Email AND cust_pwd=@Pwd", conn)
            cmd.Parameters.AddWithValue("@Email", txtemail.Text)
            cmd.Parameters.AddWithValue("@Pwd", txtpwd.Text)

            conn.Open()
            Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())
            conn.Close()


            If count > 0 Then
                ' Successful login
                Session("loggedInUser") = txtemail.Text.Trim()

                ' Redirect to ReturnUrl if it exists
                Dim returnUrl As String = Request.QueryString("ReturnUrl")
                If Not String.IsNullOrEmpty(returnUrl) Then
                    Response.Redirect(returnUrl)
                Else
                    ' If no ReturnUrl, go to default profile page
                    Response.Redirect("CustProfile.aspx")
                End If
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

    Protected Sub signup_Click(ByVal sender As Object, ByVal e As EventArgs) Handles signup.Click

        ' Redirect to signup page
        Response.Redirect("Custsignup.aspx")



    End Sub
End Class
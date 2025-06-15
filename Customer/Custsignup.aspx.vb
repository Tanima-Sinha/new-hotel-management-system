Imports System.Data.SqlClient
Imports System.Text.RegularExpressions

Public Class signup
    Inherits System.Web.UI.Page
    Dim conn As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Unnamed1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Register.Click
        Try

            ' Input Validation
            If Not Regex.IsMatch(txtemail.Text, "^[^@\s]+@[^@\s]+\.[^@\s]+$") Then
                MsgBox("Invalid email format.")
                Exit Sub
            End If

            If Not Regex.IsMatch(txtphone.Text, "^\d{10}$") Then
                MsgBox("Phone number must be 10 digits.")
                Exit Sub
            End If

            If Not Regex.IsMatch(txtname.Text, "^[A-Za-z\s]+$") Then
                MsgBox("Name should contain only letters and spaces.")
                Exit Sub
            End If

            ' Check if email and password already exist
            Dim checkCmd As New SqlCommand("SELECT COUNT(*) FROM customer WHERE cust_email=@Email AND cust_pwd=@Pwd", conn)
            checkCmd.Parameters.AddWithValue("@Email", txtemail.Text)
            checkCmd.Parameters.AddWithValue("@Pwd", txtpwd.Text)

            conn.Open()
            Dim count As Integer = Convert.ToInt32(checkCmd.ExecuteScalar())
            conn.Close()

            If count > 0 Then
                MsgBox("Account already exists. Please log in.")
                Response.Redirect("Custlogin.aspx")
            Else


                ' Insert new user
                Dim insertCmd As New SqlCommand("INSERT INTO customer(cust_name, cust_email, cust_pwd, cust_usertype, cust_phn) VALUES(@Name, @Email, @Pwd, @Usertype, @Phone)", conn)
                insertCmd.Parameters.AddWithValue("@Name", txtname.Text)
                insertCmd.Parameters.AddWithValue("@Email", txtemail.Text)
                insertCmd.Parameters.AddWithValue("@Pwd", txtpwd.Text)
                insertCmd.Parameters.AddWithValue("@Usertype", txtusertype.Text)
                insertCmd.Parameters.AddWithValue("@Phone", txtphone.Text)

                conn.Open()
                insertCmd.ExecuteNonQuery()
                conn.Close()

                ' Store email and password in session
                Session("email") = txtemail.Text
                Session("password") = txtpwd.Text

                MsgBox("Registration successful.")
                Response.Redirect("Custlogin.aspx")

            End If

        Catch ex As Exception
            MsgBox(ex.Message)
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If

        End Try

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        

    End Sub
End Class
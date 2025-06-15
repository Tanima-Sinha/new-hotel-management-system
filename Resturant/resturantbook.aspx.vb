
Imports System.Data.SqlClient

Public Class resturantbook
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True;Pooling=False")


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            con.Open()
            Dim cmd As New SqlCommand("SELECT TOP 1 price FROM resturant", con)
            Dim price As Object = cmd.ExecuteScalar()

            If price IsNot Nothing Then
                TextBox2.Text = price.ToString()
            End If


        End If

    End Sub

    Protected Sub btnbookrest_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnbookrest.Click

        If Session("loggedInUser") Is Nothing Then
            Response.Redirect("Custlogin.aspx")
        Else
            Dim type As String = TextBox1.Text
            Dim price As Integer = Convert.ToInt32(TextBox2.Text)

            con.Open()
            Dim cmd As New SqlCommand("INSERT INTO resturant (type, price, status) VALUES (@type, @price, 'pending')", con)
            cmd.Parameters.AddWithValue("@type", type)
            cmd.Parameters.AddWithValue("@price", price)
            cmd.ExecuteNonQuery()
            con.Close()

            ' Store price in session for later update
            Session("price") = price
            Response.Redirect("bookingrest_confirmation.aspx")
        End If
    End Sub



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnbookrest2.Click
        If Session("loggedInUser") Is Nothing Then
            Response.Redirect("Custlogin.aspx")
        Else
            Dim type As String = TextBox3.Text
            Dim price As Integer = Convert.ToInt32(TextBox4.Text)

            con.Open()
            Dim cmd As New SqlCommand("INSERT INTO resturant (type, price, status) VALUES (@type, @price, 'pending')", con)
            cmd.Parameters.AddWithValue("@type", type)
            cmd.Parameters.AddWithValue("@price", price)
            cmd.ExecuteNonQuery()
            con.Close()

            ' Store price in session for later update
            Session("price") = price
            Response.Redirect("bookingrest_confirmation.aspx")
        End If
    End Sub
End Class
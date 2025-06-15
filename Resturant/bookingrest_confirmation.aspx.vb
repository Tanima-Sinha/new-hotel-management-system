Imports System.Data.SqlClient

Public Class bookingrest_confirmation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnconfirmresturant_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnconfirmresturant.Click
        UpdateBookingStatus("confirmed")
    End Sub

    Protected Sub btncancelresturant_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btncancelresturant.Click
        UpdateBookingStatus("cancelled")
    End Sub

    Private Sub UpdateBookingStatus(ByVal status As String)
        Dim con As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True;Pooling=False")
        Dim cust_email As String = Session("loggedInUser").ToString()
        Dim price As Integer = Convert.ToInt32(Session("price"))

        con.Open()
        
        ' 1. Update ALL restaurant bookings for this customer (simplified due to no booking_time/id)

        Dim sql As String = "UPDATE resturant SET status = @status WHERE cust_email = @cust_email AND status = 'pending'"
        Dim cmd1 As New SqlCommand(sql, con)
        cmd1.Parameters.AddWithValue("@status", status)
        cmd1.Parameters.AddWithValue("@cust_email", cust_email)
        cmd1.ExecuteNonQuery()

       


        'cmd1.Parameters.AddWithValue("@status", status)
        cmd1.ExecuteNonQuery()


            ' Update customer amount
        Dim cmd2 As SqlCommand
        If status = "confirmed" Then
            cmd2 = New SqlCommand("UPDATE customer SET amount = amount + @price WHERE cust_email = @cust_email", con)
        Else
            cmd2 = New SqlCommand("UPDATE customer SET amount = amount - @price WHERE cust_email = @cust_email", con)
            End If
        cmd2.Parameters.AddWithValue("@price", price)
        cmd2.Parameters.AddWithValue("@cust_email", cust_email)
        cmd2.ExecuteNonQuery()

        con.Close()

        Dim url As String = ResolveUrl("~/homepage/homepage.aspx")
        If status = "confirmed" Then
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Booking Confirmed');window.location='" & url & "';", True)
        Else
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Booking Cancelled');window.location='" & url & "';", True)
        End If


    End Sub


End Class
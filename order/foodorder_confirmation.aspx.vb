Imports System.Data.SqlClient

Public Class foodorder_confirmation
    Inherits System.Web.UI.Page


    Dim connstr As String = "Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True"


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loggedInUser") Is Nothing Then
            Response.Redirect("Custlogin.aspx")
        End If

        If Not IsPostBack Then
            pnlChoice.Visible = False ' Hide panel only on first page load
        End If

        'pnlChoice.Visible = False ' Hide panel initially
    End Sub

    Protected Sub btnconfirmorder_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnconfirmorder.Click
        HandleOrderUpdate(isConfirmed:=True)
    End Sub

    Protected Sub btncancelorder_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btncancelorder.Click
        HandleOrderUpdate(isConfirmed:=False)
    End Sub


    Private Sub HandleOrderUpdate(ByVal isConfirmed As Boolean)
        Dim cust_email As String = Session("loggedInUser")
        Dim totalAmountChange As Decimal = 0

        Dim pendingOrders As New List(Of Tuple(Of String, Decimal, Integer)) ' food_name, food_price, no_of_foods

        Using conn As New SqlConnection(connstr)
            conn.Open()

            ' 1. Get all pending orders for the customer
            Dim getOrdersQuery As String = "SELECT food_name, food_price, no_of_food FROM [order] WHERE cust_email = @cust_email AND status = 'pending'"
            Using cmdGetOrders As New SqlCommand(getOrdersQuery, conn)
                cmdGetOrders.Parameters.AddWithValue("@cust_email", cust_email)
                Using reader As SqlDataReader = cmdGetOrders.ExecuteReader()
                    While reader.Read()
                        Dim fname As String = reader("food_name").ToString()
                        Dim fprice As Decimal = Convert.ToDecimal(reader("food_price"))
                        Dim qty As Integer = Convert.ToInt32(reader("no_of_food"))
                        totalAmountChange += fprice * qty
                        pendingOrders.Add(Tuple.Create(fname, fprice, qty))
                    End While
                End Using
            End Using

            ' 2. Check if room is booked
            Dim newAmount As Decimal = 0 ' Declare early so it's accessible

            Dim cmdCheck As New SqlCommand("SELECT amount FROM customer WHERE cust_email = @cust_email", conn)
            cmdCheck.Parameters.AddWithValue("@cust_email", cust_email)
            Dim result = cmdCheck.ExecuteScalar()

            If result IsNot Nothing AndAlso Not Convert.IsDBNull(result) Then
                ' Room is booked
                Dim currentAmount As Decimal = Convert.ToDecimal(result)
                newAmount = If(isConfirmed, currentAmount + totalAmountChange, currentAmount - totalAmountChange)

                ' Continue with your update logic
            Else
                ' No value found, handle as needed (e.g., show message or redirect)
                pnlChoice.Visible = True
                Return ' Exit the method to avoid running update below
            End If

            ' Now it's safe to use newAmount here:
            Dim cmdUpdate As New SqlCommand("UPDATE room SET amount = @amount WHERE cust_email = @cust_email", conn)
            cmdUpdate.Parameters.AddWithValue("@amount", newAmount)
            cmdUpdate.Parameters.AddWithValue("@cust_email", cust_email)
            cmdUpdate.ExecuteNonQuery()

                ' 4. Update order status
                Dim newStatus As String = If(isConfirmed, "confirmed", "cancelled")
                Dim cmdUpdateOrderStatus As New SqlCommand("UPDATE [order] SET status = @status WHERE cust_email = @cust_email AND status = 'pending'", conn)
                cmdUpdateOrderStatus.Parameters.AddWithValue("@status", newStatus)
                cmdUpdateOrderStatus.Parameters.AddWithValue("@cust_email", cust_email)
                cmdUpdateOrderStatus.ExecuteNonQuery()

                ' 5. Redirect
                Response.Redirect("homepage.aspx")

                ' Room not booked, show panel to choose
                pnlChoice.Visible = True

        End Using
    End Sub





    Protected Sub btnRoom_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnRoom.Click
        Response.Redirect("~/room/room.aspx")
    End Sub

    Protected Sub btnRestaurant_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnRestaurant.Click
        Response.Redirect("~/Resturant/resturantbook.aspx")
    End Sub
End Class
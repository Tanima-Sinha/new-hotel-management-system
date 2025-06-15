Imports System.Data.SqlClient

Public Class room
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'If Session("loggedInUser") Is Nothing Then
        'Response.Redirect("~/Customer/Custlogin.aspx")
        'End If

        If Not IsPostBack Then
            Dim con As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True")

            con.Open()
            Dim cmd As New SqlCommand("SELECT TOP 1 room_price FROM room", con)
            Dim price As Object = cmd.ExecuteScalar()

            If price IsNot Nothing Then
                TextBox2.Text = price.ToString()
            End If


        End If

    End Sub



    Protected Sub family_room_Click(ByVal sender As Object, ByVal e As EventArgs) Handles family_room.Click
        HandleRoomBooking(TextBox1, TextBox2, TextBox3, DropDownList1)

    End Sub

    Protected Sub single_room_Click(ByVal sender As Object, ByVal e As EventArgs) Handles single_room.Click
        HandleRoomBooking(TextBox4, TextBox5, TextBox6, DropDownList2)
    End Sub


    Private Sub HandleRoomBooking(ByVal roomTypeBox As TextBox, ByVal priceBox As TextBox, ByVal availableBox As TextBox, ByVal dropdown As DropDownList)
        If dropdown.SelectedIndex = 0 OrElse String.IsNullOrWhiteSpace(dropdown.SelectedValue) Then
            MsgBox("Please select how many rooms you want.")
            Exit Sub
        End If

        Dim roomsRequested As Integer = Convert.ToInt32(dropdown.SelectedValue)
        Dim availableRooms As Integer = Convert.ToInt32(availableBox.Text.Trim())

        If roomsRequested > availableRooms Then
            MsgBox("You can't book more rooms than are available.")
            Exit Sub
        Else
            ' Store data in session and redirect
            Session("room_type") = roomTypeBox.Text.Trim()
            Session("room_price") = Convert.ToInt32(priceBox.Text.Trim())
            Session("rooms_requested") = roomsRequested
            Session("status") = "not booked"

            If Session("loggedInUser") Is Nothing Then
                Response.Redirect("~/Customer/Custlogin.aspx")
            Else
                Response.Redirect("bookingroom_confirmation.aspx")
            End If
        End If
    End Sub

End Class
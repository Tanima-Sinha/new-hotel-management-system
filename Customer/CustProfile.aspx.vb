Imports System.Data.SqlClient

Public Class CustProfile
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True")


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("loggedInUser") Is Nothing Then
            Response.Redirect("Custlogin.aspx")
        End If

    End Sub

    Protected Sub btnProfile_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnProfile.Click

        Dim email As String = Session("loggedInUser").ToString()
        Dim cmd As New SqlCommand("SELECT cust_name, cust_email, cust_phn, cust_usertype FROM customer WHERE cust_email = @Email", con)
        cmd.Parameters.AddWithValue("@Email", email)

        con.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.Read() Then
            lblName.Text = reader("cust_name").ToString()
            lblEmail.Text = reader("cust_email").ToString()
            lblPhone.Text = reader("cust_phn").ToString()
            lblUserType.Text = reader("cust_usertype").ToString()
            ProfilePanel.Visible = True
        End If
        con.Close()

    End Sub


    Protected Sub btnHistory_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Btnhistory.Click

        Dim email As String = Session("loggedInUser").ToString()
        Dim totalAmount As Decimal = 0
        Dim historyText As String = ""

        con.Open()

        ' Room Booking History
        Dim cmdRoom As New SqlCommand("SELECT room_type, room_price FROM room WHERE cust_email = @Email", con)
        cmdRoom.Parameters.AddWithValue("@Email", email)
        Dim rdrRoom As SqlDataReader = cmdRoom.ExecuteReader()
        historyText &= "<h4>Room Bookings:</h4>"
        If rdrRoom.HasRows Then
            While rdrRoom.Read()
                historyText &= "Room: " & rdrRoom("room_type").ToString() & " - Price: ₹" & rdrRoom("room_price").ToString() & "<br/>"
                totalAmount += Convert.ToDecimal(rdrRoom("room_price"))
            End While
        Else
            historyText &= "No room bookings.<br/>"
        End If
        rdrRoom.Close()

        ' Food Orders
        Dim cmdOrder As New SqlCommand("SELECT food_name, food_price FROM [order] WHERE cust_email = @Email", con)
        cmdOrder.Parameters.AddWithValue("@Email", email)
        Dim rdrOrder As SqlDataReader = cmdOrder.ExecuteReader()
        historyText &= "<h4>Food Orders:</h4>"
        If rdrOrder.HasRows Then
            While rdrOrder.Read()
                historyText &= "Item: " & rdrOrder("food_name").ToString() & " - Price: ₹" & rdrOrder("food_price").ToString() & "<br/>"
                totalAmount += Convert.ToDecimal(rdrOrder("food_price"))
            End While
        Else
            historyText &= "No food orders.<br/>"
        End If
        rdrOrder.Close()

        ' Restaurant Visits
        Dim cmdRest As New SqlCommand("SELECT type, price FROM resturant WHERE cust_email = @Email", con)
        cmdRest.Parameters.AddWithValue("@Email", email)
        Dim rdrRest As SqlDataReader = cmdRest.ExecuteReader()
        historyText &= "<h4>Restaurant Visits:</h4>"
        If rdrRest.HasRows Then
            While rdrRest.Read()
                historyText &= "Resturant: " & rdrRest("type").ToString() & " - Amount: ₹" & rdrRest("price").ToString() & "<br/>"
                totalAmount += Convert.ToDecimal(rdrRest("price"))
            End While
        Else
            historyText &= "No restaurant visits.<br/>"
        End If
        rdrRest.Close()

        con.Close()

        historyText &= "<br/><strong>Total Amount Spent: ₹" & totalAmount.ToString() & "</strong>"

        ' Show output on the page
        Dim lblHistory As New Label()
        lblHistory.Text = historyText
        Me.Form.Controls.Add(lblHistory)

    End Sub

    Protected Sub btneditprofile_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btneditprofile.Click
        Dim email As String = Session("loggedInUser").ToString()
        Dim cmd As New SqlCommand("SELECT cust_email, cust_phn, cust_pwd FROM customer WHERE cust_email = @Email", con)
        cmd.Parameters.AddWithValue("@Email", email)

        con.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.Read() Then
            txtemail.Text = reader("cust_email").ToString()
            txtPwd.Text = reader("cust_pwd").ToString()
            TextBox1.Text = reader("cust_phn").ToString()
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

        Dim cmd As New SqlCommand("UPDATE customer SET cust_email = @NewEmail, cust_phn = @Phone, cust_pwd = @Pwd WHERE cust_email = @OldEmail", con)
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
End Class
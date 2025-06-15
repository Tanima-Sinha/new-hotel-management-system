Imports System.Data.SqlClient


Public Class edit_prices
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection("Data Source=DESKTOP-09AJEAD\SQLEXPRESS;Initial Catalog=major;Integrated Security=True")


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            LoadPrices()
        End If

    End Sub

    Private Sub LoadPrices()

        con.Open()

        ' Load Room Price
        Using cmd1 As New SqlCommand("SELECT TOP 1 room_price FROM room", con)
            Dim roomPrice = cmd1.ExecuteScalar()
            txtRoomPrice.Text = If(roomPrice IsNot Nothing, roomPrice.ToString(), "0")
        End Using

        ' Load Food Price
        Using cmd2 As New SqlCommand("SELECT TOP 1 food_price FROM [order]", con)
            Dim foodPrice = cmd2.ExecuteScalar()
            txtFoodPrice.Text = If(foodPrice IsNot Nothing, foodPrice.ToString(), "0")
        End Using

        ' Load Restaurant Price
        Using cmd3 As New SqlCommand("SELECT TOP 1 price FROM resturant", con)
            Dim restaurantPrice = cmd3.ExecuteScalar()
            txtRestaurantPrice.Text = If(restaurantPrice IsNot Nothing, restaurantPrice.ToString(), "0")
        End Using

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSave.Click
        con.Open()

        ' Update Room Price
        Dim cmd1 As New SqlCommand("UPDATE room SET room_price = @roomPrice", con)
        cmd1.Parameters.AddWithValue("@roomPrice", txtRoomPrice.Text)
        cmd1.ExecuteNonQuery()

        ' Update Food Price
        Dim cmd2 As New SqlCommand("UPDATE [order] SET food_price = @foodPrice", con)
        cmd2.Parameters.AddWithValue("@foodPrice", txtFoodPrice.Text)
        cmd2.ExecuteNonQuery()

        ' Update Restaurant Price
        Dim cmd3 As New SqlCommand("UPDATE resturant SET price = @restaurantPrice", con)
        cmd3.Parameters.AddWithValue("@restaurantPrice", txtRestaurantPrice.Text)
        cmd3.ExecuteNonQuery()


        lblMessage.Text = "Prices updated successfully."

    End Sub
End Class
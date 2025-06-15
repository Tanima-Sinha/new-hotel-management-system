Public Class homepage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Select Case DropDownList1.SelectedValue.ToLower()
            Case "sign up as customer"
                Response.Redirect("~/Customer/Custsignup.aspx")
            Case "signup as admin"
                Response.Redirect("~/Admin/adminsignup.aspx")
        End Select
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownList2.SelectedIndexChanged
        Select Case DropDownList2.SelectedValue.ToLower()
            Case "login as customer"
                Response.Redirect("~/Customer/Custlogin.aspx")
            Case "login as admin"
                Response.Redirect("~/Admin/adminlogin.aspx")
        End Select
    End Sub

    Protected Sub DropDownList3_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownList3.SelectedIndexChanged
        If DropDownList3.SelectedValue.ToLower() = "book room" Then
            'If Session("loggedInUser") Is Nothing Then
            'Response.Redirect("~/Customer/Custlogin.aspx?ReturnUrl=~/room/room.aspx")
            'Else
            Response.Redirect("~/room/room.aspx")
            'End If
        End If

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        'If Session("loggedInUser") Is Nothing Then
        'Response.Redirect("~/Customer/Custlogin.aspx?ReturnUrl=~/order/foodorder.aspx")
        'Else
        Response.Redirect("~/order/foodorder.aspx")
        'End If
    End Sub

    Protected Sub btnprofile_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnprofile.Click
        If Session("loggedInUser") IsNot Nothing Then
            ' If logged in, go to the profile page directly
            Response.Redirect("~/Customer/CustProfile.aspx")
        Else
            ' If not logged in, go to login page and redirect back to profile after login
            Response.Redirect("~/Customer/Custlogin.aspx?ReturnUrl=~/Customer/CustProfile.aspx")
        End If
    End Sub
End Class
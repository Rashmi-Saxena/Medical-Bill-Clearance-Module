Public Class WebForm14
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub loginbtn1_Click(sender As Object, e As ImageClickEventArgs) Handles loginbtn1.Click

        Response.Redirect("~/Login.aspx", True)

    End Sub

   
End Class
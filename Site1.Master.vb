Public Class Site1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        lbl_user.Text = Session("txtname").ToString()

        If Session("Role") = "EMP" Then
            li_home.Visible = True
            li_hr.Visible = False
            li_emp.Visible = True
            li_hr1.Visible = False
            li_emp1.Visible = True
            li_emp2.Visible = True

        ElseIf Session("Role") = "HR" Then
            li_home.Visible = True
            li_hr.Visible = True
            li_emp.Visible = False
            li_hr1.Visible = True
            li_emp1.Visible = False
            li_emp2.Visible = False

        End If


    End Sub

   
    Protected Sub btn_lgt_Click(sender As Object, e As EventArgs) Handles btn_lgt.Click


        Session.Clear()

        Response.Redirect("~/Main.aspx", True)


    End Sub
End Class
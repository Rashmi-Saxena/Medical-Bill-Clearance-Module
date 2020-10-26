Imports System.Data
Imports System.Data.SqlClient
'Imports MySql.Data
'Imports MySql.data.MySqlClient

Public Class WebForm3
    Inherits System.Web.UI.Page
    Dim dt As DataTable

    Public Shared strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("MBSConnectionString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnsub_Click(sender As Object, e As EventArgs) Handles btnsub.Click
        lblmsg.Text = ""
        If txtname.Text = "" Or txtpass.Text = "" Then
            lblmsg.Text = "Textbox can not be blank"
        Else
            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "select * from login_table where username = @usrnm and Password = @pass "
            cmd.Parameters.Add("@usrnm", SqlDbType.VarChar).Value = txtname.Text.ToString.Trim()
            cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = txtpass.Text.ToString().Trim()
            dt = GetDataTable(cmd, "1")
            If dt.Rows.Count() > 0 Then
                Session("txtname") = dt.Rows(0)("username").ToString()
                Session("ID") = dt.Rows(0)("Emp_ID").ToString()
                Session("Role") = dt.Rows(0)("Role").ToString()
                'Session("themeSelected") = "Default"
                Response.Redirect("~/Home.aspx", True)
            Else
                lblmsg.Text = "Invalid Username OR Password."
            End If
        End If




        'lbl_login_msg.Text = ""
        'If ebl_username.Value.ToString = "" Then
        '    Session("JScript") = "alert('Username can not be blank!');"
        'ElseIf ebl_password.Value.ToString = "" Then
        '    Session("JScript") = "alert('Password can not be blank!');"
        'Else
        '    Dim cmd As New SqlCommand("Sp_login")
        '    cmd.CommandType = CommandType.StoredProcedure
        '    cmd.Parameters.Add("@action", SqlDbType.VarChar).Value = "login_detail"
        '    cmd.Parameters.Add("@Username", SqlDbType.VarChar).Value = ebl_username.Value.ToString().Trim()
        '    cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = ebl_password.Value.ToString().Trim()
        '    dt = data_populate.GetDataTable(cmd, "1")
        '    If dt.Rows.Count() > 0 Then
        '        Session("ebl_username") = dt.Rows(0)("Username").ToString()
        '        Session("Role") = dt.Rows(0)("Role_Mast_ID").ToString()
        '        Session("login_ID") = dt.Rows(0)("ID").ToString()
        '        Session("themeSelected") = "Default"
        '        Response.Redirect("~/home.aspx", True)
        '    Else
        '        lbl_login_msg.Text = "Invalid Username OR Password."
        '    End If
        'End If



        'Response.Redirect("~/Home.aspx")
    End Sub


    Public Function GetDataTable(ByVal cmd As SqlCommand, ByVal type As String) As DataTable
        ' 1 for current table, 0 for archived table, 9 for PMS
        Dim dt As New DataTable
        Dim sqlcon As New SqlConnection
        sqlcon = New SqlConnection(strConn)
        cmd.Connection = sqlcon
        'cmd.CommandTimeout = 300
        Try
            If cmd.Connection.State <> ConnectionState.Open Then cmd.Connection.Open()
            Dim da As New SqlDataAdapter(cmd)
            If da.SelectCommand.Connection.State <> ConnectionState.Open Then da.SelectCommand.Connection.Open()
            da.Fill(dt)
            If da.SelectCommand.Connection.State = ConnectionState.Open Then da.SelectCommand.Connection.Close()
            If cmd.Connection.State = ConnectionState.Open Then cmd.Connection.Close()
            If sqlcon.State = ConnectionState.Open Then sqlcon.Close()
        Catch ex As Exception
        End Try

        Return dt
    End Function

End Class
Imports System.Data
Imports System.Data.SqlClient
'Imports MySql.Data
'Imports MySql.data.MySqlClient


Public Class WebForm2
    Inherits System.Web.UI.Page
    Dim dt As DataTable

    Public Shared strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("MBSConnectionString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click


        lbl_msg.Text = ""
        If txt_id.Text = "" Or txt_name.Text = "" Or txt_pass.Text = "" Or txt_confirm.Text = "" Then
            lbl_msg.Text = "Textbox can not be blank"
        Else
            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "insert into login_table (Emp_ID, username, Password,Role) values(@empid,@name,@pass,@role) "
            cmd.Parameters.Add("@empid", SqlDbType.VarChar).Value = txt_id.Text.ToString.Trim()
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txt_name.Text.ToString().Trim()
            cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = txt_pass.Text.ToString().Trim()
            cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = dd_role.SelectedItem.Text.ToString()
            dt = GetDataTable(cmd, "1")
            lbl_msg.Text = "Entries Submitted Successfully"

            'If dt.Rows.Count() > 0 Then
            '    Session("txt_name") = dt.Rows(0)("username").ToString()
            '    Session("ID") = dt.Rows(0)("Emp_ID").ToString()
            '    'Session("themeSelected") = "Default"
            '    Response.Redirect("~/Home.aspx", True)
            'Else
            '    lblmsg.Text = "Invalid Username OR Password."
            'End If
        End If

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
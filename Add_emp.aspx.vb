Imports System.Data
Imports System.Data.SqlClient
'Imports MySql.Data
'Imports MySql.data.MySqlClient


Public Class WebForm4
    Inherits System.Web.UI.Page
    Dim dt As DataTable

    Public Shared strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("MBSConnectionString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fill_grid()
        End If
    End Sub

    Protected Sub btn1_Click(sender As Object, e As EventArgs) Handles btn1.Click


        lbl1.Text = ""
        If txt_name.Text = "" Or txt_id.Text = "" Or txt_chss.Text = "" Or txt_addr.Text = "" Or txt_desg.Text = "" Or txt_sec.Text = "" Or txt_unit.Text = "" Or txt_mobile.Text = "" Or txt_email.Text = "" Then
            lbl1.Text = "Textbox can not be blank"

        ElseIf hdn_id.Value.ToString = "" Or hdn_id.Value.ToString Is Nothing Then
            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "insert into employee_master (ID, Name, chss_no, Address, Designation, Section , unit, Mobile_No , Email_id ) values(@empid,@name,@chss,@address,@desg,@sec,@unit,@mob,@email)"
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txt_name.Text.ToString.Trim()
            cmd.Parameters.Add("@empid", SqlDbType.VarChar).Value = txt_id.Text.ToString.Trim()
            'cmd.Parameters.Add("@bino", SqlDbType.VarChar).Value = txt.Text.ToString().Trim()
            cmd.Parameters.Add("@chss", SqlDbType.VarChar).Value = txt_chss.Text.ToString.Trim()
            cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txt_addr.Text.ToString().Trim()
            cmd.Parameters.Add("@desg", SqlDbType.VarChar).Value = txt_desg.Text.ToString.Trim()
            cmd.Parameters.Add("@sec", SqlDbType.VarChar).Value = txt_sec.Text.ToString().Trim()
            cmd.Parameters.Add("@unit", SqlDbType.VarChar).Value = txt_unit.Text.ToString.Trim()
            cmd.Parameters.Add("@mob", SqlDbType.VarChar).Value = txt_mobile.Text.ToString().Trim()
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txt_email.Text.ToString.Trim()
            dt = GetDataTable(cmd, "1")
            lbl1.Text = "Entries Submitted Successfully"

        Else
            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "  update employee_master set  Name=@name , chss_no=@chss, Address=@address, Designation=@desg, Section=@sec , unit=@unit, Mobile_No=@mob , Email_id=@email  where ID=@ID"
            cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = hdn_id.Value.ToString()
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txt_name.Text.ToString.Trim()

            cmd.Parameters.Add("@chss", SqlDbType.VarChar).Value = txt_chss.Text.ToString.Trim()
            cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txt_addr.Text.ToString().Trim()
            cmd.Parameters.Add("@desg", SqlDbType.VarChar).Value = txt_desg.Text.ToString.Trim()
            cmd.Parameters.Add("@sec", SqlDbType.VarChar).Value = txt_sec.Text.ToString().Trim()
            cmd.Parameters.Add("@unit", SqlDbType.VarChar).Value = txt_unit.Text.ToString.Trim()
            cmd.Parameters.Add("@mob", SqlDbType.VarChar).Value = txt_mobile.Text.ToString().Trim()
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txt_email.Text.ToString.Trim()
            dt = GetDataTable(cmd, "1")
            lbl1.Text = "Entries Updated Successfully"
            hdn_id.Value = ""

        End If
        'Response.Redirect("~/upld.aspx")
        fill_grid()
    End Sub

    Public Sub fill_grid()
        Dim cmd As New SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "select * from employee_master where ID like '%' + @emp_id + '%' "
        If txt_emp_no.Text.ToString() = "" Then
            cmd.Parameters.Add("@emp_id", SqlDbType.VarChar).Value = "%"
        Else
            cmd.Parameters.Add("@emp_id", SqlDbType.VarChar).Value = txt_emp_no.Text.ToString()
        End If

        dt = GetDataTable(cmd, "1")
        grd_emp.DataSource = dt
        grd_emp.DataBind()
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

    Protected Sub img_btn_Click(sender As Object, e As ImageClickEventArgs) Handles img_btn.Click
        fill_grid()
    End Sub

    Protected Sub grd_emp_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grd_emp.RowCommand


        If e.CommandName.ToString() = "select_edit" Then
            hdn_id.Value = e.CommandArgument.ToString()

            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = " select  * from employee_master where ID=@ID "
            cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = e.CommandArgument.ToString()
            dt = GetDataTable(cmd, "1")
            txt_id.Text = dt.Rows(0)("ID").ToString()
            txt_name.Text = dt.Rows(0)("Name").ToString()
            txt_chss.Text = dt.Rows(0)("chss_no").ToString()
            txt_addr.Text = dt.Rows(0)("Address").ToString()
            txt_desg.Text = dt.Rows(0)("Designation").ToString()
            txt_sec.Text = dt.Rows(0)("Section").ToString()
            txt_unit.Text = dt.Rows(0)("unit").ToString()
            txt_mobile.Text = dt.Rows(0)("Mobile_No").ToString()
            txt_email.Text = dt.Rows(0)("Email_id").ToString()


        End If
    End Sub

End Class

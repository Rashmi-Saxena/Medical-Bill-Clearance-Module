Imports System.Data
Imports System.Data.SqlClient
'Imports MySql.Data
'Imports MySql.data.MySqlClient


Public Class WebForm6

    Inherits System.Web.UI.Page
    Dim dt As DataTable

    Public Shared strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("MBSConnectionString").ConnectionString


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lbl_emp_id.Text = Session("ID").ToString()
        fill_grid()

    End Sub

    Protected Sub btn1_Click(sender As Object, e As EventArgs) Handles btn1.Click

        lbl1.Text = ""
        If txt1.Text = "" Or txt3.Text = "" Or text2.Text = "" Or dd1.SelectedItem.Text = "" Or TextBox2.Text = "" Or TextBox3.Text = "" Or txt3.Text = "" Then
            lbl1.Text = "Textbox can not be blank"
        Else
            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "insert into Medical_bill (Emp_id,Bill_no,Bill_date,Chemist_Name,Pharmacy_name,Qty,Amount) values(@empid,@bino,@bida,@chnam,@phar,@qta,@amt)"
            cmd.Parameters.Add("@empid", SqlDbType.VarChar).Value = Session("ID").ToString()
            cmd.Parameters.Add("@bino", SqlDbType.VarChar).Value = txt1.Text.ToString().Trim()
            cmd.Parameters.Add("@bida", SqlDbType.VarChar).Value = text2.Text.ToString.Trim()
            cmd.Parameters.Add("@chnam", SqlDbType.VarChar).Value = dd1.SelectedItem.Text.ToString()
            cmd.Parameters.Add("@phar", SqlDbType.VarChar).Value = TextBox2.Text.ToString.Trim()
            cmd.Parameters.Add("@qta", SqlDbType.VarChar).Value = TextBox3.Text.ToString().Trim()
            cmd.Parameters.Add("@amt", SqlDbType.VarChar).Value = txt3.Text.ToString.Trim()
            lbl1.Text = "Entries Submitted Successfully"
            dt = GetDataTable(cmd, "1")
            fill_grid()

        End If

    End Sub

    Public Sub fill_grid()
        Dim cmd As New SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "SELECT Bill_no,Emp_ID,Bill_date,Chemist_Name,Pharmacy_name,Qty,Amount FROM Medical_bill where Emp_ID=@emp_id "
        cmd.Parameters.Add("@emp_id", SqlDbType.VarChar).Value = Session("ID").ToString()
      
        dt = GetDataTable(cmd, "1")
        grd_med.DataSource = dt
        grd_med.DataBind()

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


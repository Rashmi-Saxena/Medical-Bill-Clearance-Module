Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Collections.Generic

'Imports MySql.Data
'Imports MySql.data.MySqlClient

Public Class WebForm10
    Inherits System.Web.UI.Page
    Dim dt As DataTable
    Public Shared strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("MBSConnectionString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fill_grid()
        End If
    End Sub

    Public Sub fill_grid()
        Dim cmd As New SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "SELECT [Sno],[Bill_no], [Bill_date], [Chemist_Name], [Pharmacy_name], [Qty], [Amount], [amt_approve],[is_approved_by_HR] FROM [Medical_bill] where Emp_ID = @emp_id"
        cmd.Parameters.Add("@emp_id", SqlDbType.VarChar).Value = Session("ID").ToString()
        dt = GetDataTable(cmd, "1")
        grd_emp_rpt.DataSource = dt
        grd_emp_rpt.DataBind()
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

  

    Protected Sub grd_emp_rpt_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grd_emp_rpt.RowCommand


        If e.CommandName.ToString() = "Select_view" Then
            'hdn_fld.Value = e.CommandArgument.ToString()
            panel_viewdoc.Visible = True

            lbl_msg.Text = ""
            If (e.CommandArgument.ToString() = "" Or e.CommandArgument.ToString() Is Nothing) Then
                lbl_msg.Text = "Documents not uploaded"
            Else
                If Directory.Exists("~/Uploads/" + e.CommandArgument.ToString()) Then
                    Dim filePaths As String() = Directory.GetFiles(Server.MapPath("~/Uploads/" + e.CommandArgument.ToString()))
                    Dim files As New List(Of ListItem)()
                    For Each filePath As String In filePaths
                        Dim fileName As String = Path.GetFileName(filePath)
                        files.Add(New ListItem(fileName, "~/Uploads/" + e.CommandArgument.ToString() + "/" + fileName))
                        lbl_msg.Text = lbl_msg.Text.ToString() + "<br />" + fileName.ToString()
                    Next
                Else
                    lbl_msg.Text = "Documents not uploaded"
                End If
            End If
        End If

    End Sub

End Class
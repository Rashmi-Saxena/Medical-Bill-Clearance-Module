Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Collections.Generic
'Imports MySql.Data
'Imports MySql.data.MySqlClient

Public Class WebForm15
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
        cmd.CommandText = "select e.ID ,e.Name,e.chss_no ,m.Bill_no ,m.Bill_date,m.Chemist_Name ,m.Pharmacy_name ,m.Qty ,m.Amount,m.Sno,  " & _
                            "case when(m.is_approved_by_HR = 0 OR m.is_rejected_by_HR = 1 ) then 'Not approved' else 'Approved' end as stts, " & _
                            "case when(m.is_approved_by_HR = 1 OR m.is_rejected_by_HR = 1 ) then 'false' else 'true' end as btn_visibility " & _
                            "from employee_master e Inner join Medical_bill m on e.ID = m.Emp_ID " & _
                            "where e.ID like '%' +  @emp_id + '%' AND e.Name like '%' +  @emp_name + '%' AND e.chss_no like '%' + @chss + '%' "
        If txt_id.Text.ToString() = "" Then
            cmd.Parameters.Add("@emp_id", SqlDbType.VarChar).Value = "%"
        Else
            cmd.Parameters.Add("@emp_id", SqlDbType.VarChar).Value = txt_id.Text.ToString()
        End If

        cmd.Parameters.Add("@emp_name", SqlDbType.VarChar).Value = If(txt_name.Text.ToString = "", "%", txt_name.Text.ToString())
        cmd.Parameters.Add("@chss", SqlDbType.VarChar).Value = If(txt_chss.Text.ToString = "", "%", txt_chss.Text.ToString())
        dt = GetDataTable(cmd, "1")
        grd_appr.DataSource = dt
        grd_appr.DataBind()
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

    Protected Sub grd_appr_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grd_appr.RowCommand


        If e.CommandName.ToString() = "Select_update" Then

            Dim row As GridViewRow = DirectCast(DirectCast(e.CommandSource, Control).NamingContainer, GridViewRow)
            Dim txt_amt As TextBox = DirectCast(row.FindControl("txt_amount"), TextBox)

            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "UPDATE Medical_bill  SET is_approved_by_HR  = 1, amt_approve = @amt_approve where Sno = @sno;"
            cmd.Parameters.Add("@sno", SqlDbType.VarChar).Value = e.CommandArgument.ToString()
            cmd.Parameters.Add("@amt_approve", SqlDbType.VarChar).Value = txt_amt.Text.ToString()
            dt = GetDataTable(cmd, "1")
            fill_grid()




        ElseIf e.CommandName.ToString() = "Select_reject" Then
            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "UPDATE Medical_bill  SET is_rejected_by_HR  = 1 where Sno = @sno;"
            cmd.Parameters.Add("@sno", SqlDbType.VarChar).Value = e.CommandArgument.ToString()
            dt = GetDataTable(cmd, "1")
            fill_grid()

        ElseIf e.CommandName.ToString() = "Select_view" Then
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
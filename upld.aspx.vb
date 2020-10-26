Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
'Imports MySql.Data
'Imports MySql.data.MySqlClient


Public Class WebForm8

    Inherits System.Web.UI.Page
    Dim dt As DataTable

    Public Shared strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("MBSConnectionString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        fill_grid()

    End Sub


    Public Sub fill_grid()
        Dim cmd As New SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "SELECT Bill_no, Bill_date, Chemist_Name, Pharmacy_name,Qty,Amount,sno FROM Medical_bill where Emp_ID=@emp_id "
        cmd.Parameters.Add("@emp_id", SqlDbType.VarChar).Value = Session("ID").ToString()

        dt = GetDataTable(cmd, "1")
        grd_upld.DataSource = dt
        grd_upld.DataBind()

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


    Protected Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click

        If (hdn_fld.Value = "" Or hdn_fld.Value Is Nothing) Then
            lblMessage.Text = "Select any valid document first before uploading !!"
        Else
            UploadFile(file1)
            UploadFile(file2)
            hdn_fld.Value = ""
        End If


    End Sub

    Protected Sub UploadFile(file_upld As FileUpload)
        Dim folderPath As String = Server.MapPath("~/Uploads/" + hdn_fld.Value)

        If (file_upld.FileName Is Nothing Or file_upld.FileName = "") Then
            Exit Sub
        End If
        If (hdn_fld.Value Is Nothing Or hdn_fld.Value = "") Then
            lblMessage.Text = " Select any valid document first before uploading!"
            Exit Sub
        End If

        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(folderPath)
        End If

        'Save the File to the Directory (Folder).
        file_upld.SaveAs(folderPath + "/" + Path.GetFileName(file_upld.FileName))

        'Display the success message.
        lblMessage.Text = "File has been uploaded."
    End Sub

    Protected Sub grd_upld_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grd_upld.RowCommand


        If e.CommandName.ToString() = "Select_upload" Then
            panel_doc.Visible = True
            hdn_fld.Value = e.CommandArgument.ToString()
            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = " select  * from Medical_bill where Sno=@Sno "
            cmd.Parameters.Add("@Sno", SqlDbType.VarChar).Value = e.CommandArgument.ToString()
            dt = GetDataTable(cmd, "1")
            lbl_billno.Text = dt.Rows(0)("Bill_no").ToString()

        End If
    End Sub

End Class
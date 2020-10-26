<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Emp_report.aspx.vb" Inherits="MBS.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            font-family: Arial;
            font-size: 10pt;
            background-image: url('Image/background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            /*background-position:center;*/
            background-size: cover;
        }
    </style>
    <div style="font-size: large">
        <br />
        <br />
        <br />
        <br />



        <asp:GridView ID="grd_emp_rpt" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
            GridLines="None" Style="text-align: center" Width="1897px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Bill_no" HeaderText="Bill no" />
                <asp:BoundField DataField="Bill_date" HeaderText="Bill date" />
                <asp:BoundField DataField="Chemist_Name" HeaderText="Chemist_Name" />
                <asp:BoundField DataField="Pharmacy_name" HeaderText="Pharmacy_name" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="amt_approve" HeaderText="Amount approved by HR" />
                <asp:CheckBoxField DataField="is_approved_by_HR" HeaderText="Approved by HR" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_viewdoc" runat="server" Text="View Documents" CommandName="Select_view" CommandArgument='<%#Eval("Sno").ToString()%>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

    </div>
    
    <asp:Panel ID="panel_viewdoc" runat="server" Visible="false" Font-Size ="X-Large" >
       
                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>
    </asp:Panel>
</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="hrapprove.aspx.vb" Inherits="MBS.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    
        <style type="text/css">
        .auto-style4 {
            width: 550px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        body
        {
            font-family: Arial;
            font-size: 10pt;
            background-image:url('Image/background.jpg') ;
            background-repeat:no-repeat;
            background-attachment:fixed;
            /*background-position:center;*/
            background-size:cover;
            
        }
</style>
    
    <div style="font-size:large " >


        <table align="center" style="width: 1476px">
            <tr>
                <td>
                    Employee ID
                </td>
                <td>
                    <asp:TextBox ID="txt_id" runat ="server" ></asp:TextBox> 
                </td>
           <td>
                    Employee Name
                </td>
                <td>
                    <asp:TextBox ID="txt_name" runat ="server" ></asp:TextBox> 
                </td>
          
                <td>
                 CHSS No.
                </td>
                <td>
                  <asp:TextBox ID="txt_chss" runat ="server" ></asp:TextBox> 
                </td>
                <td>
                    <asp:ImageButton ID="img_btn" runat="server"  ImageUrl="Image/logo2.png"  Height="39px" Width="94px" />
                </td>
            </tr>
        </table>

        <br />
       

        <br />
        <br />
        <br />

    
        <asp:GridView ID="grd_appr" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" style="text-align: center" Width="1897px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True"  />
                <asp:BoundField DataField="Name" HeaderText="Name"  />
                <asp:BoundField DataField="chss_no" HeaderText="CHSS No"  />
                <asp:BoundField DataField="Bill_no" HeaderText="Bill No"  />
                <asp:BoundField DataField="Bill_date" HeaderText="Bill Date" />
                <asp:BoundField DataField="Chemist_Name" HeaderText="Chemist Name" />
                <asp:BoundField DataField="Pharmacy_name" HeaderText="Pharmacy Name"  />
                <asp:BoundField DataField="Qty" HeaderText="Qty"  />
                <asp:BoundField DataField="Amount" HeaderText="Amount"  />
                <asp:BoundField DataField="stts" HeaderText="Status"  />
              
                <asp:TemplateField HeaderText="Amount to be approved">
                    <ItemTemplate>
                        <asp:TextBox ID="txt_amount" runat ="server" HeaderText="Amount to be approved " > </asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
              
                <asp:TemplateField>

                    <ItemTemplate>
                        <asp:Button ID="btn_appr" runat="server" Text="Approve" CommandName="Select_update" CommandArgument='<%#Eval("Sno").ToString()%>'
                            Visible='<%#Eval("btn_visibility").ToString()%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_rjt" runat="server" Text="Reject" CommandName="Select_reject" CommandArgument='<%#Eval("Sno").ToString()%>'
                            Visible='<%#Eval("btn_visibility").ToString()%>' />
                    </ItemTemplate>
                </asp:TemplateField>
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
        
    </div >
    <br />

     <asp:Panel ID="panel_viewdoc" runat="server" Visible="false" Font-Size ="X-Large"   >
                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>
     </asp:Panel>


</asp:Content>

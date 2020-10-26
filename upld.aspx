<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="upld.aspx.vb" Inherits="MBS.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style2 {
            width: 204px;
            margin-bottom: 19px;
        }
        .auto-style3 {
            width: 182px;
        }
        .auto-style4 {
            width: 1865px;
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

    <div class="auto-style1">
        <br />
            <br />

        <div class="auto-style4" style="font-family: Bazooka; font-size: x-large;border-radius: 25px;  border: 2px solid white;  padding: 20px;  background-color:white; height: 13px; width: 1845px; text-align: center;">

       

        UPLOAD DOCUMENTS
            <br />
            <br />
            <br />
        </div>

        <br />
            <br />

        <asp:GridView ID="grd_upld" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" style="text-align: center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
               <asp:TemplateField HeaderText="Bill No.">
                    <ItemTemplate>
                        <asp:LinkButton ID="link_billno" runat ="server" Text='<%#Eval("Bill_no").ToString()%>' 
                            CommandName="Select_upload" CommandArgument='<%#Eval("Sno").ToString()%>' ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="Bill_date" HeaderText="Bill_date"  />
                <asp:BoundField DataField="Chemist_Name" HeaderText="Chemist_Name"  />
                <asp:BoundField DataField="Pharmacy_name" HeaderText="Pharmacy_name"  />
                <asp:BoundField DataField="Qty" HeaderText="Qty" />
                <asp:BoundField DataField="Amount" HeaderText="Amount"  />
           
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


        <br />
        <br />
        <br />
        <asp:Panel ID="panel_doc" runat="server" Visible="false" >
         <div style="font-size:large ">
        <table align="center" border="0" class="auto-style4" style="border-radius: 25px;  border: 2px solid white;  padding: 20px;  width: 700px;  height: 150px; background-color:white ">
            <tr>
                <td class="auto-style3">
                     Bill No.
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lbl_billno" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Upload NA Slip
                </td>
                <td class="auto-style2">
                    <asp:FileUpload ID="file1" runat="server" Width="336px" />
                </td>
            </tr>
            <td class="auto-style3">
                Upload Medical Bill
            </td>
            <td class="auto-style2">
                <asp:FileUpload ID="file2" runat="server" Width="336px" />
            </td>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                     <td>
                         &nbsp;
                     </td>
                     <td>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btn_submit" runat="server" Text="Submit" />
                     </td>
                 </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                </td>
            </tr>
             </table>
             
             
             <asp:HiddenField ID="hdn_fld" runat="server" visible="false" />
    </div>

            </asp:Panel>
        </div> 

</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="MedBill.aspx.vb" Inherits="MBS.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 550px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            width: 35%;
            height: 185px;
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
    <br />
    <br />
    <div class="auto-style1">

        <div class="auto-style5" style="font-family: Bazooka; font-size: x-large;border-radius: 25px;  border: 2px solid white;  padding: 20px;  background-color:white; height: 28px; width: 1854px;"">

        MEDICAL BILL
            <br />
            <br />
            <br />
            
            <br />

        </div>
        <br />
    <br />
        <div style="font-size:large; width: 30%;float:left;">
            <asp:Label ID="lbl_emp_id" runat="server" align="center" style="font-weight: 700; text-align: center" ></asp:Label>
        <table align="center" class="auto-style6" style="border-radius: 25px;  border: 2px solid white;  padding: 20px;  width: 100%;  height: 150px; background-color:white">
        
            <br />
            <br />
            <tr>
                <td>
                    Enter Medical Bill No.
                </td>
                <td>
                    <asp:TextBox ID="txt1" runat="server"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Enter Medical Bill Date

                </td>
                <td>
                    <asp:TextBox ID="text2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Prescribed By</td>
                <td>
                    <asp:DropDownList ID="dd1" runat="server" Height="22px" Width="153px">
                        <asp:ListItem>Dr. Sarkar</asp:ListItem>
                        <asp:ListItem>Dr. Rubina</asp:ListItem>
                        <asp:ListItem>Dr. Nakra</asp:ListItem>
                        <asp:ListItem>Dr. Nidhi</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Enter Pharmacy Name
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Enter Medicine Qty.
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Enter Amount to be claimed
                </td>
                <td>
                    <asp:TextBox ID="txt3" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:label ID="lbl1" forecolor="red" runat="server"></asp:label>
                </td>
            </tr>
            
        </table>

        
        <br />
 
        <br />
        <table align="center">
            <tr>
                <td class="auto-style4">
                    &nbsp;
                </td>
                <td>
            <asp:Button ID="btn1" Text="Submit" runat="server" />
                    

                </td>
            </tr>
        </table>

            </div>
       
        
         <div style="width: 65%;float:right;">
                <br />
    <br />
            <br />
             <br />     
            <asp:GridView ID="grd_med" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" style="text-align: center" Visible ="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Emp_ID" HeaderText="Emp_ID" />
                    <asp:BoundField DataField="Bill_no" HeaderText="Bill_no" />
                    <asp:BoundField DataField="Bill_date" HeaderText="Bill_date"  />
                    <asp:BoundField DataField="Chemist_Name" HeaderText="Chemist_Name"  />
                    <asp:BoundField DataField="Pharmacy_name" HeaderText="Pharmacy_name"  />
                    <asp:BoundField DataField="Qty" HeaderText="Qty" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                    
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
    </div>
</asp:Content>

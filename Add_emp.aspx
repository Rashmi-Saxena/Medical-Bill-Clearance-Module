<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Add_emp.aspx.vb" Inherits="MBS.WebForm4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style4 {
            width: 182px;
        }

        .auto-style5 {
            width: 206px;
        }
    </style>
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

        .auto-style6 {
            width: 182px;
            height: 25px;
        }

        .auto-style7 {
            width: 206px;
            height: 25px;
        }
    </style>
    <br />
    <br />

    <%-- <style=" background-color: lightblue;">--%>
    <div class="auto-style1">

        <div class="auto-style2" style="font-family: Bazooka; font-size: x-large; border-radius: 25px; border: 2px solid white; padding: 20px; background-color: white; height: 28px; width: 1854px;">
            ADD EMPLOYEE<br />
            <br />
            <br />
        </div>
        <br />
        <br />
        <div style="font-size: large; width: 30%;float:left;">
            <table align="left" border="0" class="auto-style4" style="border-radius: 25px; border: 2px solid white; padding: 20px; width: 100%; height: 278px; background-color: white">
                <tr>
                    <td class="auto-style4">Employee ID
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style4">Employee Name
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style4">CHSS No.
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_chss" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style4">Address
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_addr" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Designation
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_desg" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Section
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_sec" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">Unit
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txt_unit" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style4">Mobile No.
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_mobile" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Email Id
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lbl1" ForeColor="red" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="btn1" runat="server" Text="Submit" />
                    </td>
                </tr>

            </table>
        </div>
        <div style="width: 65%;float:right;">

            <table>
                <tr>
                    <td>Employee No.
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txt_emp_no"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="img_btn" runat="server" ImageUrl="Image/logo2.png" Height="39px" Width="94px" />
                    </td>
                </tr>
            </table>

            <asp:GridView ID="grd_emp" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" Style="text-align: center" Width="100%">

                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="chss_no" HeaderText="chss_no" SortExpression="chss_no" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                    <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                    <asp:BoundField DataField="unit" HeaderText="Unit" SortExpression="unit" />
                    <asp:BoundField DataField="Mobile_No" HeaderText="Mobile_No" SortExpression="Mobile_No" />
                    <asp:BoundField DataField="Email_id" HeaderText="Email_id" SortExpression="Email_id" />
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="updt_btn" runat="server" ImageUrl="Image/edit.png" Height="39px" Width="39px" CommandName ="select_edit" CommandArgument='<%#Eval("ID").ToString()%>' />
                       
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

        <asp:HiddenField ID ="hdn_id" runat ="server" Visible ="false" />



    </div>
</asp:Content>

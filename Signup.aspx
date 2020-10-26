<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Signup.aspx.vb" Inherits="MBS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 21%;
            height: 260px;
        }
        .auto-style4 {
            width: 206px;
        }
        .auto-style5 {
            width: 199px;
        }
    </style>
</head>
<body style="font-size: larger; background-image:url('Image/bagkground.jpg')   ;">
    <form id="form1" runat="server">
    <div class="auto-style1">

        <div class="auto-style2" style="font-family: Bazooka; font-size: x-large;border-radius: 25px;  border: 2px solid ;  padding: 20px;  background-color:white;">

        SIGN UP PAGE
          
        </div>
         <br />
            <br />
         <br />
            
        <table align="center" class="auto-style3" style="border-radius: 25px;  border: 2px solid ;  padding: 20px;  width: 429px;  height: 331px; background-color:white">
            <tr>
                <td class="auto-style4">
                    Employee ID
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td class="auto-style4">
                    User Name
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                </td>

            </tr>
             <tr>
                <td class="auto-style4">
                    Password
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txt_pass" runat="server" TextMode="Password" ></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td class="auto-style4">
                    Confirm Password
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txt_confirm" TextMode="Password"  runat="server"></asp:TextBox>
               <%--     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords Doesnot Match !! " ControlToValidate="txt_confirm" ControlToCompare="txt_pass" Operator="Equal" Type ="String" forecolor="Red" ></asp:CompareValidator>--%>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_pass" ControlToValidate="txt_confirm" ErrorMessage="Passwords dont match!" ForeColor="Red"></asp:CompareValidator>
                </td>

            </tr>
             <tr>
                <td class="auto-style4">
                    Role ID
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="dd_role"  runat="server" Height="22px" Width="153px">
                        <asp:ListItem>EMP</asp:ListItem>
                        <asp:ListItem>HR</asp:ListItem>
                    </asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:Label ID="lbl_msg" runat="server" ForeColor="Red" ></asp:Label>
                </td>
            </tr>
          <tr>
              <td>
                  &nbsp;
              </td>
              <td><asp:button ID="btn_submit" runat="server" Text="Submit" />

              </td>
          </tr>

        </table>
    
    </div>
    </form>
</body>
</html>

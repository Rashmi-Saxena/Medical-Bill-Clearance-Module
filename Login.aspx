<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="MBS.WebForm3" %>

<!DOCTYPE html>

<html >
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            width: 1868px;
            height: 25px;
        }
        .auto-style2 {
            width: 204px;
        }
        .auto-style3 {
            width: 268px;
        }
        .auto-style4 {
            width: 19%;
            height: 115px;
        }
        </style>
</head>
<body style="background-image:url('Image/bagkground.jpg')   ">
    <form id="form1" runat="server">


    <div style="font-size: x-large ">
        <div class="auto-style1"  style="font-family: Bazooka; font-size: xx-large;border-radius: 25px;  border: 2px solid ;  padding: 20px;  background-color:white; ">
            LOGIN PAGE
             <br />
            <br />
            <br />
        </div>
       
          <br />
            <br />
            <br />
               

        <table align="center" border="0" class="auto-style4" style="border-radius: 25px;  border: 2px solid;  padding: 20px;  width: 400px;  height: 300px; background-color:white ">
            <tr>
                <td class="auto-style3">
                    Username 
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtname" runat="server" Width="175px" Height="26px" ></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Password
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtpass" runat="server" Width="175px" Height="26px" TextMode="Password" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnsub" runat="server" Text="Login" Height="28px" Width="83px"  />
                    <br />
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    <a href="Signup.aspx">New User </a>
                </td>
            </tr>
        </table>
  
    
        <br />
  
    
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>

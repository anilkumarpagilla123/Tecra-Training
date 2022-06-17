<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contols.aspx.cs" Inherits="WebAppVNR.Contols" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>
            Welcome To Web App Development</h3>
    </div>
    <table>
        <tr>
            <td>
                Name
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email
            </td>
            <td>
                <asp:TextBox ID="txtemail" runat="server" placeholder="Email"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password
            </td>
            <td>
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password">  </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Radio (Gender)
            </td>
            <td>
                <asp:RadioButtonList ID="rdgender" runat="server">
                    <asp:ListItem Text="Male"></asp:ListItem>
                    <asp:ListItem Text="Female"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                Check Box (Qualification)
            </td>
            <td>
                <asp:CheckBoxList ID="chkquali" runat="server">
                    <asp:ListItem Text="SSC"></asp:ListItem>
                    <asp:ListItem Text="B Tech"></asp:ListItem>
                    <asp:ListItem Text="M Tech"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                Dept
            </td>
            <td>
                <asp:DropDownList ID="ddldept" runat="server">
                    <asp:ListItem Text="CSE"></asp:ListItem>
                    <asp:ListItem Text="EEE"></asp:ListItem>
                    <asp:ListItem Text="Civil"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnsave" runat="server" Text="Save" />
            </td>
            <td>
                <asp:Button ID="btncancel" runat="server" Text="Cancel" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

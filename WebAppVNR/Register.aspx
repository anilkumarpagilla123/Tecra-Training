<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebAppVNR.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #customers
        {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        
        #customers td, #customers th
        {
            border: 1px solid #ddd;
            padding: 8px;
        }
        
        #customers tr:nth-child(even)
        {
            background-color: #f2f2f2;
        }
        
        #customers tr:hover
        {
            background-color: #ddd;
        }
        
        #customers th
        {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Register Page
    </div>
    <table id="customers">
        <tr>
            <th>
                UserName
            </th>
            <td>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                EmailID
            </th>
            <td>
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                Password
            </th>
            <td>
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                DOB
            </th>
            <td>
                <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                Gender
            </th>
            <td>
                <asp:RadioButtonList ID="rdgender" runat="server">
                    <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                    <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th>
                Department
            </th>
            <td>
                <asp:DropDownList ID="dddldept" runat="server">
                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                    <asp:ListItem Text="CSE" Value="CSE"></asp:ListItem>
                    <asp:ListItem Text="EEE" Value="EEE"></asp:ListItem>
                    <asp:ListItem Text="ECE" Value="ECE"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>
                Department
            </th>
            <td>
                <asp:DropDownList ID="ddlrole" runat="server">
                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                    <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                    <asp:ListItem Text="Prof" Value="Prof"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="HOD" Value="HOD"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>
                Status
            </th>
            <td>
                <asp:DropDownList ID="ddlstatus" runat="server">
                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                    <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                    <asp:ListItem Text="In Active" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnsave" runat="server" Text="Save Data" 
                    onclick="btnsave_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

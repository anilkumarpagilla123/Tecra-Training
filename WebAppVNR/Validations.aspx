<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true"
    CodeBehind="Validations.aspx.cs" Inherits="WebAppVNR.Validations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id="customers">
        <tr>
            <th>
                UserName
            </th>
            <td>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtname"
                    ErrorMessage="UserName Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                EmailID
            </th>
            <td>
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="EmailID Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regu" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="Plz Enter Correct Email Format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th>
                Password
            </th>
            <td>
                <asp:TextBox ID="txtpwd" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd"
                    ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtpwd"
                    ErrorMessage="Minimum 8 characters at least 1 Alphabet and 1 Number" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th>
                Confirm Password
            </th>
            <td>
                <asp:TextBox ID="txtcpwd" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcpwd"
                    ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="com" runat="server" ControlToValidate="txtcpwd" ErrorMessage="Password is Not Correct"
                    ForeColor="Red" ControlToCompare="txtpwd"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <th>
                Age
            </th>
            <td>
                <asp:TextBox ID="txtage" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtage"
                    ErrorMessage="Age Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="raneg1" runat="server" ControlToValidate="txtage" ErrorMessage=">=18 & <=50"
                    ForeColor="Red" MinimumValue="18" MaximumValue="50"></asp:RangeValidator>
            </td>
        </tr>


        <tr>
            <th>
                Address
            </th>
            <td>
                <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ErrorMessage="CustomValidator" ControlToValidate="txtaddress" 
                    onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnvalidate" runat="server" Text="Validate" OnClick="btnvalidate_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

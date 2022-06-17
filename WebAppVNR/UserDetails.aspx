<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true"
    CodeBehind="UserDetails.aspx.cs" Inherits="WebAppVNR.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #customer
        {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        
        #customer td, #customer th
        {
            border: 1px solid #ddd;
            padding: 8px;
        }
        
        #customer tr:nth-child(even)
        {
            background-color: #f2f2f2;
        }
        
        #customer tr:hover
        {
            background-color: #ddd;
        }
        
        #customer th
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
    <h3>
        User Details</h3>
    <asp:Repeater ID="rep" runat="server">
        <HeaderTemplate>
            <table id="customer">
                <tr>
                    <th>
                        UserID
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        EmailID
                    </th>
                    <th>
                        Password
                    </th>
                    <th>
                        Dob
                    </th>
                    <th>
                        Gender
                    </th>
                    <th>
                        Department
                    </th>
                    <th>
                        Role
                    </th>
                    <th>
                        Status
                    </th>
                    <th>
                        Edit
                    </th>
                    <th>
                        Delete
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%#Eval("UserID") %>
                </td>
                <td>
                    <%#Eval("Name") %>
                </td>
                <td>
                    <%#Eval("EmailId") %>
                </td>
                <td>
                    <%#Eval("Password") %>
                </td>
                <td>
                    <%#Eval("Dob") %>
                </td>
                <td>
                    <%#Eval("Gender") %>
                </td>
                <td>
                    <%#Eval("Department") %>
                </td>
                <td>
                    <%#Eval("Role") %>
                </td>
                <td>
                    <%#Eval("Status") %>
                </td>
                <td>
                    <asp:ImageButton ID="btnedit" runat="server" ImageUrl="~/images/Edit.png" Width="20px"
                    CommandArgument='<%#Eval("UserID") %>'    Height="20px" OnClick="btnedit_Click" />
                </td>
                <td>
                    <asp:ImageButton ID="btndelete" runat="server" ImageUrl="~/images/Bin.png" Width="20px"
                      CommandArgument='<%#Eval("UserID") %>'  Height="20px" OnClick="btndelete_Click" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>

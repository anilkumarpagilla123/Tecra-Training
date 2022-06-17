<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Country.aspx.cs" Inherits="WebApplication1.Country" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            Country
            <asp:DropDownList ID="ddlcountry" runat="server" Width="35%" Height="20%" AppendDataBoundItems="true"
                AutoPostBack="true" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
            </asp:DropDownList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlcountry" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            State
            <asp:DropDownList ID="ddlstates" runat="server" Width="35%" Height="20%" AppendDataBoundItems="true"
                AutoPostBack="true" OnSelectedIndexChanged="ddlstates_SelectedIndexChanged">
            </asp:DropDownList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlstates" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            City
            <asp:DropDownList ID="ddlcity" runat="server" Width="35%" Height="20%" AppendDataBoundItems="true" 
                AutoPostBack="true" OnSelectedIndexChanged="ddlcity_SelectedIndexChanged"
                 >
            </asp:DropDownList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlcity" />
        </Triggers>
    </asp:UpdatePanel>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApexWS.aspx.cs" Inherits="NETCustomerStatus.ApexWS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Opportunity Id:
        <br />
        <br />
        <asp:TextBox ID="OppID" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        Output:<br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>

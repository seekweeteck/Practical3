<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusTicketing.aspx.cs" Inherits="Practical3.BusTicketing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        td {
 
        vertical-align: top;
}
        .auto-style1 {
            margin-left: 40px;
        }
        .auto-style2 {
            width: 80px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 100%;">
                <tr>
                    <th colspan="3">
                        <h1>ABC BUS ONLINE BOOKING & TICKETING SYSTEM</h1>
                    </th>
                </tr>
                <tr>
                    <th colspan="3">
                        <asp:Label ID="lblTime" runat="server" Text="Label"></asp:Label></th>

                </tr>
                <tr>
                    <td class="auto-style2">Date</td>
                    <td>&nbsp;
                            
                        :</td>
                    <td>
                        <asp:Calendar ID="calDepartDate" runat="server" OnSelectionChanged="calDepartDate_SelectionChanged"></asp:Calendar>
                        <br />
                        <asp:Label ID="lblDepartDate" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Adult</td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtAdult" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Child</td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtChild" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">From</td>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddlFrom" runat="server">
                            <asp:ListItem>-Select an origin-</asp:ListItem>
                            <asp:ListItem>Hentian Duta</asp:ListItem>
                            <asp:ListItem>Hentian Putra</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">To</td>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddlTo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTo_SelectedIndexChanged">
                             <asp:ListItem>-Select a destination-</asp:ListItem>
                            <asp:ListItem>Seremban</asp:ListItem>
                            <asp:ListItem>Butterworth</asp:ListItem>

                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Ticket Price</td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
              
            </table>

        </div>
        <p><asp:Label ID="lblError" runat="server" Text="Label" Visible="False"></asp:Label></p>
        <p class="auto-style1">
            <br />
            <asp:Button ID="btnBookTicket" runat="server" OnClick="btnBookTicket_Click" 
                Text="Book Ticket" OnClientClick="javascript:alert('You will be directed to the booking confirmation page')" 
                PostBackUrl="~/ConfirmBooking.aspx"/>
            &nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" ToolTip="Reset selection"/>
            <br />
        </p>
    </form>
</body>
</html>

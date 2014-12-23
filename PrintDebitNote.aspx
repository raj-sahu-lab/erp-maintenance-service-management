<%@ page language="C#" autoeventwireup="true" inherits="PrintDebitNote, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Debit Note | Print Debit Note | Notes</title>
    <link href="CSS/PrintInvoice.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="DivOuter">
        <div class="DivTopMe">
        </div>
        <div class="DivMid">
            <div>
                <table style="border:1px solid black;">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="DEBIT NOTE NO." Width="250px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="DNNo" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
                            <asp:Label ID="Label27" runat="server" Text="DATE" Width="40px"></asp:Label>
                            <asp:Label ID="DNDate" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="CUSTOMER" Width="250px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="CDName" runat="server" Style="font-weight: bold; font-style: italic;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="ADDRESS" Width="250px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Address" runat="server" CssClass="spanNum"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="EQUIPMENT MODEL " Width="250px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="MacName" runat="server" Width="200px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="EQUIPMENT SERIAL NO." Width="250px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="ESerialNo" runat="server" Width="200px" Font-Bold="True" CssClass="spanNum"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="QUANTITY" Width="210px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Quantity" runat="server" Width="200px" Font-Bold="True" CssClass="spanNum"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="ELEGIBILITY " Width="310px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Elegibility" runat="server" Width="200px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="PERIOD OF WARRANTY/CONTRACT" Width="300px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="POWTo" runat="server" Width="90px" Font-Bold="True" CssClass="spanNum"></asp:Label>to
                            <asp:Label ID="POWFrom" runat="server" Width="70px" Font-Bold="True" CssClass="spanNum"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="LOCATION" Width="300px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Location" runat="server" Width="200px" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="REASON FOR CLAIM" Width="300px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="ReasonForClaim" runat="server" Width="200px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="SERVICE ORDER NO" Width="300px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="ServiceOrderNo" runat="server" Width="200px" Font-Bold="True" CssClass="spanNum"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="CONTRACT VALUE (Required for PM Charge)"
                                Width="350px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="ContractValue" runat="server" Style="font-weight: bold; font-size: 15pt;
                                font-family: Garamond;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="STAX" runat="server" Text="SERVICE TAX " Width="300px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="ServiceTax" runat="server" Style="font-weight: bold; font-size: 15pt;
                                font-family: Garamond;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text="TOTAL AMOUNT" Width="300px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Total" runat="server" Style="font-weight: bold; font-size: 15pt; font-family: Garamond;"></asp:Label>
                        </td>
                    </tr>
                </table>
                <div style="margin-top: 35px; font-weight: bold; font-style: italic;">
                    <asp:Label ID="Name" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

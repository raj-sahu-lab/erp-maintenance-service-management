<%@ page language="C#" autoeventwireup="true" inherits="PrintInvoice, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Invoice</title>
    <link href="CSS/PrintInvoice.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="DivOuter">
        <div class="DivTopMe">
        </div>
        
        <div style="float: left; border: 1px solid black; width: 755px;">
            <div id="Lside" runat="server" style="float: left; width: 470px; padding: 8px; border-right: 1px solid black;">
                <asp:Label ID="Client" runat="server"></asp:Label>
            </div>
            <div id="Rside" runat="server" style="float: left; padding-top: 5px;">
                <asp:Label ID="Label10" runat="server" Text="Invoice No."></asp:Label>
                <br />
                <asp:Label ID="InvoiceNo" runat="server" Font-Bold="True" CssClass="spanNum" ></asp:Label>
                <br />
                <asp:Label ID="Label11" runat="server" Text="Date"></asp:Label>
                <asp:Label ID="InvoiceDate" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
            </div>
        </div>

        <div style="float: left; border: 1px solid black; width: 755px;">
            <div id="one" runat="server" style="float: left; width: 470px; padding: 8px; border-right: 1px solid black;">
                <br />
                <asp:Label ID="Description" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Amount 0f Claim" Font-Bold="True"></asp:Label>
                <br />
                <asp:Label ID="ServiceTax" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="lblword" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
                <br />
                <br />
                <asp:Label ID="DebitNo" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
                <br />
                <br />
            </div>
            <div id="two" runat="server" style="float: left; padding-top: 5px;">
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="AmountOfClaim" runat="server" CssClass="spanNum" Width="230px" Style="text-align: right;
                    font-weight: bolder; font-size: 21px;"></asp:Label>
                <br />
                <asp:Label ID="TatolServiceTax" runat="server" Width="230px" CssClass="spanNum" Style="text-align: right;
                    font-weight: bolder; font-size: 21px;"></asp:Label>
            </div>
            <div class="clear">
                &nbsp;</div>
        </div>

        <div style="float: left; margin-bottom: 10px; border: 1px solid black; width: 755px;">
            <div id="Three" runat="server" style="float: left; width: 470px; padding: 8px; border-right: 1px solid black;">
                <asp:Label ID="Label6" runat="server" Text="Total Rs. " Width="400px" style="text-align:right;" ></asp:Label>
            </div>
            <div id="Four" runat="server" style="float: left; padding-top: 5px;">
                <asp:Label ID="TatolAmount" runat="server" CssClass="spanNum" Width="230px" Style="text-align: right;
                    font-weight: bolder; font-size: 21px;"></asp:Label>
            </div>
            <div class="clear">
                &nbsp;</div>
        </div>

        <div class="DivMid">
            <div>
                <asp:Label ID="Name" runat="server" Width="700px" Font-Bold="True" CssClass="spanNum"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Authorized Signature" Width="700px"></asp:Label>
                <asp:Label ID="ServiceTaxNumber" runat="server" Width="500px" Font-Bold="True" CssClass="spanNum"></asp:Label>
                <asp:Label ID="PanNumber" runat="server" Width="500px" Font-Bold="True" CssClass="spanNum"></asp:Label>
            </div>
        </div>

    </div>
    </form>
</body>
</html>

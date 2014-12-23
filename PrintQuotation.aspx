<%@ page language="C#" autoeventwireup="true" inherits="PrintQuotation, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Statement</title>
    <link href="CSS/PrintInvoice.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="DivOuter">
        <div class="DivTopMe">
        </div>

        <div style="text-align: right; padding: 2px 5px 5px 0;">
            <asp:Label ID="TinNumber" runat="server" CssClass="spanNum" Style="font-size: 10pt;"></asp:Label>
        </div>
        <div style="float: left; margin-bottom: 10px; border: 1px solid black; width: 755px;">
            <div id="Lside" runat="server" style="float: left; width: 470px; padding: 8px; border-right: 1px solid black;">
                To,
                <br />
                The Director
                <br />
                <asp:Label ID="Client" runat="server"></asp:Label>
            </div>
            <div id="Rside" runat="server" style="float: left; padding-top: 5px;">
                <asp:Label ID="Label3" runat="server" Text="Quotation No."></asp:Label>
                <asp:Label ID="QuotationNo" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Date"></asp:Label>
                <asp:Label ID="QuotationDate" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
                <br />
                <asp:Label ID="Label1" runat="server" Text="Ref. No."></asp:Label>
                <asp:Label ID="RefrenceNo" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
            </div>
            <div class="clear">
                &nbsp;</div>
        </div>

        <div style="padding: 5px; text-align: justify; border: 1px solid black;">
            Dear Sir,
            <br />
            <br />
            We thank you for your enquiry and have pleasure submitting here under our quotation,
            which is in subject to our general condition noted below. We trust you will find
            our offer acceptable and await your valued order which will receive our best attention.
            We shall not in any way be responsible for loss due to damage, delays or frustration
            arising from Strikes, Lockout, Cessation of Labour, Transport delay and accident
            of any kind at our Principal Factory, which is beyond our control.
            <div class="clear">
                &nbsp;</div>
        </div>
        <asp:GridView ID="grdCenter" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="sDsQuotation" ShowFooter="true">
            <FooterStyle Height="100px" />
            <Columns>
                <asp:BoundField DataField="Row" HeaderText="Item No." ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="400px"
                    ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-HorizontalAlign="Right"
                    ItemStyle-Width="65px" ItemStyle-Font-Bold="true" />
                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price (Rs.)" ItemStyle-HorizontalAlign="Right"
                    ItemStyle-Width="100px" ItemStyle-Font-Bold="true" HtmlEncode="false"  DataFormatString="{0:F2}" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" ItemStyle-HorizontalAlign="Right"
                    ItemStyle-Width="100px" ItemStyle-Font-Bold="true" HtmlEncode="false"  DataFormatString="{0:F2}" />
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
        <asp:SqlDataSource ID="sDsQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
            SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY QID) AS Row, [QID], Description, [Quantity], [UnitPrice] , [EmpName], [Amount] FROM [vwQuotation] WHERE ([QuotationNo] = @QuotationNo)">
            <SelectParameters>
                <asp:SessionParameter SessionField="strCode" Name="QuotationNo" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div style="padding: 5px; text-align: left; border: 1px solid black;">
            <asp:Label ID="lblMake" runat="server" CssClass="spanNum" Font-Bold="True" 
                Font-Italic="True"></asp:Label>
            <br /><br />
            <asp:Label ID="lblDelivery" runat="server" CssClass="spanNum"></asp:Label>
            <br />
            <asp:Label ID="lblValidity" runat="server" CssClass="spanNum"></asp:Label>
            <br />
            <asp:Label ID="lblPayment" runat="server" CssClass="spanNum"></asp:Label>
            <br />
            <asp:Label ID="lblVat" runat="server" CssClass="spanNum" Font-Bold="True" 
                Font-Italic="True"></asp:Label>
            <br />
            <asp:Label ID="lblWarranty" runat="server" CssClass="spanNum"></asp:Label>
            <br />
            <asp:Label ID="lblNote" runat="server" CssClass="spanNum"></asp:Label>
            <div class="clear">
                &nbsp;</div>
            <div class="aSing">
                <asp:Label ID="Name" runat="server" Width="600px"></asp:Label>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

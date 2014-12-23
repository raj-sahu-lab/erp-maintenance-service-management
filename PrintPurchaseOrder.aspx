<%@ page language="C#" autoeventwireup="true" inherits="PrintPurchaseOrder, App_Web_lzdpsiox" %>

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
        <div style="float: left; margin-bottom: 10px; border: 1px solid black; width: 755px;">
            <div id="Lside" runat="server" style="float: left; width: 470px; padding: 8px; border-right: 1px solid black;">
                To,
                <br />
                <br />
                <asp:Label ID="Client" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:Label ID="CltAddress" runat="server"></asp:Label>
            </div>
            <div id="Rside" runat="server" style="float: left; padding-top: 5px;">
                <asp:Label ID="Label2" runat="server" Text="P.O. No. : "></asp:Label>
                <br />
                <asp:Label ID="PONo" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Date : "></asp:Label>
                <asp:Label ID="PODate" runat="server" Font-Bold="True" CssClass="spanNum"></asp:Label>
            </div>
            <div class="clear">
                &nbsp;</div>
        </div>
        <div style="border-top: 2px solid black; border-bottom: 2px solid black; padding: 10px;">
            Dear Sir,
            <br />
            <br />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <asp:GridView ID="grdCenter" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="sDsQuotation" PageSize="50"
            ShowFooter="true">
            <FooterStyle Height="100px" />
            <Columns>
                <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="40" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="300px"
                    ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="PartCodeNo" HeaderText="Part Code No" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-Width="120px" />
                <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-HorizontalAlign="Right"
                    ItemStyle-Width="45px" ItemStyle-Font-Bold="true" />
                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price (Rs.)" ItemStyle-HorizontalAlign="Right"
                    ItemStyle-Width="90px" ItemStyle-Font-Bold="true" HtmlEncode="false" DataFormatString="{0:F2}" />
                <asp:BoundField DataField="Amount" HeaderText="Total Price" ItemStyle-HorizontalAlign="Right"
                    ItemStyle-Width="100px" ItemStyle-Font-Bold="true" HtmlEncode="false" DataFormatString="{0:F2}" />
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
        <asp:SqlDataSource ID="sDsQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
            SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY POID) AS Row, [POID], Description, PartCodeNo  , [Quantity], [UnitPrice] , [Quantity]* [UnitPrice] as   [Amount] FROM [vwPurchaseOrder] WHERE ([PoNo] = @PoNo)">
            <SelectParameters>
                <asp:SessionParameter SessionField="strCode" Name="PoNo" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="image">
            <img alt="" src="mImage/mTables.jpg" />
            <div class="text">
                <asp:Label ID="Label1" runat="server" Width="90px">Total Price</asp:Label>
                <asp:Label ID="GTAMT" runat="server" CssClass="spanNum" Width="90px"></asp:Label>
                <br />
                <asp:Label ID="lblCD" runat="server" Width="90px"></asp:Label>
                <asp:Label ID="DisAmt" runat="server" CssClass="spanNum" Width="90px" ></asp:Label>
                <br />
                <asp:Label ID="Label3" runat="server" Width="90px">Price </asp:Label>
                <asp:Label ID="TAMT" runat="server" CssClass="spanNum" Width="90px"></asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server" Width="90px">CST 2% </asp:Label>
                <asp:Label ID="Cst" runat="server" CssClass="spanNum" Width="90px"></asp:Label>
                <br />
                <asp:Label ID="Label6" runat="server" Width="90px" >Amount </asp:Label>
                <asp:Label ID="Famt" runat="server" CssClass="spanNum" Width="90px"></asp:Label>
            </div>
            <div class="clear">
                &nbsp;</div>
        </div>
        <div class="clear">
            &nbsp;</div>
        <div style="float: left; padding-left: 10px; margin-top: 150px;">
            Thanking You,
            <br />
            <br />
            Your Faithfully
            <br />
            <br />
            <asp:Label ID="Name" runat="server"></asp:Label>
            <br />
            <br />
            AUTHORISED SIGNATURE
            <br />
            <br />
            Encl: As above
        </div>
    </div>
    </form>
</body>
</html>

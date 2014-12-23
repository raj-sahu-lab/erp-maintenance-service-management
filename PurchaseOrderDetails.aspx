<%@ page title=" Purchase Order | Purchase Order Details " language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="PurchaseOrderDetails, App_Web_tjb0csgq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .highlight
        {
            text-decoration: none;
            color: black;
            background: yellow;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.tablesorter.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $("#Gridview1").tablesorter({ debug: false, widgets: ['zebra'], sortList: [[0, 0]] });
        });
    </script>
    <script type="text/javascript" language="javascript">
        function pageLoad(sender, args) {
            jQuery(document).ready(function () {
                $("#Gridview1").tablesorter({ debug: false, widgets: ['zebra'], sortList: [[0, 0]] });
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <fieldset id="fldStream" style="border: 1px solid #006600; width: 95.5%; margin: 16px;">
        <legend><span class="spanCss">Purchase Order</span></legend>
        <div>
            <table style="border-bottom-style: dashed; border-bottom-width: 1px; border-top-style: dashed;
                border-top-width: 1px;">
                <tr>
                    <td class="TopLSerMsg">
                        <div class="header-search">
                            <asp:TextBox ID="txtSearch" runat="server" Width="435px" autocomplete="off" />
                            <asp:Button ID="cmdSearch" runat="server" CssClass="button_search" OnClick="cmdSearch_Click"
                                Text="Search" />
                        </div>
                    </td>
                    <td class="TopRMsg">
                        <asp:Button ID="cmdNewItem" runat="server" OnClick="cmdNewItem_Click" Text="New P.O."
                            CssClass="Button_submit" Height="25px" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td class="TopLMsg">
                        Filter By&nbsp; [Purchase Order No]
                    </td>
                    <td class="TopRMsg">
                        <asp:Label ID="lblTotalRec" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="PnlHead" runat="server" Style="width: 90%; margin-top: 13px; margin-left: 60px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwPurchaseOrder" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwPurchaseOrder" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwPurchaseOrder" EnableModelValidation="True"
                                                    PagerStyle-CssClass="pgr" OnRowCommand=" grdvwPurchaseOrder_RowCommand" ShowFooter="True"
                                                    PageSize="300" AllowPaging="True" AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Name" HeaderText="Firm" ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="250px" />
                                                        <asp:TemplateField HeaderText="PO No">
                                                            <ItemStyle Width="200px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCode" Text='<%# HighlightText(Eval("Code").ToString()) %>' runat="server"
                                                                    CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="PODate" HeaderText="Date" ItemStyle-HorizontalAlign="Center"
                                                            ItemStyle-Width="60px" />
                                                        <asp:BoundField DataField="Items" HeaderText="Items" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right"
                                                            ItemStyle-Font-Bold="true" />
                                                        <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right"
                                                            ItemStyle-Font-Bold="true" />
                                                        <asp:BoundField DataField="TotalPrice" HeaderText="Total" ItemStyle-Width="100px"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Font-Bold="true" />
                                                        <asp:TemplateField HeaderText="View" ItemStyle-Width="30px">
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgview" runat="server" CausesValidation="false" CommandArgument='<% #Bind("Code") %>'
                                                                        CommandName="cmdView" Text="View" ImageUrl="~/mImage/view.jpg" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="30px">
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgDelete" OnClientClick="return confirm('Are you sure you want to Delete ?');"
                                                                        runat="server" CausesValidation="false" CommandArgument='<% #Bind("Code") %>'
                                                                        CommandName="cmdDelete" Text="Delete" ImageUrl="~/mImage/Delete.jpg" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Print" ItemStyle-Width="30px">
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgPrint" runat="server" CausesValidation="false" CommandArgument='<% #Bind("Code") %>'
                                                                        CommandName="cmdPrint" Text="Print" ImageUrl="~/mImage/Print.jpg" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsvwPurchaseOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY PONo) AS Row , [PONo] as Code, convert(varchar, [PODate], 103) as  PODate, [Name], COUNT(MacID) As Items,  SUM(Quantity) as Quantity ,SUM(TotalPrice) as TotalPrice  From vwPurchaseOrder group by  [PONo] ,PODate ,[Name] Order by Code Desc"
                                                    FilterExpression="Code like '%{0}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="Code" ControlID="txtSearch" PropertyName="Text" />
                                                    </FilterParameters>
                                                </asp:SqlDataSource>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="cmdSearch" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </fieldset>
</asp:Content>

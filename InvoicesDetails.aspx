<%@ page title="Invoices | Invoices Details" language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="InvoicesDetails, App_Web_tjb0csgq" %>

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
        <legend><span class="spanCss">Invoices</span></legend>
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
                        <asp:Button ID="cmdNewItem" runat="server" OnClick="cmdNewItem_Click" Text="New Invoices"
                            CssClass="Button_submit" Height="35px" Width="110px" />
                    </td>
                </tr>
                <tr>
                    <td class="TopLMsg">
                        Filter By&nbsp; [InvoiceNo]
                    </td>
                    <td class="TopRMsg">
                        <asp:Label ID="lblTotalRec" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="PnlHead" runat="server" Style="width: 98%; margin-top: 13px; margin-left: 10px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwInvoices" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwInvoices" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code,InvoiceID" DataSourceID="sDsvwInvoices" EnableModelValidation="True"
                                                    PagerStyle-CssClass="pgr" OnRowCommand=" grdvwInvoices_RowCommand" ShowFooter="True"
                                                    PageSize="30" AllowPaging="True" AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Code" HeaderText="Invoice No" ItemStyle-Width="200px"
                                                            ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="InvoiceDate" HeaderText="Dates" ItemStyle-Width="70px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="170px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="ManName" HeaderText="Manufacturer" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="TatolAmount" HeaderText="Amount" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Right" ItemStyle-Font-Bold="true" />
                                                        <asp:BoundField DataField="PaymentStatus" HeaderText="Status" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Right" ItemStyle-Font-Bold="true" />
                                                        <asp:TemplateField HeaderText="View" ItemStyle-Width="30px">
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgview" runat="server" CausesValidation="false" CommandArgument='<% #Bind("Code") %>'
                                                                        CommandName="cmdView" Text="View" ImageUrl="~/mImage/view.jpg" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Del" ItemStyle-Width="30px">
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
                                                <asp:SqlDataSource ID="sDsvwInvoices" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY InvoiceNo) AS Row ,[InvoiceNo] As Code,InvoiceID,convert(varchar, [InvoiceDate], 103) as InvoiceDate,SUBSTRING(Name,0,20)+'...' as [Name],PaymentStatus ,InvoiceDate,SUBSTRING(ManName,0,28)+'...' as ManName ,TatolAmount From vwInvoices  Order by Code"
                                                    FilterExpression="Code like '%{0}%'">
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

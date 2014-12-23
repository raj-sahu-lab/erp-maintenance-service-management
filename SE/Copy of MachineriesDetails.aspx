<%@ page title="Equipment | Equipment Details" language="C#" masterpagefile="~/SE/AdminPage.master" autoeventwireup="true" inherits="MachineriesDetails, App_Web_xvcce3qd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .highlight
        {
            text-decoration: none;
            color: black;
            background: yellow;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
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
        <legend><span class="spanCss">Equipment</span></legend>
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
                        <asp:Button ID="cmdNewItem" runat="server" OnClick="cmdNewItem_Click" Text="New Equipment"
                            CssClass="Button_submit" Height="25px" Width="110px" />
                    </td>
                </tr>
                <tr>
                    <td class="TopLMsg">
                        Filter By&nbsp; [Equipment]
                    </td>
                    <td class="TopRMsg">
                        <asp:Label ID="lblTotalRec" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="PnlHead" runat="server" Style="width: 70%; margin-top: 13px; margin-left: 140px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwMachineries" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwMachineries" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwMachineries" EnableModelValidation="True"
                                                    PagerStyle-CssClass="pgr" OnRowCommand=" grdvwMachineries_RowCommand" ShowFooter="True"
                                                    PageSize="300" AllowPaging="True" AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" SortExpression="Code" ItemStyle-Width="30px"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                            <asp:BoundField DataField="ManName" HeaderText="Manufacturer" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="Equipment" >
                                                            <ItemStyle Width="150px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMacName" Text='<%# HighlightText(Eval("MacName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>                                                        
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
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsvwMachineries" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY MacID) AS Row , [MacID] As Code , [ManName] , [MacName] From vwMachineries Order by Code"
                                                    FilterExpression="MacName like '%{0}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="MacName" ControlID="txtSearch" PropertyName="Text" />
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

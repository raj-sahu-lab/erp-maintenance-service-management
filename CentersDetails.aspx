<%@ page title="Organization | Organization Details" language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="CentersDetails, App_Web_tjb0csgq" %>

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
        <legend><span class="spanCss">Organization Details</span></legend>
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
                        <asp:Button ID="cmdNewItem" runat="server" OnClick="cmdNewItem_Click" Text="New Organization"
                            CssClass="Button_submit" Height="25px" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td class="TopLMsg">
                        Filter By&nbsp; [Organization Name]
                    </td>
                    <td class="TopRMsg">
                        <asp:Label ID="lblTotalRec" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="PnlHead" runat="server" Style="width: 80%; margin-top: 13px; margin-left: 100px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpAcademicOrganizationDetails" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdAcademicOrganizationDetails" runat="server" CssClass="mGrid"
                                                    AutoGenerateColumns=" False" DataKeyNames="Code" DataSourceID="sDsAcademicOrganizationDetails"
                                                    EnableModelValidation="True" PagerStyle-CssClass="pgr" OnRowCommand=" grdAcademicOrganizationDetails_RowCommand"
                                                    ShowFooter="True" PageSize="30" AllowPaging="True" AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" SortExpression="Code" ItemStyle-Width="30px"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                                            <ItemStyle Width="150px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblName" Text='<%# HighlightText(Eval("Name").ToString()) %>' runat="server"
                                                                    CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="HeadName" HeaderText="Contact Person" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Cell" HeaderText="Contact" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Left" />
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
                                                <asp:SqlDataSource ID="sDsAcademicOrganizationDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY OrgID) AS Row , [OrgID] As Code , [Name] , [HeadName] , [Cell] , [TinNumber] , [PanNumber] , [ServiceTaxNumber]  From AcademicOrganizationDetails Order by Code"
                                                    FilterExpression="Name like '%{0}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="Name" ControlID="txtSearch" PropertyName="Text" />
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

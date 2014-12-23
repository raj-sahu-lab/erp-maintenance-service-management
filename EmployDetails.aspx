<%@ page title="Employee | Employee Details | Employee Register" language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="EmployDetails, App_Web_tjb0csgq" %>

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
        <legend><span class="spanCss">Employee List</span></legend>
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
                        <asp:Button ID="cmdNewItem" runat="server" OnClick="cmdNewItem_Click" Text="New Employee"
                            CssClass="Button_submit" Height="25px" Width="105px" />
                    </td>
                </tr>
                <tr>
                    <td class="TopLMsg">
                        Filter By&nbsp; [Employee , Mobile]
                    </td>
                    <td class="TopRMsg">
                        <asp:Label ID="lblTotalRec" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="PnlHead" runat="server" Style="width: 85%; margin-top: 13px; margin-left: 90px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwEmploy" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwEmploy" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwEmploy" EnableModelValidation="True" PagerStyle-CssClass="pgr"
                                                    OnRowCommand=" grdvwEmploy_RowCommand" ShowFooter="True" PageSize="30" AllowPaging="True"
                                                    AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Photo">
                                                            <ItemStyle Width="28px" HorizontalAlign="Center"/>
                                                            <ItemTemplate>
                                                                <asp:Image ID="imgAdmin" Height="25" CssClass="MyImage" runat="server" ImageUrl='<%# Eval("Upload").ToString() %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Employee">
                                                            <ItemStyle Width="200px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEmpName" Text='<%# HighlightText(Eval("EmpName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="DesName" HeaderText="Desgination" ItemStyle-Width="100px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="City" HeaderText="City" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="Mobile" >
                                                            <ItemStyle Width="70px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMobile" Text='<%# HighlightText(Eval("Mobile").ToString()) %>'
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
                                                <asp:SqlDataSource ID="sDsvwEmploy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY EmpID) AS Row , [EmpID] As Code , [DesName] , [EmpName] , [City] , [Mobile] , '~/AdmImg/' + Upload as Upload  From vwEmploy Order by Code"
                                                    FilterExpression="EmpName like '%{0}%' or Mobile like '%{1}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="EmpName" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="Mobile" ControlID="txtSearch" PropertyName="Text" />
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

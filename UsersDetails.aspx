<%@ page title="User's Role Details | User's Role | New User's Role" language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="UsersDetails, App_Web_tjb0csgq" %>

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
        <legend><span class="spanCss">User's Role</span></legend>
        <div>
            <table style="border-bottom-style: dashed; border-bottom-width: 1px; border-top-style: dashed;
                border-top-width: 1px;">
                <tr>
                    <td class="TopLSerMsg">
                        <div class="header-search">
                            <asp:TextBox ID="txtSearch" runat="server" Width="435px" autocomplete="off" />
                           <asp:Button ID="cmdSearch" runat="server" CssClass="button_search" OnClick="cmdSearch_Click" Text="Search" />
                        </div>
                    </td>
                    <td class="TopRMsg">
                        <asp:Button ID="cmdNCust" runat="server" OnClick="cmdNCust_Click" Text="New User's"
                            CssClass="Button_submit" Height="25px" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td class="TopLMsg">
                        Filter By&nbsp; [Name,Gropus,Users]
                    </td>
                    <td class="TopRMsg">
                        <asp:Label ID="lblTotalRec" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="PnlHead" runat="server" Style="width: 98%; margin-top: 13px; margin-left: 9px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdUser" runat="server" CssClass="mGrid" AutoGenerateColumns="False"
                                                    DataKeyNames="Code" DataSourceID="sDsUsers" EnableModelValidation="True" PagerStyle-CssClass="pgr"
                                                    OnRowCommand="grdCDetails_RowCommand" ShowFooter="True" PageSize="30" AllowPaging="True"
                                                    AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Photo">
                                                            <ItemStyle />
                                                            <ItemTemplate>
                                                                <asp:Image ID="imgAdmin" Height="25" CssClass="MyImage" runat="server" ImageUrl='<%# Eval("UPhoto").ToString() %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Name" HeaderText="Company" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="210px" />
                                                        <asp:TemplateField HeaderText="Name" SortExpression="UserName">
                                                            <ItemStyle Width="140px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUserName" Text='<%# HighlightText(Eval("UserName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Group" SortExpression="UserType">
                                                            <ItemStyle Width="40px" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUserType" Text='<%# HighlightText(Eval("UserType").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="User's" SortExpression="UserID">
                                                            <ItemStyle Width="70px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUserID" Text='<%# HighlightText(Eval("UserID").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Dor" HeaderText="Register" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Doe" HeaderText="Expired" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="DOREM" HeaderText="Day's" ItemStyle-HorizontalAlign="Left" />
                                                        
                                                        <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="View">
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgview" runat="server" CausesValidation="false" CommandArgument='<% #Bind("Code") %>'
                                                                        CommandName="cmdView" Text="View" ImageUrl="~/mImage/view.jpg" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <div align="center">
                                                                    <asp:ImageButton ID="imgDelete" OnClientClick="return confirm('Are you sure you want to Delete ?');"
                                                                        runat="server" CausesValidation="false" CommandArgument='<% #Bind("Code") %>'
                                                                        CommandName="cmdDelete" Text="Delete" ImageUrl="~/mImage/Delete.jpg" />
                                                                    <div align="center">
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY UserCode) AS Row , [Status],[UserCode] As Code ,UPhoto,[UserName],[UserType],[UserID],[EMail],Convert(varchar,[DOR],103) as DOR,Convert(varchar,[DOE],103) as DOE,[DOREM],[Name]FROM [vw_UserDetails] Order By Code"
                                                    FilterExpression="UserName like '%{0}%' or UserType like '%{1}%' or UserID like '%{2}%'">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="UserName" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="UserType" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="UserID" ControlID="txtSearch" PropertyName="Text" />
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

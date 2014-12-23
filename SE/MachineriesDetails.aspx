<%@ page title="Equipment | Equipment Details" language="C#" masterpagefile="~/SE/AdminPage.master" autoeventwireup="true" inherits="MachineriesDetails, App_Web_qupml30j" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="../js/uPanel.js"></script>
    <script type="text/javascript">
        isProgressBar();
        NewDoc();
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
        <ProgressTemplate>
            <div class="background">
            </div>
            <div class="modal">
                Progress ...
                <img src="~/mImage/ajax-loader.gif" alt="Progress......" /></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <fieldset id="fldStream" style="border: 1px solid #006600; width: 95.5%; margin: 16px;">
        <legend><span class="spanCss">Equipment</span></legend>
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table style="border-bottom-style: dashed; border-bottom-width: 1px; border-top-style: dashed;
                        border-top-width: 1px;">
                        <tr>
                            <td class="TopLSerMsg">
                                <div class="header-search" style="width: 730px;">
                                    <asp:TextBox ID="txtSearch" runat="server" Width="400px" autocomplete="off" />
                                    <asp:DropDownList ID="ddlMID" runat="server" AutoPostBack="True" DataSourceID="sDsMID"
                                        DataTextField="ManName" DataValueField="MID" Width="200px" AppendDataBoundItems="True"
                                        OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsMID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT Distinct [MID], [ManName] FROM [vwMachineries] ORDER BY [ManName]">
                                    </asp:SqlDataSource>
                                    <asp:Button ID="cmdSearch" runat="server" CssClass="button_search" OnClick="cmdSearch_Click"
                                        Text="Search" />
                                </div>
                            </td>
                            <td class="TopRMsg">
                                <asp:Button ID="cmdNewItem" runat="server" OnClick="cmdNewItem_Click" Text="New Equipment"
                                    CssClass="Button_submit" Height="35px" Width="120px" />
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
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlMID" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
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
                                                    PageSize="50" AllowPaging="True" AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" SortExpression="Code" ItemStyle-Width="30px"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="ManName" HeaderText="Manufacturer" ItemStyle-Width="200px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="Equipment">
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
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY MacID) AS Row , [MacID] As Code , [ManName] , [MacName] From vwMachineries where MID = @MID Order by Code"
                                                    FilterExpression="MacName like '%{0}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="MacName" ControlID="txtSearch" PropertyName="Text" />
                                                    </FilterParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlMID" Name="MID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                    </SelectParameters>
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

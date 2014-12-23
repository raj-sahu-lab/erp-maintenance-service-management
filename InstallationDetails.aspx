<%@ page title=" Installation | Installation Details " language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="InstallationDetails, App_Web_tjb0csgq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="js/uPanel.js"></script>
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
                <img src="mImage/ajax-loader.gif" alt="Progress......" /></div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <fieldset id="fldStream" style="border: 1px solid #006600; width: 95.5%; margin: 16px;">
        <legend><span class="spanCss">Installation</span></legend>
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table style="border-bottom-style: dashed; border-bottom-width: 1px; border-top-style: dashed;
                        border-top-width: 1px;">
                        <tr>
                            <td class="TopLSerMsg">
                                <div class="header-search" style="width: 770px;">
                                    <asp:TextBox ID="txtSearch" runat="server" Width="435px" autocomplete="off" />
                                    <asp:DropDownList ID="ddlMID" runat="server" AutoPostBack="True" DataSourceID="sDsMacName"
                                        DataTextField="ManName" DataValueField="MID" Width="200px" AppendDataBoundItems="True"
                                        OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsMacName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT Distinct [MID], [ManName] FROM [vwInstallation] "></asp:SqlDataSource>
                                    <asp:Button ID="cmdSearch" runat="server" CssClass="button_search" OnClick="cmdSearch_Click"
                                        Text="Search" />
                                </div>
                            </td>
                            <td class="TopRMsg">
                                <asp:Button ID="cmdNewItem" runat="server" OnClick="cmdNewItem_Click" Text="New Installation"
                                    CssClass="Button_submit" Height="35px" Width="130px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="TopLMsg">
                                Filter By&nbsp; [Invoice No , Serial No & Hospitals]
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
        <asp:Panel ID="PnlHead" runat="server" Style="width: 98%; margin-top: 13px; margin-left: 15px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwInstallation" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwInstallation" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwInstallation" EnableModelValidation="True"
                                                    PagerStyle-CssClass="pgr" OnRowCommand=" grdvwInstallation_RowCommand" ShowFooter="True"
                                                    PageSize="50" AllowPaging="True" AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Hospitals">
                                                            <ItemStyle Width="250px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCDName" Text='<%# HighlightText(Eval("CDName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="MacName" HeaderText="Equipment" ItemStyle-Width="250px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="Invoice No">
                                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInvoiceNo" Text='<%# HighlightText(Eval("InvoiceNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Serial No.">
                                                            <ItemStyle Width="120px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSerialNo" Text='<%# HighlightText(Eval("SerialNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" Width="120" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ServiceFrom" HeaderText="Install Date" ItemStyle-Width="70px"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="WEndDate" HeaderText="Warrant End Days" ItemStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Right" />
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
                                                <asp:SqlDataSource ID="sDsvwInstallation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY InvoiceNo) AS Row , [InvoiceNo] As Code , WEndDate , [InvoiceNo] , CASE  WHEN len(MacName) > 40  THEN SUBSTRING(MacName,0,40) + '...' ELSE [MacName] END as [MacName], [SerialNo] , CASE  WHEN len(CDName) > 30  THEN SUBSTRING(CDName,0,30) + '...' ELSE [CDName] END as [CDName] ,convert(varchar, [ServiceFrom], 103) as ServiceFrom From vwInstallation where MID = @MID Order by Code Desc"
                                                    FilterExpression=" InvoiceNo like '%{0}%' or SerialNo like '%{1}%' or CDName like '%{2}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="InvoiceNo" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="SerialNo" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="CDName" ControlID="txtSearch" PropertyName="Text" />
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

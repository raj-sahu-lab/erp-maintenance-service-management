<%@ page title=" Purchase Order | Purchase Order Details " language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="rptPurchaseOrder, App_Web_tjb0csgq" enableeventvalidation="false" %>

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
    <fieldset id="fldStream" style="border: 1px solid #006600; width: 99.5%; margin: 0px;">
        <legend><span class="spanCss">Purchase Order</span></legend>
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table style="border-bottom-style: dashed; border-bottom-width: 1px; border-top-style: dashed;
                        border-top-width: 1px;">
                        <tr>
                            <td class="TopLSerMsg">
                                <div class="header-search" style="width: 700px;">
                                    <asp:TextBox ID="txtSearch" runat="server" Width="370px" autocomplete="off" />
                                    <asp:DropDownList ID="ddlMID" runat="server" AutoPostBack="True" DataSourceID="sDsMID"
                                        DataTextField="ManName" DataValueField="MID" Width="200px" AppendDataBoundItems="True"
                                        OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsMID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT Distinct [MID], [ManName] FROM [vwPurchaseOrder] ORDER BY [ManName]">
                                    </asp:SqlDataSource>
                                    <asp:Button ID="cmdSearch" runat="server" CssClass="button_search" OnClick="cmdSearch_Click"
                                        Text="Search" />
                                </div>
                            </td>
                            <td class="TopRMsg">
                                <asp:ImageButton ID="imgbExpExcel" runat="server" OnClick="imgbExpExcel_Click" CssClass="Button_submit"
                                    Height="30px" ImageUrl="~/mImage/Excel-icon.png" Width="30px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="TopLMsg">
                                Filter By&nbsp; [PO No. , PO Date , Part Code No.]
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
        <asp:Panel ID="PnlHead" runat="server" Style="width: 99%; margin-top: 13px; margin-left: 1px;
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
                                                    PagerStyle-CssClass="pgr" ShowFooter="True" PageSize="30" AllowPaging="True"
                                                    AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="PO No">
                                                            <ItemStyle Width="30px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPONo" Text='<%# HighlightText(Eval("PONo").ToString()) %>' runat="server"
                                                                    CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PO Date">
                                                            <ItemStyle Width="40px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPODate" Text='<%# HighlightText(Eval("PODate").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Name" HeaderText="Org" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="BankName" HeaderText="Bank Name" ItemStyle-Width="20px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="ChequeNo" HeaderText="Chq No" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="ChequeDate" HeaderText="Chq Date" ItemStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Description" HeaderText="Desc" ItemStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="ManName" HeaderText="Mfr" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="MacName" HeaderText="Eqpt" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="PC No">
                                                            <ItemStyle Width="50px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPartCodeNo" Text='<%# HighlightText(Eval("PartCodeNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="UnitPrice" HeaderText="U/P" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="DisType" HeaderText="DisType" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="DisPct" HeaderText="DisPct" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="DisAmount" HeaderText="Dis Amt" ItemStyle-Width="30px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="TotalPrice" HeaderText="T/P" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Left" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsvwPurchaseOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY POID) AS Row , [POID] As Code , [PONo] ,convert(varchar, [PODate], 103) as PODate, [Name] , [BankName] , [ChequeNo] ,convert(varchar, [ChequeDate], 103) as ChequeDate, [Description] , [ManName] , [MacName] , [PartCodeNo] , [Quantity] , [UnitPrice] , [DisType] , [DisPct] , [DisAmount] , [TotalPrice]  From vwPurchaseOrder where MID=@MID Order by Code"
                                                    FilterExpression="PONo like '%{0}%' or PODate like '%{1}%' or PartCodeNo like '%{2}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="PONo" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="PODate" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="PartCodeNo" ControlID="txtSearch" PropertyName="Text" />
                                                    </FilterParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlMID" Name="MID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </ContentTemplate>
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

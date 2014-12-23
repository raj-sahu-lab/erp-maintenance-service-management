<%@ page title=" Quotation | Quotation Details " language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="rptQuotation, App_Web_tjb0csgq" enableeventvalidation="false" %>

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

    <fieldset id="fldStream" style="border: 1px solid #006600; width: 98.5%; margin: 0px;">
        <legend><span class="spanCss">Quotation</span></legend>
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
                                        SelectCommand="SELECT Distinct [MID], [ManName] FROM [vwQuotation] ORDER BY [ManName]">
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
                                Filter By&nbsp; [Quotation No. , Quotation Date , Refrence No.]
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

        <asp:Panel ID="PnlHead" runat="server" Style="width: 99.5%; margin-top: 13px; margin-left: 1px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwQuotation" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwQuotation" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwQuotation" EnableModelValidation="True"
                                                    PagerStyle-CssClass="pgr" ShowFooter="True" PageSize="30" AllowPaging="True"
                                                    AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Qut No">
                                                            <ItemStyle Width="70px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblQuotationNo" Text='<%# HighlightText(Eval("QuotationNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Name" HeaderText="Org" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="Qut Date">
                                                            <ItemStyle Width="60px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblQuotationDate" Text='<%# HighlightText(Eval("QuotationDate").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Ref No.">
                                                            <ItemStyle Width="50px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRefrenceNo" Text='<%# HighlightText(Eval("RefrenceNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="CDName" HeaderText="Hosp" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="EmpName" HeaderText="Emp" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="ManName" HeaderText="Mfr" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="MacName" HeaderText="Eqpt" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Description" HeaderText="Desc" ItemStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="UnitPrice" HeaderText="U/P" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="TaxType" HeaderText="Tax Type" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Vat" HeaderText="Tax Amt" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Amount" HeaderText="Amt" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Vaildity" HeaderText="Vaildity" ItemStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsvwQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY QID) AS Row , [QID] As Code , [Name] ,convert(varchar, [QuotationDate] ,103) as QuotationDate, [RefrenceNo] , [CDName] , [EmpName] , [ManName] , [MacName] , [Description] , [Quantity] , [UnitPrice] , [Amount] , [QuotationNo] , [Vaildity] , [Vat] , [TaxType]  From vwQuotation where MID=@MID Order by Code"
                                                    FilterExpression="QuotationDate like '%{0}%' or RefrenceNo like '%{1}%' or QuotationNo like '%{2}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="QuotationDate" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="RefrenceNo" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="QuotationNo" ControlID="txtSearch" PropertyName="Text" />
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

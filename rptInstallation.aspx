<%@ page title=" Installation | Installation Details " language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="rptInstallation, App_Web_tjb0csgq" enableeventvalidation="false" %>

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
        <legend><span class="spanCss">Installation</span></legend>

        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table style="border-bottom-style: dashed; border-bottom-width: 1px; border-top-style: dashed;
                        border-top-width: 1px;">
                        <tr>
                            <td class="TopLSerMsg">
                                <div class="header-search" style="width: 720px;">
                                    <asp:TextBox ID="txtSearch" runat="server" Width="380px" autocomplete="off" />
                                    <asp:DropDownList ID="ddlMID" runat="server" AutoPostBack="True" DataSourceID="sDsMID"
                                        DataTextField="ManName" DataValueField="MID" Width="200px" AppendDataBoundItems="True"
                                        OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsMID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT Distinct [MID], [ManName] FROM [vwInstallation] ORDER BY [ManName]">
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
                                Filter By&nbsp; [Customer Name , Equipment , Serial No & Invoice No ]
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
                                        <asp:UpdatePanel ID="udpvwInstallation" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwInstallation" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwInstallation" EnableModelValidation="True"
                                                    PagerStyle-CssClass="pgr" ShowFooter="True" PageSize="50" AllowPaging="True"
                                                    AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Customer Name">
                                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCDName" Text='<%# HighlightText(Eval("CDName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Equipment">
                                                            <ItemStyle Width="50px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMacName" Text='<%# HighlightText(Eval("MacName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Serial No.">
                                                            <ItemStyle Width="90px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSerialNo" Text='<%# HighlightText(Eval("SerialNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" Width="90" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Qty" HeaderText="Qty" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Right" />
                                                        <asp:BoundField DataField="SaleOrderNo" HeaderText="Sales Order" ItemStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="ServiceFrom" HeaderText="Install Date" ItemStyle-Width="70px"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="Invoice No">
                                                            <ItemStyle Width="80px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInvoiceNo" Text='<%# HighlightText(Eval("InvoiceNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="WarrantyPeriod" HeaderText="System Status" ItemStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="SWO" HeaderText="Service Order" ItemStyle-Width="40px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="PM1" HeaderText="1st PM" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="PM2" HeaderText="2st PM" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsvwInstallation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY InsID) AS Row , [InsID] As Code , Qty, SWO,[InvoiceNo] , CASE  WHEN PM1=''  THEN '' ELSE Convert(varchar,[Pm1],103) END as [Pm1], CASE  WHEN PM2=''  THEN '' ELSE Convert(varchar,[Pm2],103) END as [Pm2],WarrantyPeriod,SaleOrderNo,MacName, [SerialNo] , [CDName] ,convert(varchar, [ServiceFrom], 103) as ServiceFrom From vwInstallation where MID=@MID Order by Code"
                                                    FilterExpression=" InvoiceNo like '%{0}%' or SerialNo like '%{1}%' or MacName like '%{2}%' or CDName like '%{3}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="InvoiceNo" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="SerialNo" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="MacName" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="CDName" ControlID="txtSearch" PropertyName="Text" />
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

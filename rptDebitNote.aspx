<%@ page title=" Debit Note | Debit Note Details " language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="rptDebitNote, App_Web_tjb0csgq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="js/uPanel.js"></script>
    <script src="js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="themes/custom-theme/jquery.ui.all.css" />
    <script src="js/Bass.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        isProgressBar();
        NewDoc();

        NewUserDate('txtDateFrom');
        NewUserDate('txtDateTo');

        function pageLoad(sender, args) {
            NewUserDate('txtDateFrom');
            NewUserDate('txtDateTo');
        }
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
        <legend><span class="spanCss">Debit Note</span></legend>
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table style="border-bottom-style: dashed; border-bottom-width: 1px; border-top-style: dashed;
                        border-top-width: 1px;">
                        <tr>
                            <td class="TopLSerMsg">
                                <div style="margin: 3px; font-size: 8pt;">
                                    Date From :
                                    <asp:TextBox ID="txtDateFrom" runat="server" autocomplete="off" Width="80px" />
                                    Date To :
                                    <asp:TextBox ID="txtDateTo" runat="server" autocomplete="off" Width="80px" />
                                    Date Format [MM/dd/yyyy]
                                </div>
                                <div class="header-search" style="width: 700px;">
                                    <asp:TextBox ID="txtSearch" runat="server" Width="370px" autocomplete="off" />
                                    <asp:DropDownList ID="ddlMID" runat="server" AutoPostBack="True" DataSourceID="sDsMID"
                                        DataTextField="ManName" DataValueField="MID" Width="200px" AppendDataBoundItems="True"
                                        OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsMID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT Distinct [MID], [ManName] FROM [vwDebitNote] ORDER BY [ManName]">
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
                                Filter By : Debit Note No. , Customer Name & Equipment
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
        <asp:Panel ID="PnlHead" runat="server" Style="width: 99.5%; margin-top: 13px; margin-left: 5px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwDebitNote" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwDebitNote" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwDebitNote" EnableModelValidation="True"
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
                                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMacName" Text='<%# HighlightText(Eval("MacName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ESerialNo" HeaderText="Serial No." ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="100px" />
                                                        <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-HorizontalAlign="Right"
                                                            ItemStyle-Width="40px" />
                                                        <asp:BoundField DataField="Elegibility" HeaderText="Elegibility" ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="100px" />
                                                        <asp:BoundField DataField="POW" HeaderText="Period of warrenty " ItemStyle-HorizontalAlign="Center"
                                                            ItemStyle-Width="80px" />
                                                        <asp:BoundField DataField="ReasonForClaim" HeaderText="Reason For Claim" ItemStyle-HorizontalAlign="Center"
                                                            ItemStyle-Width="80px" />
                                                        <asp:BoundField DataField="ContractValue" HeaderText="Amount Claimed" ItemStyle-HorizontalAlign="Right"
                                                            ItemStyle-Width="80px" />
                                                        <asp:BoundField DataField="Total" HeaderText="Total Amount" ItemStyle-HorizontalAlign="Right"
                                                            ItemStyle-Width="80px" />
                                                        <asp:TemplateField HeaderText="Debit Note No.">
                                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCode" Text='<%# HighlightText(Eval("Code").ToString()) %>' runat="server"
                                                                    CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="DNDate" HeaderText="Date" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="ServiceOrderNo" HeaderText="Service Order No" ItemStyle-HorizontalAlign="Left" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsvwDebitNote" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY DNNo) AS Row , Quantity,ServiceOrderNo,[DNNo] As Code ,Total,ContractValue ,ReasonForClaim ,ESerialNo,Elegibility, Convert(varchar,POWFrom,103)  + ' To ' + Convert(varchar,POWTo,103) as POW ,MacName,convert(varchar, [DNDate] ,103) as DNDate, [CDName] From vwDebitNote  where MID =@MID  and DNDate >= @CDOne and DNDate <= @CDTwo Order by Code"
                                                    FilterExpression=" Code like '%{0}%' or CDName like '%{1}%' or MacName like '%{2}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="Code" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="CDName" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="MacName" ControlID="txtSearch" PropertyName="Text" />
                                                    </FilterParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlMID" Name="MID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                        <asp:ControlParameter Name="CDOne" DefaultValue="01/04/2014" ControlID="txtDateFrom"
                                                            PropertyName="Text" Type="DateTime" />
                                                        <asp:ControlParameter Name="CDTwo" DefaultValue="01/04/2015" ControlID="txtDateTo"
                                                            PropertyName="Text" Type="DateTime" />
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

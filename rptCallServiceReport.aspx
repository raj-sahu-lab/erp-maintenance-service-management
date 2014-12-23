<%@ page title="Call Type | Call Type Details" language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="rptCallServiceReport, App_Web_tjb0csgq" %>

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
        <legend><span class="spanCss">Call Type Details</span></legend>
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
                                    Date Format [MM/dd/yyyy]</div>
                                <div class="header-search" style="width: 780px;">
                                    <asp:TextBox ID="txtSearch" runat="server" Width="240px" autocomplete="off" />
                                    <asp:DropDownList ID="ddlMID" runat="server" AutoPostBack="True" DataSourceID="sDsMID"
                                        DataTextField="ManName" DataValueField="MID" Width="200px" AppendDataBoundItems="True"
                                        OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsMID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT [MID], [ManName] FROM [Manufacture] ORDER BY [ManName]">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="ddlEmpName" runat="server" AutoPostBack="True" DataSourceID="sDsEmpName"
                                        DataTextField="EmpName" DataValueField="CallAttainBy" Width="200px" OnSelectedIndexChanged="ddlEmpName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsEmpName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT Distinct [CallAttainBy], [EmpName] FROM [vwCallServiceReport] WHERE ([MID] = @MID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlMID" Name="MID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
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
                                Filter By&nbsp; [Invoice No , Serial No , Call Type]
                            </td>
                            <td class="TopRMsg">
                                <asp:Label ID="lblTotalRec" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlMID" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="ddlEmpName" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <asp:Panel ID="PnlHead" runat="server" Style="width: 99%; margin-top: 13px; margin-left: 5px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwCallServiceReport" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwCallServiceReport" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwCallServiceReport" EnableModelValidation="True"
                                                    PagerStyle-CssClass="pgr" ShowFooter="True" PageSize="3000" AllowPaging="True"
                                                    AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="CallLockDate" HeaderText="Call Date" ItemStyle-Width="70px"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="MacName" HeaderText="Equipment" ItemStyle-Width="100px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="Serial No.">
                                                            <ItemStyle Width="80px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEserialNo" Text='<%# HighlightText(Eval("EserialNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Hospital Name">
                                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCDName" Text='<%# HighlightText(Eval("CDName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Problem" HeaderText="Problem" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="SWO" HeaderText="S.W.O." ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="Enginner">
                                                            <ItemStyle Width="120px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEmpName" Text='<%# HighlightText(Eval("EmpName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Call Type">
                                                            <ItemStyle Width="120px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCallType" Text='<%# HighlightText(Eval("CallType").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="CallStatus" HeaderText="Status" ItemStyle-Width="80px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="CallCloseDate" HeaderText="Close Date" ItemStyle-Width="80px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsvwCallServiceReport" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY CSRID) AS Row , [CSRID] As Code , Convert(varchar,CallLockDate,103) as CallLockDate ,EmpName,MacName,Problem,[CDName] , [EserialNo] , [SWO] , [CallStatus],CASE  WHEN CallCloseDate=''  THEN '' ELSE Convert(varchar,[CallCloseDate],103) END as [CallCloseDate] , CallType  From vwCallServiceReport where MID = @MID and CallAttainBy = @CallAttainBy and CallLockDate >= @CDOne and CallLockDate <= @CDTwo  Order by Code"
                                                    FilterExpression="EserialNo like '%{0}%' or CDName like '%{1}%' or CallType like '%{2}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="EserialNo" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="CDName" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="CallType" ControlID="txtSearch" PropertyName="Text" />
                                                    </FilterParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlMID" Name="MID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                        <asp:ControlParameter ControlID="ddlEmpName" Name="CallAttainBy" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                        <asp:ControlParameter Name="CDOne" DefaultValue="01/04/2014" ControlID="txtDateFrom"
                                                            PropertyName="Text" Type="DateTime" />
                                                        <asp:ControlParameter Name="CDTwo" DefaultValue="01/04/2015" ControlID="txtDateTo"
                                                            PropertyName="Text" Type="DateTime" />
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

<%@ page title=" Task | Task Details " language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" inherits="rptTask, App_Web_tjb0csgq" enableeventvalidation="false" %>

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
        <legend><span class="spanCss">Task</span></legend>
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table style="border-bottom-style: dashed; border-bottom-width: 1px; border-top-style: dashed;
                        border-top-width: 1px;">
                        <tr>
                            <td class="TopLSerMsg">
                                <div class="header-search" style="width: 780px;">
                                    <asp:TextBox ID="txtSearch" runat="server" Width="250px" autocomplete="off" />
                                    <asp:DropDownList ID="ddlMID" runat="server" AutoPostBack="True" DataSourceID="sDsMID"
                                        DataTextField="ManName" DataValueField="MID" Width="200px" AppendDataBoundItems="True"
                                        OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsMID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT Distinct [MID], [ManName] FROM [vwTask] ORDER BY [ManName]">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="ddlEmpName" runat="server" AutoPostBack="True" DataSourceID="sDsEmpName"
                                        DataTextField="EmpName" DataValueField="EmpID" Width="200px" OnSelectedIndexChanged="ddlEmpName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sDsEmpName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                        SelectCommand="SELECT Distinct [EmpID], [EmpName] FROM [vwTask] WHERE ([MID] = @MID)">
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
                                Filter By&nbsp; [Hospital , Task Date, Serial No]
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
        <asp:Panel ID="PnlHead" runat="server" Style="width: 99.5%; margin-top: 13px; margin-left: 1px;
            margin-bottom: 15px">
            <table align="center">
                <tr>
                    <td>
                        <div align="center" style="padding: 4px;">
                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="udpvwTask" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdvwTask" runat="server" CssClass="mGrid" AutoGenerateColumns=" False"
                                                    DataKeyNames="Code" DataSourceID="sDsvwTask" EnableModelValidation="True" PagerStyle-CssClass="pgr"
                                                    ShowFooter="True" PageSize="50" AllowPaging="True" AllowSorting="true">
                                                    <Columns>
                                                        <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="ManName" HeaderText="Mfr" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="MacName" HeaderText="Eqpt" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="SN">
                                                            <ItemStyle Width="40px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEserialNo" Text='<%# HighlightText(Eval("EserialNo").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Hospital">
                                                            <ItemStyle Width="120px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCDName" Text='<%# HighlightText(Eval("CDName").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="TaskName" HeaderText="Task Name" ItemStyle-Width="60px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:TemplateField HeaderText="Task Date">
                                                            <ItemStyle Width="60px" HorizontalAlign="Left" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTaskDate" Text='<%# HighlightText(Eval("TaskDate").ToString()) %>'
                                                                    runat="server" CssClass="TextField" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="EstFinishDate" HeaderText="EsFDate" ItemStyle-Width="60px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="TaskStatus" HeaderText="Status" ItemStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Remark" HeaderText="Remark" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField DataField="Charge" HeaderText="Charge" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sDsvwTask" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                    SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY TaskID) AS Row , [TaskID] As Code , [ManName] , [MacName] , [TaskName] , [CDName] , [EmpName] ,convert(varchar, [TaskDate], 103) as TaskDate ,CASE  WHEN Convert(varchar,[EstFinishDate],103) = '01/01/1900'  THEN '' ELSE Convert(varchar,[EstFinishDate],103) END as [EstFinishDate] , [TaskStatus] , [Remark] , [Charge] , [EserialNo]  From vwTask where MID=@MID and EmpID = @EmpID Order by Code"
                                                    FilterExpression="CDName like '%{0}%' or TaskDate like '%{1}%' or EserialNo like '%{2}%' ">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="CDName" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="TaskDate" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="EserialNo" ControlID="txtSearch" PropertyName="Text" />
                                                    </FilterParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlMID" Name="MID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                        <asp:ControlParameter ControlID="ddlEmpName" Name="EmpID" PropertyName="SelectedValue"
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

<%@ page language="C#" masterpagefile="~/AdminPage.master" autoeventwireup="true" enableviewstatemac="false" inherits="MyAdmin, App_Web_tjb0csgq" title="Administration | Home | Admin Page | Super Administration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link type="text/css" rel="stylesheet" href="themes/custom-theme/jquery.ui.all.css" />
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <link href="CSS/sGrid.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $('#btnclick').click(function () {
                $("#popupdiv").dialog({
                    title: " AMC/CMC Planned Maintenance ",
                    width: 900,
                    modal: true,
                    buttons: {
                        Close: function () {
                            $(this).dialog('close');
                        }
                    }
                });
            });
        })
    </script>

    <script type="text/javascript">
            $(function () {
                $('#btnclick1').click(function () {
                    $("#popupdiv1").dialog({
                        title: "  Warranty Period is over ",
                        width: 900,
                        modal: true,
                        buttons: {
                            Close: function () {
                                $(this).dialog('close');
                            }
                        }
                    });
                });
            })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="popupdiv" title="AMC/CMC Planned Maintenance" style="display: none">
    <asp:GridView ID="grdCenter" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="sDsAmc" 
            PagerStyle-CssClass="pgr" PageSize="15">
            <Columns>
            <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" />
            <asp:BoundField DataField="CDName" HeaderText="Hospitals" ItemStyle-Width="250px"
                    ItemStyle-HorizontalAlign="Left" SortExpression="CDName" />

                <asp:BoundField DataField="ManName" HeaderText="Manufacture" ItemStyle-Width="200px" 
                    SortExpression="ManName" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="MacName" HeaderText="Equipment" ItemStyle-Width="220px"
                    ItemStyle-HorizontalAlign="Left"  />
                <asp:BoundField DataField="ESerialNo" HeaderText="Serial No" 
                    SortExpression="ESerialNo" ItemStyle-HorizontalAlign="Left" />

                    <asp:BoundField DataField="PAMC" HeaderText="Days" ItemStyle-HorizontalAlign="Left"  ItemStyle-Font-Bold="true"
                     />
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>


        
    <asp:SqlDataSource ID="sDsAmc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnStr %>" 
        SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY ManName) AS Row , PAMC, [ManName], [MacName], [CDName], [ESerialNo] FROM [vwAMCCMA] WHERE (([PAMC] &gt;= @PAMC) AND ([PAMC] &lt;= @PAMC2) AND ([Status] = @Status))">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="PAMC" Type="Int32" />
            <asp:Parameter DefaultValue="10" Name="PAMC2" Type="Int32" />
            <asp:Parameter DefaultValue="True" Name="Status" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

    </div>


    <div id="popupdiv1" title="AMC/CMC Planned Maintenance" style="display: none">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="sDsIns" 
            PagerStyle-CssClass="pgr" PageSize="15">
            <Columns>
            <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" />
            <asp:BoundField DataField="CDName" HeaderText="Hospitals" ItemStyle-Width="230px"
                    ItemStyle-HorizontalAlign="Left" SortExpression="CDName" />

                <asp:BoundField DataField="ManName" HeaderText="Manufacture" ItemStyle-Width="200px" 
                    SortExpression="ManName" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="MacName" HeaderText="Equipment" ItemStyle-Width="250px"
                    ItemStyle-HorizontalAlign="Left"  />
                
                <asp:BoundField DataField="SerialNo" HeaderText="Serial No" 
                    ItemStyle-HorizontalAlign="Left" />

                <asp:BoundField DataField="WEndDate" HeaderText="Days" 
                    ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" />
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>


        
    <asp:SqlDataSource ID="sDsIns" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnStr %>" 
        SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY ManName) AS Row , WEndDate,[ManName], [MacName], [CDName], [SerialNo] FROM [vwInstallation] WHERE [WEndDate] >= @PAMC AND [WEndDate] <= @PAMC2 AND [Status] = @Status">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="PAMC" Type="Int32" />
            <asp:Parameter DefaultValue="31" Name="PAMC2" Type="Int32" />
            <asp:Parameter DefaultValue="True" Name="Status" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

    </div>
            


    <div class="adminfo">
        <div class="left">
            <div class="Leftfav">
                User Information
            </div>
            <div class="mData">
                <asp:Image ID="imgLogUser" runat="server" CssClass="FavImage" ImageUrl="~/AdmImg/Admission_thumb_thumb.jpg"
                    Width="90px" AlternateText="Users" />
                <div class="clear">
                    &nbsp;
                </div>
                <div class="mData">
                    <asp:Label ID="lbl1" runat="server" Text="Label" Font-Bold="True" Font-Size="10pt"
                        ForeColor="#000099"></asp:Label>
                    <br />
                    <asp:Label ID="lbl2" runat="server" Text="Label" Font-Bold="True" Font-Size="10pt"
                        ForeColor="#CC3300"></asp:Label>
                    <br />
                    <br />
                    <asp:Image ID="imgAC" runat="server" ImageUrl="~/mImage/AlertsAC.png" Width="20px" />
                    <a href="#" id="btnclick">
                        <asp:Label ID="lbl3" runat="server" Text="Label" Font-Bold="True" Font-Size="9pt"
                            ForeColor="#660066"></asp:Label>
                    </a>

                    <br />
                    <br />

                    <asp:Image ID="Image15" runat="server" ImageUrl="~/mImage/AlertsAC.png" Width="20px" />
                    <a href="#" id="btnclick1">
                        <asp:Label ID="lbl4" runat="server" Text="Label" Font-Bold="True" Font-Size="9pt"
                            ForeColor="#660066"></asp:Label>
                    </a>
                </div>
            </div>
        </div>
        <div class="right">
            <div align="center">
                <div class="fav">
                    Quick Link
                </div>
                <div class="mData">
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="CentersDetails.aspx">
                            <asp:Image ID="Image3" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Company.Png"
                                Width="80" Height="80" AlternateText="Company" />
                            <br />
                            Company </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="UsersDetails.aspx">
                            <asp:Image ID="Image5" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Users.Jpg"
                                Width="80" Height="80" AlternateText="Users" />
                            <br />
                            Users </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="ClientDetails.aspx">
                            <asp:Image ID="Image11" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Hospitals.Jpg"
                                Width="80" Height="80" AlternateText="Hospital" />
                            <br />
                            Hospital </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="EmployDetails.aspx">
                            <asp:Image ID="Image10" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Employee.png"
                                Width="80" Height="80" AlternateText="Employee" />
                            <br />
                            Employee </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="ManufactureDetails.aspx">
                            <asp:Image ID="Image6" runat="server" CssClass="FavImage" ImageUrl="~/mImage/industry.png"
                                Width="80" Height="80" AlternateText="Manufacture" />
                            <br />
                            Manufacture </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="MachineriesDetails.aspx">
                            <asp:Image ID="Image7" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Equipment.jpg"
                                Width="80" Height="80" AlternateText="Equipment" />
                            <br />
                            Equipment </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="QuotationDetails.aspx">
                            <asp:Image ID="Image9" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Quotation.Jpg"
                                Width="80" Height="80" AlternateText="Quotation" />
                            <br />
                            Quotation </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="PurchaseOrderDetails.aspx">
                            <asp:Image ID="Image4" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Purchase.Jpg"
                                Width="80" AlternateText="Purchase Order" />
                            <br />
                            Purchase Order </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="InstallationDetails.aspx">
                            <asp:Image ID="Image12" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Installation.Jpg"
                                Width="80" AlternateText="Installation" />
                            <br />
                            Installation</a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="AMCCMADetails.aspx">
                            <asp:Image ID="Image2" runat="server" CssClass="FavImage" ImageUrl="~/mImage/AMC.Jpg"
                                Width="80" AlternateText="AMC/CMA's" />
                            <br />
                            AMC/CMA's</a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="CallServiceReportDetails.aspx">
                            <asp:Image ID="Image1" runat="server" CssClass="FavImage" ImageUrl="~/mImage/CallServices.Jpg"
                                Width="80" AlternateText="Call Types" />
                            <br />
                            Call Types</a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="TaskDetails.aspx">
                            <asp:Image ID="Image14" runat="server" CssClass="FavImage" ImageUrl="~/mImage/TAsk.Jpg"
                                Width="80" AlternateText="Task" />
                            <br />
                            Task</a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="InvoicesDetails.aspx">
                            <asp:Image ID="Image13" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Invoice.jpg"
                                Width="80" Height="80" AlternateText="Invoice" />
                            <br />
                            Invoice </a>
                    </div>
                    <div style="float: left; text-align: center; padding: 3px;">
                        <a href="DebitNoteDetails.aspx">
                            <asp:Image ID="Image8" runat="server" CssClass="FavImage" ImageUrl="~/mImage/DebitNote.jpg"
                                Width="80" Height="80" AlternateText="Debit Note" />
                            <br />
                            Debit Note </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
            &nbsp;</div>
    </div>
</asp:Content>

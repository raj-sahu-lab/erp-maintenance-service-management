<%@ page language="C#" masterpagefile="~/SE/AdminPage.master" autoeventwireup="true" enableviewstatemac="false" inherits="MyAdmin, App_Web_qupml30j" title="Service Engineer | Home | Service Engineer Page " %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="adminfo">
        <div class="left">
            <div class="Leftfav">
                User Information
            </div>
            <div class="mData">
                <asp:Image ID="imgLogUser" runat="server" CssClass="FavImage" ImageUrl="~/AdmImg/Users.gif"
                    Width="80px" AlternateText="Users" />
            </div>
        </div>
        <div class="right">
            <div align="center">
                <div class="fav">
                    Quick Link
                </div>
                <div class="mData">
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
                        <a href="InstallationDetails.aspx">
                            <asp:Image ID="Image12" runat="server" CssClass="FavImage" ImageUrl="~/mImage/Installation.Jpg"
                                Width="80" AlternateText="Installation" />
                            <br />
                            Installation</a>
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
                </div>
            </div>
        </div>
        <div class="clear">
            &nbsp;</div>
    </div>
</asp:Content>

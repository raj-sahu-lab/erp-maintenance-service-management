<%@ page language="C#" autoeventwireup="true" inherits="AMCCMA, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>AMC/CMA</title>
    <link href="CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <link href="CSS/sGrid.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="themes/custom-theme/jquery.ui.all.css" />
    <script src="js/Bass.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        UserDate('txtACFrom');
        UserDate('txtACTo');
    </script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            UserDate('txtACFrom');
            UserDate('txtACTo');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script language="javascript" type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;
        function InitializeRequest(sender, args) {

            if (prm.get_isInAsyncPostBack())
                args.set_cancel(true);
            postBackElement = args.get_postBackElement();
            if (postBackElement.id == 'Button1')
                $get('UpdateProgress1').style.display = 'block';
        }



        function EndRequest(sender, args) {
            if (postBackElement.id == 'Button1')
                $get('UpdateProgress1').style.display = 'none';
        }  

    </script>
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <div class="background">
            </div>
            <div class="modal">
                Progress ...
                <img src="mImage/ajax-loader.gif" alt="Progress......" /></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page">
                <div class="header">
                    <table>
                        <tr>
                            <td width="80%">
                            </td>
                            <td width="5%" valign="top">
                                <a href="AMCCMADetails.aspx">
                                    <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                        ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="main">
                    <fieldset id="fldStream" style="border: 1px solid #006600; width: 60%; margin-left: 200px;
                        margin-top: 30px;">
                        <legend><span class="spanCss">AMC/CMA</span></legend>
                        <div>
                            <table style="border-bottom-style: dashed; border-bottom-width: 1px;">
                                <tr>
                                    <td class="TopLMsg">
                                        *-Indicates a required fields.
                                        <br />
                                        Complete the form Make sure to enter all required fields.
                                    </td>
                                    <td class="TopRMsg">
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="Button_submit" OnClick="btnSubmit_Click"
                                            Text="Submit" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:Panel ID="PnlHead" runat="server" Style="width: 95%; margin-left: 9px;">
                            <table align="center">
                                <tr>
                                    <td>
                                        <div align="center" style="padding: 5px;">
                                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;
                                                width: 95%; padding: 5px 5px 5px 10px">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblOrgID" runat="server" Text="Company *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlOrgID" runat="server" Width="325px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlOrgID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCDID" runat="server" Text="Hospitals *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCDID" runat="server" Width="325px" AutoPostBack="True" 
                                                            onselectedindexchanged="ddlCDID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlCDID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMID" runat="server" Text="Manufacturer *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMID" runat="server" Width="325px" AutoPostBack="True" OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlMID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMacID" runat="server" Text="Equipment Model *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMacID" runat="server" Width="325px" 
                                                            AutoPostBack="True" onselectedindexchanged="ddlMacID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlMacID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblESerialNo" runat="server" Text="Equipment Serial No. *" 
                                                            Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlESerialNo" runat="server" Width="325px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlESerialNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblEAge" runat="server" Text="Equipment Age" Width="140px"></asp:Label>
                                                        <asp:TextBox ID="txtEAge" runat="server" CssClass="Right" Width="110px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                        <asp:Label ID="lblACValue" runat="server" Text="Value" Width="80px"></asp:Label>
                                                        <asp:TextBox ID="txtACValue" runat="server" CssClass="Right" Width="110px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblACFrom0" runat="server" Text="Type *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlPlantMaintaince" runat="server" Width="120px">
                                                            <asp:ListItem>AMC</asp:ListItem>
                                                            <asp:ListItem>CMA</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblACFrom" runat="server" Text="AMC/CMA From *" Width="140px"></asp:Label>
                                                        <asp:TextBox ID="txtACFrom" runat="server" Width="90px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                            ControlToValidate="txtACFrom" ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblACTo" runat="server" Text="To *" Width="85px"></asp:Label>
                                                        <asp:TextBox ID="txtACTo" runat="server" Width="90px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                            ControlToValidate="txtACTo" ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <%--<asp:CompareValidator ID="CompareValidator5" runat="server" ControlToCompare="txtACFrom"
                                                            ControlToValidate="txtACTo" ErrorMessage="AMC/CMA TO Date is Greater Than From Date "
                                                            Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </fieldset>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ddlMID" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>

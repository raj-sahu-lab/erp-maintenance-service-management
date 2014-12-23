<%@ page language="C#" autoeventwireup="true" inherits="CallServiceReport, App_Web_uejhl4vd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Call Type's</title>
    <link href="../CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="../themes/custom-theme/jquery.ui.all.css" />
    <script src="Bass.js" type="text/javascript" charset="utf-8"></script>

    <script type="text/javascript">
        UserDate('txtDate');
        UserDate('txtCallLockDate');
        UserDate('txtCallCloseDate');
        UserDate('txtPartReturnDate');

    </script>

    <script type="text/javascript">
        function pageLoad(sender, args) {
            UserDate('txtDate');
            UserDate('txtCallLockDate');
            UserDate('txtCallCloseDate');
            UserDate('txtPartReturnDate');
        }
    </script>

    <script type="text/javascript">
        function ShowHide() {
            var selectedanswer = document.getElementById("ddlCallType").selectedIndex;
            if (selectedanswer == 1) {
                document.getElementById("one").style.display = "block";
                document.getElementById("two").style.display = "block";
                document.getElementById("three").style.display = "block";

            }
            else {
                document.getElementById("one").style.display = "none";
                document.getElementById("two").style.display = "none";
                document.getElementById("three").style.display = "none";
            }
        }
    </script>

    <script type="text/javascript">
            function ShowHideCS() {
                var selectedanswer = document.getElementById("ddlCallStatus").selectedIndex;
                if (selectedanswer == 2) {
                    document.getElementById("four").style.display = "block";

                }
                else {
                    document.getElementById("four").style.display = "none";
                }
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
                <img src="../mImage/ajax-loader.gif" alt="Progress......" /></div>
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
                                <a href="CallServiceReportDetails.aspx">
                                    <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                        ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="main">
                    <fieldset id="fldStream" style="border: 1px solid #006600; width: 55%; margin-left: 230px;
                        margin-top: 30px;">
                        <legend><span class="spanCss">Call Type's</span></legend>
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
                        <asp:Panel ID="PnlHead" runat="server" Style="width: 98%; margin-left: 9px;">
                            <table align="center">
                                <tr>
                                    <td>
                                        <div align="center" style="padding: 5px;">
                                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;
                                                width: 98%; padding: 5px 5px 5px 10px">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCallLockDate" runat="server" Text="Call Log Date" 
                                                            Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtCallLockDate" runat="server" Width="90px"></asp:TextBox>
                                                        <asp:Label ID="lblCallLockTime" runat="server" Text="Call Log Time" Width="95px"></asp:Label>
                                                        <asp:TextBox ID="txtCallLockTime" runat="server" Width="95px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCDID" runat="server" Text="Client *" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCDID" runat="server" Width="322px" AutoPostBack="True" 
                                                            onselectedindexchanged="ddlCDID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlCDID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMID" runat="server" Text="Manufacturer *" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMID" runat="server" Width="322px" AutoPostBack="True" OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlMID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMacID" runat="server" Text="Equipment *" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMacID" runat="server" Width="322px" 
                                                            AutoPostBack="True" onselectedindexchanged="ddlMacID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlMacID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblEserialNo" runat="server" Text="Equip. Serial No. *" 
                                                            Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlESerialNo" runat="server" AutoPostBack="True" 
                                                            onselectedindexchanged="ddlESerialNo_SelectedIndexChanged" Width="200px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                            ControlToValidate="ddlESerialNo" ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblEType" runat="server" Font-Bold="True" Text="-" Width="130px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblProblem" runat="server" Text="Problem *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtProblem" runat="server" Width="316px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtProblem"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSWO" runat="server" Text="S.W.O. *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtSWO" runat="server" Width="316px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSWO"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCallType" runat="server" Text="CallType" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCallType" runat="server" Width="322px" onchange="ShowHide(this.value)">
                                                            <asp:ListItem>Installation Call </asp:ListItem>
                                                            <asp:ListItem>Corrective Maintaince Call</asp:ListItem>
                                                            <asp:ListItem>Plant Maintaince Call</asp:ListItem>
                                                            <asp:ListItem>Paid Call</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="one">
                                                        <asp:Label ID="lblPartRequired" runat="server" Text="Part Required" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtPartRequired" runat="server" Width="316px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="two">
                                                        <asp:Label ID="lblPartReturnDate" runat="server" Text="Part Return Date" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtPartReturnDate" runat="server" Width="90px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="three">
                                                        <asp:Label ID="lblDocketNo" runat="server" Text="Docket No." Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtDocketNo" runat="server" Width="105px"></asp:TextBox>
                                                        <asp:Label ID="lblChallanNo" runat="server" Text="Challan No." Width="69px"></asp:Label>
                                                        <asp:TextBox ID="txtChallanNo" runat="server" Width="105px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td >
                                                        <asp:Label ID="lblCallStatus" runat="server" Text="Call Status" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCallStatus" runat="server" Width="115px" onchange="ShowHideCS(this.value)">
                                                            <asp:ListItem>Open</asp:ListItem>
                                                            <asp:ListItem>Pending</asp:ListItem>
                                                            <asp:ListItem>Close</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="four">
                                                        <asp:Label ID="lblCallCloseDate" runat="server" Text="Call Close Date" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtCallCloseDate" runat="server" Width="90px"></asp:TextBox>
                                                        <asp:Label ID="lblCallCloseTime" runat="server" Text="Call Close Time" Width="114px"></asp:Label>
                                                        <asp:TextBox ID="txtCallCloseTime" runat="server" Width="80px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCallAttainBy" runat="server" Text="Call Attain By *" 
                                                            Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCallAttainBy" runat="server" Width="322px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlCallAttainBy"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ddlMID" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>

<%@ page language="C#" autoeventwireup="true" inherits="Task, App_Web_uejhl4vd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Task</title>
    <link href="../CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="../themes/custom-theme/jquery.ui.all.css" />
    <link href="../css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
    <script src="Bass.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        UserDate('txtTaskDate');
        UserDate('txtEstFinishDate');
    </script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            UserDate('txtTaskDate');
            UserDate('txtEstFinishDate');
        }
    </script>
    <script type="text/javascript">
        function ShowHide() {
            var selectedanswer = document.getElementById("ddlTaskStatus").selectedIndex;

            if (selectedanswer == 2) {
                document.getElementById("one").style.display = "block";


            }
            else {
                document.getElementById("one").style.display = "none";

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
                                <a href="TaskDetails.aspx">
                                    <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                        ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="main">
                    <fieldset id="fldStream" style="border: 1px solid #006600; width: 58%; margin-left: 200px;
                        margin-top: 30px;">
                        <legend><span class="spanCss">Task</span></legend>
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
                                                        <asp:Label ID="lblEmpID" runat="server" Text="Employee *" Width="110px"></asp:Label>
                                                        <asp:DropDownList ID="ddlEmpID" runat="server" Width="345px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlEmpID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCDID" runat="server" Text="Hospital *" Width="110px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCDID" runat="server" Width="345px" AutoPostBack="True" 
                                                            onselectedindexchanged="ddlCDID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCDID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMID" runat="server" Text="Manufacturer *" Width="110px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMID" runat="server" Width="345px" AutoPostBack="True" OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlMID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMacID" runat="server" Text="Equipment *" Width="110px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMacID" runat="server" Width="345px" 
                                                            AutoPostBack="True" onselectedindexchanged="ddlMacID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlMacID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblEserialNo" runat="server" Text="Serial No. *" Width="110px"></asp:Label>
                                                        <asp:DropDownList ID="ddlESerialNo" runat="server" AutoPostBack="True" 
                                                            onselectedindexchanged="ddlESerialNo_SelectedIndexChanged" Width="200px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                            ControlToValidate="ddlESerialNo" ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblEType" runat="server" Font-Bold="True" Text="-"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTaskName" runat="server" Text="Task Name *" Width="110px"></asp:Label>
                                                        <asp:TextBox ID="txtTaskName" runat="server" Width="340px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTaskName"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTaskDate" runat="server" Text="Task Date" Width="110px"></asp:Label>
                                                        <asp:TextBox ID="txtTaskDate" runat="server" Width="95px"></asp:TextBox>
                                                        <asp:Label ID="lblTaskTime" runat="server" Text="Task Time" Width="110px"></asp:Label>
                                                        <asp:TextBox ID="txtTaskTime" runat="server" Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTaskStatus" runat="server" Text="Task Status" Width="110px"></asp:Label>
                                                        <asp:DropDownList ID="ddlTaskStatus" runat="server" Width="115px" onchange="ShowHide(this.value)">
                                                            <asp:ListItem>Open</asp:ListItem>
                                                            <asp:ListItem>Pending</asp:ListItem>
                                                            <asp:ListItem>Close</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lblCharge" runat="server" Text="Charge " Width="110px"></asp:Label>
                                                        <asp:TextBox ID="txtCharge" runat="server" Width="100px" CssClass="Right" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="one">
                                                        <asp:Label ID="lblEstFinishDate" runat="server" Text="Finish Date" Width="110px"></asp:Label>
                                                        <asp:TextBox ID="txtEstFinishDate" runat="server" Width="95px"></asp:TextBox>
                                                        <asp:Label ID="lblEstFinishTime" runat="server" Text="Finish Time" Width="110px"></asp:Label>
                                                        <asp:TextBox ID="txtEstFinishTime" runat="server" Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblRemark" runat="server" Text="Remark" Width="110px"></asp:Label>
                                                        <asp:TextBox ID="txtRemark" runat="server" Width="340px"></asp:TextBox>
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

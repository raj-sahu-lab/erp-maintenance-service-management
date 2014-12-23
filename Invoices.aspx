<%@ page language="C#" autoeventwireup="true" inherits="Invoices, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Invoices</title>
    <link href="CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <link href="CSS/sGrid.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="themes/custom-theme/jquery.ui.all.css" />
    <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/Bass.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        UserDate('txtInvoiceDate');
        UserDate('txtSendDate');
        UserDate('txtReceiveDate');
    </script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            UserDate('txtInvoiceDate');
            UserDate('txtSendDate');
            UserDate('txtReceiveDate');
        }
    </script>
    <script type="text/javascript">
        function mSum() {
            var Claim = document.getElementById('<%= txtAmountOfClaim.ClientID %>');
            var sTax = document.getElementById('<%= txtServiceTax.ClientID %>');

            if (Claim.value.length == 0) {
                Claim.value = 0;
            }

            if (sTax.value.length == 0) {
                sTax.value = 0;
            }

            var x = parseFloat(Claim.value);
            var y = parseFloat(sTax.value);

            document.getElementById('<%= txtTatolServiceTax.ClientID %>').value = ((x / 100) * y).toFixed(2);
            document.getElementById('<%= txtTatolAmount.ClientID %>').value = ((x / 100) * y + x).toFixed(2);
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
                                <a href="InvoicesDetails.aspx">
                                    <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                        ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="main">
                    <fieldset id="fldStream" style="border: 1px solid #006600; width: 70%; margin-left: 140px;
                        margin-top: 30px;">
                        <legend><span class="spanCss">Invoices</span></legend>
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
                                                width: 98%; padding: 5px">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text="Invoice No *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtInvoiceNo" runat="server" CssClass="validate[required]" Width="220px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvInvoiceNo" runat="server" ControlToValidate="txtInvoiceNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblInvoiceDate" runat="server" Text="Date" Width="60px"></asp:Label>
                                                        <asp:TextBox ID="txtInvoiceDate" runat="server" CssClass="validate[required]" Width="85px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblOrgID" runat="server" Text="Company *" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlOrgID" runat="server" Width="485px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlOrgID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvddlOrgID" runat="server" ControlToValidate="ddlOrgID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMID" runat="server" Text="Manufacturer *" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMID" runat="server" Width="485px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvddlOrgID0" runat="server" ControlToValidate="ddlMID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align: top;">
                                                        <asp:Label ID="lblDescription0" runat="server" Text="Description *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="480px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblReference" runat="server" Text="Reference No." Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtReference" runat="server" Width="480px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblDNID" runat="server" Text="Debit No. *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtDebitNo" runat="server" Width="480px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDebitNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblAmountOfClaim" runat="server" Text="Amount Of Claim *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtAmountOfClaim" runat="server" CssClass="Right" Width="160px"
                                                            onkeypress="return isNumberKey(event)" onBlur="mSum()"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtxtAmountOfClaim" runat="server" ControlToValidate="txtAmountOfClaim"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblServiceTax" runat="server" Text="Service Tax" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtServiceTax" runat="server" CssClass="Right" Width="160px" onkeypress="return isNumberKey(event)"
                                                            onBlur="mSum()">12.36</asp:TextBox>                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTatolServiceTax" runat="server" Text="Total Service Tax *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtTatolServiceTax" runat="server" CssClass="Right" Width="160px"
                                                            onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtxtAmountOfClaim0" runat="server" ControlToValidate="txtTatolServiceTax"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblTatolAmount" runat="server" Text="Total Amount *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtTatolAmount" runat="server" CssClass="Right" Width="160px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtxtAmountOfClaim1" runat="server" ControlToValidate="txtTatolAmount"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblPaymentStatus" runat="server" Text="Payment Status" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlPaymentStatus" runat="server" Width="170px">
                                                            <asp:ListItem>None</asp:ListItem>
                                                            <asp:ListItem>Claim</asp:ListItem>
                                                            <asp:ListItem>Receive</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSendDate" runat="server" Text="Send Date" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtSendDate" runat="server" CssClass="validate[required]" Width="100px"></asp:TextBox>
                                                        <asp:Label ID="lblReceiveDate" runat="server" Text="Receive Date" Width="100px"></asp:Label>
                                                        <asp:TextBox ID="txtReceiveDate" runat="server" CssClass="validate[required]" Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCourierServicesName" runat="server" Text="Courier Services Name"
                                                            Width="131px"></asp:Label>
                                                        <asp:TextBox ID="txtCourierServicesName" runat="server" Width="220px"></asp:TextBox>
                                                        <asp:Label ID="lblDocketNo" runat="server" Text="Docket No." Width="80px"></asp:Label>
                                                        <asp:TextBox ID="txtDocketNo" runat="server" Width="110px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToCompare="txtSendDate"
                                                            ControlToValidate="txtReceiveDate" ErrorMessage="Send Date is Greater Receive Date"
                                                            Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
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
            <asp:AsyncPostBackTrigger ControlID="ddlOrgID" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>

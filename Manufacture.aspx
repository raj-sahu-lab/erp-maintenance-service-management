<%@ page language="C#" autoeventwireup="true" inherits="Manufacture, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manufacturer</title>
    <link href="CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="themes/custom-theme/jquery.ui.all.css" />
    <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/Bass.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery("#form1").validationEngine();
        });
    </script>
    <script type="text/javascript" language="javascript">
        function pageLoad(sender, args) {
            jQuery(document).ready(function () {
                jQuery("#form1").validationEngine();
            });
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="page">
        <div class="header">
            <table>
                <tr>
                    <td width="80%">
                    </td>
                    <td width="5%" valign="top">
                        <a href="ManufactureDetails.aspx">
                            <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="main">
            <fieldset id="fldStream" style="border: 1px solid #006600; width: 50%; margin-left: 235px;
                margin-top: 30px;">
                <legend><span class="spanCss">Manufacturer</span></legend>
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
                <asp:Panel ID="PnlHead" runat="server" Style="width: 98%;">
                    <table align="center">
                        <tr>
                            <td>
                                <div align="center" style="padding: 5px;">
                                    <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;
                                        width: 98%; padding: 5px 5px 5px 10px">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblManName" runat="server" Style="margin-top: 0px" Text="Manufacturer *"
                                                    Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtManName" runat="server" CssClass="validate[required]" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblConPName" runat="server" Text="Contact Person" Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtConPName" runat="server" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblAddress" runat="server" Text="Address *" Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="validate[required]" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCity" runat="server" Text="City *" Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtCity" runat="server" CssClass="validate[required]" Width="110px"></asp:TextBox>
                                                <asp:Label ID="lblState" runat="server" Text="State *" Width="62px"></asp:Label>
                                                <asp:TextBox ID="txtState" runat="server" CssClass="validate[required]" Width="110px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblEmail" runat="server" Style="margin-bottom: 0px" Text="Email "
                                                    Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="validate[custom[email]]" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPinCode" runat="server" Text="PinCode " Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtPinCode" runat="server" Width="110px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                <asp:Label ID="lblMobile" runat="server" Text="Contact" Width="62px"></asp:Label>
                                                <asp:TextBox ID="txtMobile" runat="server" Width="110px" onkeypress="return isNumberKey(event)"></asp:TextBox>
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
    </form>
</body>
</html>

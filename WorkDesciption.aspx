<%@ page language="C#" autoeventwireup="true" inherits="WorkDesciption, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Work Desciption</title>
    <link href="CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="themes/custom-theme/jquery.ui.all.css" />
    <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
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
                        <a href="DesginationDetails.aspx">
                            <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="main">
            <fieldset id="fldStream" style="border: 1px solid #006600; width: 70%; margin-left: 170px;
                margin-top: 30px;">
                <legend><span class="spanCss">Work Desciption</span></legend>
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
                <asp:Panel ID="PnlHead" runat="server" Style="width: 75%; margin-left: 50px;">
                    <table align="center">
                        <tr>
                            <td>
                                <div align="center" style="padding: 5px;">
                                    <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;
                                        width: 95%; padding: 5px">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblWDes" runat="server" Text="Work Description *" Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtWDes" runat="server" CssClass="validate[required]" 
                                                    Width="300px"></asp:TextBox>
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

<%@ page language="C#" autoeventwireup="true" inherits="Users, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users Role | Tender and Order Management System</title>
    <link href="CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <link href="CSS/sGrid.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.6.min.js" type="text/javascript"></script>
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
    <link href="Mask/Maskstyle.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="Mask/Maskdiv.js"></script>
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
                        <a href="UsersDetails.aspx">
                            <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="main">
            <fieldset id="fldStream" style="border: 1px solid #006600; width: 65.5%; margin-left: 150px;
                margin-top: 30px;">
                <legend><span class="spanCss">User's Details</span></legend>
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
                        <tr>
                            <td align="center" colspan="2">
                                <div id="MyMsg" runat="server" class="error" visible="false">
                                    <asp:Label ID="lblResult" runat="server" Font-Bold="True" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:Panel ID="PnlHead" runat="server" Style="width: 98%; margin: 9px;">
                    <table align="center">
                        <tr>
                            <td>
                                <div align="center" style="padding: 5px;">
                                    <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;
                                        width: 580px; padding: 5px;">
                                        <tr>
                                            <td id="tdMyPhoto" runat="server" visible="false">
                                                <asp:Label ID="lblCaption5" runat="server" Text="Select Photo *" Width="120px"></asp:Label>
                                                <a href="javascript:void(0);" onclick="javascript:OpenModelPopup();">Choose Photo</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCaption" runat="server" Text="Employee *" Width="120px"></asp:Label>
                                                <asp:DropDownList ID="ddlOrgID" CssClass="validate[required]" runat="server" 
                                                    Width="385px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCaption0" runat="server" Text="Display Name *" Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtUserName" runat="server" CssClass="validate[required]" 
                                                    MaxLength="25" Width="380px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCaption1" runat="server" Text="User Type" Width="120px"></asp:Label>
                                                <asp:DropDownList ID="ddlUserType" CssClass="validate[required]" runat="server" 
                                                    Width="385px">
                                                    <asp:ListItem Value="SA">Super Administrator</asp:ListItem>
                                                    <asp:ListItem Value="A">Administrator</asp:ListItem>
                                                    <asp:ListItem Value="E">Entry User</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCaption2" runat="server" Text="User ID *" Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtUserID" runat="server" CssClass="validate[required]" 
                                                    Width="380px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCaption3" runat="server" Text="Password *" Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="validate[required]" 
                                                    Width="380px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCaption4" runat="server" Text="E-mail *" Width="120px"></asp:Label>
                                                <asp:TextBox ID="txtEMail" runat="server" 
                                                    CssClass="validate[required,custom[email]" Width="380px"></asp:TextBox>
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
        <div id="MaskedDiv" class="MaskedDiv">
        </div>
        <div id="ModalPopupDiv" class="ModalPopup">
            <table width="100%" cellpadding="2" cellspacing="0" border="0">
                <tr>
                    <td class="tdRowOne">
                        Add Photo
                    </td>
                    <td class="tdRowTwo">
                        <a href="javascript:void(0);" onclick="javascript:CloseModelPopup();" style="color: White;">
                            Close</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Select File :"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="filUpload" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="tdRowTwo">
                        <asp:Button ID="cmdLoadImg" runat="server" Text="Submit" OnClick="cmdLoadImg_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>

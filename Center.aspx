<%@ page language="C#" autoeventwireup="true" inherits="Center, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company | Organization Information | Organization </title>
    <link href="CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
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

    <script type="text/javascript">
        $(function () {
            $('#<%=fuLogo.ClientID %>').change(function () {

                var fileExtension = ['jpeg', 'jpg'];
                if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                    alert("Only '.jpeg','.jpg' Formats are allowed.");
                }
            })
        })
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
                        <a href="CentersDetails.aspx">
                            <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="main">
            <fieldset id="fldStream" style="border: 1px solid #006600; width: 70.5%; margin-left: 130px;
                margin-top: 30px;">
                <legend><span class="spanCss">Organization Information</span></legend>
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
                <asp:Panel ID="PnlHead" runat="server" Style="width: 98%; margin: 9px;">
                    <div align="center" style="padding: 5px;">
                        <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;
                            width: 680px; padding: 5px;">
                            <tr>
                                <td>
                                    <span class="spanSubCss">Organization Information</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPrifix" runat="server" Text="Prifix" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtPrifix" runat="server" Width="40px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Text="Organization *" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="validate[required]" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblHeadName" runat="server" Text="Contact Person " Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtHeadName" runat="server" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblBMEmail" runat="server" Text="Contact Person E-mail " Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtBMEmail" runat="server" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblAddress" runat="server" Text="Address *" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="validate[required]" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCity" runat="server" Text="City *" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtCity" runat="server" CssClass="validate[required]" Width="140px"></asp:TextBox>
                                    <asp:Label ID="lblState" runat="server" Text="State *" Width="100px"></asp:Label>
                                    <asp:TextBox ID="txtState" runat="server" CssClass="validate[required]" Width="140px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone *" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="validate[required]" Width="140px"></asp:TextBox>
                                    <asp:Label ID="lblPinCode" runat="server" Text="PinCode *" Width="100px"></asp:Label>
                                    <asp:TextBox ID="txtPinCode" runat="server" CssClass="validate[required]" Width="140px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCell" runat="server" Text="Mobile " Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtCell" runat="server" Width="140px"></asp:TextBox>
                                    <asp:Label ID="lblFax" runat="server" Text="Fax" Width="100px"></asp:Label>
                                    <asp:TextBox ID="txtFax" runat="server" Width="140px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server" Text="E-mail" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblWebSite" runat="server" Text="WebSite" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtWebSite" runat="server" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPanNumber" runat="server" Text="Pan Number" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtPanNumber" runat="server" Width="140px"></asp:TextBox>
                                    <asp:Label ID="lblServiceTaxNumber" runat="server" Text="Service Tax No." Width="100px"></asp:Label>
                                    <asp:TextBox ID="txtServiceTaxNumber" runat="server" Width="140px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblTinNumber" runat="server" Text="Tin Number" Width="150px"></asp:Label>
                                    <asp:TextBox ID="txtTinNumber" runat="server" Width="140px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLogo" runat="server" Text="Logo" Width="100px"></asp:Label>
                                    <asp:FileUpload ID="fuLogo" runat="server" Width="200px" />
                                    <asp:Image ID="imgCompany" runat="server" Width="74px" />
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

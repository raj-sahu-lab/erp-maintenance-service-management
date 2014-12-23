<%@ page language="C#" autoeventwireup="true" inherits="Default, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login Page | Home Page | Login | User Login </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="Software Company expertise in web Portal,We Are Provide,School Web Site,Best Education Systems,Student Management Systems,Staff Management Systems " />
    <meta name="keywords" content="School Web Site,Best Education Systems,Student Management Systems,Staff Management Systems,Education,School,System,Most Popular Education Management Systems,Management Systems,Academic Skill Builder Systems,Attendance Alter at SMS,GPS Traking,Education Poral in Raipur, Raipur,C.G., Educatuion Hub,School Web Site ,Web Site for Education,web Site,Raipur,C.G.,10z,10z.in," />
    <meta name="google-site-verification" content="YOUR_GOOGLE_SITE_VERIFICATION_TOKEN" />
    <link href="CSS/CssDefault.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
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
    <a href="#" class="scrollup">Scroll</a>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="page">
        <div class="clear">
            &nbsp;</div>
        <!-- Strar of Main Title Section -->
        <div class="TopTitle">
            <div class="eName">
                Medical Engineering Services
                <br />
            </div>
        </div>
        <!-- End of Main Title Section -->
        <div class="clear">
            &nbsp;</div>
        <!-- Start of Mid Section Area -->
        <div class="secMid">
            <div class="Login">
                <div style="padding: 55px 55px 55px 220px;">
                    <div class="LogOut">
                        <div class="LogBlue">
                            <div style="float: left; padding: 5px; margin-top: 200px;">
                                <asp:Button ID="cmdSignin" runat="server" CssClass="button_Login" OnClick="cmdSignin_Click"
                                    Text="Log in" />
                            </div>
                        </div>
                        <div class="LogTitile">
                            LOGIN</div>
                        <div class="clear">
                            &nbsp;</div>
                        <div class="LogCtl">
                            <div style="float: left; width: 400px; margin: 10px 0px 10px 0px;">
                                <span>Session:</span>
                            </div>
                            <asp:DropDownList ID="ddlSession" runat="server" Width="395px" Height="28px" 
                                Enabled="False">
                            </asp:DropDownList>
                            <div style="float: left; width: 400px; margin: 10px 0px 10px 0px;">
                                <span>Username:</span> <span>Password:</span>
                            </div>
                            <asp:TextBox ID="txtUser_Name" runat="server" Width="155px" Height="24px" autocomplete="off"
                                CssClass="validate[required]"></asp:TextBox>
                            <div style="float: left; margin-left: 28px;">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="24px" Width="155px"
                                    CssClass="validate[required]"></asp:TextBox>
                            </div>
                            <div style="float: left; margin: 15px 0px 10px 0px; width: 400px; color: #FFFFFF;
                                font-size: 10pt;">
                                Forgot Username or Password ?
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Mid Section Area -->
        <div class="mFooter">
            <div class="copyright">
                Medical Engineering Services 2014@ Privacy policy. All rights reserved.</div>
        </div>
    </div>
    </form>
</body>
</html>

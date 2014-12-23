<%@ page title="Admin Change Password" language="C#" masterpagefile="~/AdminPage.master" enableviewstatemac="false" autoeventwireup="true" inherits="[Admin Name], App_Web_tjb0csgq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div align="left">
                <asp:Button AccessKey="N" ID="cmdNew" runat="server" CausesValidation="False" Text="New"
                    UseSubmitBehavior="False" OnClick="cmdNew_Click" CssClass="Button_submit"></asp:Button>
                <asp:Button AccessKey="S" ID="cmdSave" OnClick="cmdSave_Click" runat="server" Text="Change Password"
                    CssClass="Button_submit" Width="125px"></asp:Button>
            </div>
            <br>
            <fieldset id="fldStream" style="width: 44%">
                <asp:Panel ID="PnlHead" runat="server" DefaultButton="cmdSave" Width="100%">
                    <table cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="LeftSite" colspan="3">
                                <div class="SubTitle">
                                    &nbsp;<asp:Image ID="imgContact" runat="server" ImageUrl="~/mImage/arrowbullet.png" />
                                    &nbsp;Change Password
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter Your Current Password
                            </td>
                            <td>
                                <asp:TextBox ID="txtOldPassword" runat="server" CssClass="MandatoryInput" Width="220px"
                                    TextMode="Password"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOldPassword"
                                    ErrorMessage="Current Password Is Required Field !" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Choose a New Password
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="MandatoryInput" Width="220px"
                                    TextMode="Password"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPassword"
                                    ErrorMessage="New Password Is Required Field !" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Confirm New Password
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="MandatoryInput" Width="220px"
                                    TextMode="Password"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtConfirmPassword"
                                    ErrorMessage="Confirm Password Is Required Field !" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword"
                                    ControlToValidate="txtConfirmPassword" ErrorMessage="New Password &amp; Confirm Password Not Match !"></asp:CompareValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

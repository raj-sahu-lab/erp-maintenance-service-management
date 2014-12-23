<%@ page language="C#" autoeventwireup="true" inherits="Installation, App_Web_uejhl4vd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>New Installation</title>
    <link href="../CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/sGrid.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="../themes/custom-theme/jquery.ui.all.css" />
    <script src="Bass.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        UserDate('txtServiceFrom');
        UserDate('txtServiceTo');
        UserDate('txtPm1');
        UserDate('txtPm2');
    </script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            UserDate('txtServiceFrom');
            UserDate('txtServiceTo');
            UserDate('txtPm1');
            UserDate('txtPm2');
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
                                <a href="InstallationDetails.aspx">
                                    <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                        ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="main">
                    <fieldset id="fldStream" style="border: 1px solid #006600; width: 52%; margin-left: 225px;
                        margin-top: 30px;">
                        <legend><span class="spanCss">New Installation</span></legend>
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
                                                        <asp:Label ID="lblCDID" runat="server" Text="Hospital *" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCDID" runat="server" Width="307px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCDID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMID" runat="server" Text="Manufacturer *" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMID_SelectedIndexChanged"
                                                            Width="307px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlMID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMacID" runat="server" Text="Equipment *" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMacID" runat="server" Width="307px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlMacID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSerialNo0" runat="server" Text="Qty" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtQty" runat="server" CssClass="Right" onkeypress="return isNumberKey(event)"
                                                            Width="50px">1</asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSerialNo" runat="server" Text="Serial No. *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtSerialNo" runat="server" Width="300px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSerialNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSaleOrderNo" runat="server" Text="Sale Order No *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtSaleOrderNo" runat="server" Width="300px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSaleOrderNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text="Invoice No *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtInvoiceNo" runat="server" Width="90px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInvoiceNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblSaleOrderNo0" runat="server" Text="SWO Order No *" Width="93px"></asp:Label>
                                                        <asp:TextBox ID="txtSWO" runat="server" Width="90px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtSWO"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblServiceFrom" runat="server" Text="Warranty Start *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtServiceFrom" runat="server" Width="80px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtServiceFrom"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblServiceTo" runat="server" Text="Warranty End *" Width="90px"></asp:Label>
                                                        <asp:TextBox ID="txtServiceTo" runat="server" Width="80px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtServiceTo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblServiceFrom0" runat="server" Text="1st PM" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtPm1" runat="server" Width="80px"></asp:TextBox>
                                                        <asp:Label ID="lblServiceTo0" runat="server" Text="2nd PM" Width="92px"></asp:Label>
                                                        <asp:TextBox ID="txtPm2" runat="server" Width="80px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblWarrantyPeriod" runat="server" Text="Warranty Status *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtWarrantyPeriod" runat="server" Width="300px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtWarrantyPeriod"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblEmpID" runat="server" Text="Employee *" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlEmpID" runat="server" Width="307px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlEmpID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="grdCenter" runat="server" AllowPaging="True" AllowSorting="True"
                                                            AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="sDsInstallation" OnRowCommand="grdCDetails_RowCommand"
                                                            PagerStyle-CssClass="pgr" PageSize="5" DataKeyNames="Code">
                                                            <Columns>
                                                                <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30px" />
                                                                <asp:BoundField DataField="MacName" HeaderText="Equipment" ItemStyle-Width="250px" ItemStyle-HorizontalAlign="Left" />
                                                                <asp:BoundField DataField="SerialNo" HeaderText="Serial No." ItemStyle-Width="100px"
                                                                    ItemStyle-HorizontalAlign="Left" />
                                                                <asp:TemplateField HeaderText="View" ItemStyle-Width="30px">
                                                                    <ItemTemplate>
                                                                        <div align="center">
                                                                            <asp:ImageButton ID="imgview" runat="server" CausesValidation="false" CommandArgument='<% #Bind("Code") %>'
                                                                                CommandName="cmdView" Text="View" ImageUrl="~/mImage/view.jpg" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Del">
                                                                    <ItemTemplate>
                                                                        <div align="center">
                                                                            <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="false" CommandArgument='<% #Bind("Code") %>'
                                                                                CommandName="cmdDelete" ImageUrl="~/mImage/Delete.jpg" OnClientClick="return confirm('Are you sure you want to Delete ?');"
                                                                                Text="Delete" />
                                                                            <div align="center">
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="sDsInstallation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                            SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY InsID) AS Row , [InsID] as Code, CASE  WHEN len(MacName) > 30  THEN SUBSTRING(MacName,0,30) + '...' ELSE [MacName] END as [MacName] , [SerialNo] FROM [vwInstallation] WHERE ([InvoiceNo] = @InvoiceNo)">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="InvoiceNo" SessionField="strCode" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
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
            <asp:AsyncPostBackTrigger ControlID="grdCenter" EventName="RowCommand" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>

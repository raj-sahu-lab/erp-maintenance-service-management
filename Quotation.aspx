<%@ page language="C#" autoeventwireup="true" inherits="Quotation, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Quotation</title>
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
        UserDate('txtQuotationDate');
    </script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            UserDate('txtQuotationDate');
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
                                <a href="QuotationDetails.aspx">
                                    <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                        ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="main">
                    <fieldset id="fldStream" style="border: 1px solid #006600; width: 65%; margin-left: 160px;
                        margin-top: 30px;">
                        <legend><span class="spanCss">Quotation</span></legend>
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
                                                width: 99%;">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblQuotation" runat="server" Text="Quotation No. *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtQuotationNo" runat="server" Width="150px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuotationNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblQuotationDate" runat="server" Text="Date" Width="40px"></asp:Label>
                                                        <asp:TextBox ID="txtQuotationDate" runat="server" Width="80px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQuotationDate"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblRefrenceNo" runat="server" Text="Refrence No" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtRefrenceNo" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblOrgID" runat="server" Text="Company *" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlOrgID" runat="server" Width="355px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlOrgID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlOrgID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCDID" runat="server" Text="Client *" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCDID" runat="server" Width="355px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCDID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMID" runat="server" Text="Manufacturer *" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMID" runat="server" Width="355px" AutoPostBack="True" 
                                                            OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlMID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMacID" runat="server" Text="Equipment *" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMacID" runat="server" Width="355px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlMacID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblDescription" runat="server" Text="Description *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtDescription" runat="server" Width="350px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDescription"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity *" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="Right" Width="104px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtQuantity"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price" Width="60px"></asp:Label>
                                                        <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="Right" Width="104px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblEmpID" runat="server" Text="Employee" Width="120px"></asp:Label>
                                                        <asp:DropDownList ID="ddlEmpID" runat="server" Width="355px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>
                                                        <asp:Label ID="lblDelivery" runat="server" Text="Delivery" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtDelivery" runat="server" Width="350px">WITHIN 5-10 DAYS</asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>
                                                        <asp:Label ID="lblPayment" runat="server" Text="Payment" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtPayment" runat="server" Width="350px">100% ADVANCE ALONGWITH WRITTEN ORDER</asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>
                                                        <asp:Label ID="lblVaildity" runat="server" Text="Vaildity" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtVaildity" runat="server" Width="110px">30 DAYS</asp:TextBox>
                                                            <asp:DropDownList ID="ddlTaxType" runat="server" Width="110px">
                                                                <asp:ListItem>Vat</asp:ListItem>
                                                                <asp:ListItem>Service Tax</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:TextBox ID="txtVat" runat="server" Width="110px">Extra @ 5%</asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblWarranty" runat="server" Text="Warranty" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtWarranty" runat="server" Width="350px">90 DAYS</asp:TextBox>
                                                    </td>
                                                </tr>
                                                  <tr>
                                                    <td>
                                                        <asp:Label ID="lblNote" runat="server" Text="Note" Width="120px"></asp:Label>
                                                        <asp:TextBox ID="txtNote" runat="server" Width="350px" TextMode="MultiLine">Parts are replaceable on exchange basis and the defective should be return to .</asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="grdCenter" runat="server" AllowPaging="True" AllowSorting="True"
                                                            AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="sDsQuotation" OnRowCommand="grdCDetails_RowCommand"
                                                            PagerStyle-CssClass="pgr" PageSize="5" ShowFooter="True" DataKeyNames="Code">
                                                            <Columns>
                                                                <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30" ItemStyle-HorizontalAlign="Center"
                                                                    ReadOnly="True" />
                                                                <asp:BoundField DataField="ManName" HeaderText="Manufacturer" ItemStyle-Width="200px"
                                                                    ItemStyle-HorizontalAlign="Left" />
                                                                <asp:BoundField DataField="MacName" HeaderText="Equipment" ItemStyle-HorizontalAlign="Left"
                                                                    ItemStyle-Width="200px" />
                                                                <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-HorizontalAlign="Right"
                                                                    ItemStyle-Width="40px" ItemStyle-Font-Bold="true" />
                                                                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" ItemStyle-HorizontalAlign="Right"
                                                                    ItemStyle-Width="50px" ItemStyle-Font-Bold="true" />
                                                                <asp:BoundField DataField="Amount" HeaderText="Amt" ItemStyle-Font-Bold="true" />
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
                                                        <asp:SqlDataSource ID="sDsQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                            SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY QID) AS Row , [QID] as Code, [ManName], [MacName], [Quantity], [UnitPrice], [Amount] FROM [vwQuotation] WHERE ([QuotationNo] = @QuotationNo)">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="QuotationNo" SessionField="strCode" Type="String" />
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

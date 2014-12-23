<%@ page language="C#" autoeventwireup="true" inherits="PurchaseOrder, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Purchase Order</title>
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

       <script src="js/Bass.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        UserDate('txtPODate');
        UserDate('txtChequeDate');
    </script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            UserDate('txtPODate');
            UserDate('txtChequeDate');
        }
    </script>

    <script type="text/javascript">
        function answers() {
            var dropdown = $("#ddlDisPct option:selected");
            var selected_value = dropdown.val();
            var DisAmt = 0;

            var uPrice = document.getElementById('<%= txtUnitPrice.ClientID %>');
            var Quantity = document.getElementById('<%= txtQuantity.ClientID %>');

            var x = parseFloat(uPrice.value);
            var y = parseFloat(Quantity.value);
            var z = parseFloat(selected_value);

            DisAmt = ((x * y) * z) / 100;

            document.getElementById('<%= txtDisAmount.ClientID %>').value = DisAmt.toFixed(2);
            document.getElementById('<%= txtTotalPrice.ClientID %>').value = ((x * y) - DisAmt).toFixed(2);
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
                                <a href="PurchaseOrderDetails.aspx">
                                    <asp:Image ID="ImgHome" runat="server" CssClass="AdmImg" Height="30px" Width="30px"
                                        ImageUrl="~/mImage/home.jpg" AlternateText="Home" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="main">
                    <fieldset id="fldStream" style="border: 1px solid #006600; width: 65%; margin-left: 165px;
                        margin-top: 30px;">
                        <legend><span class="spanCss">Purchase Order</span></legend>
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
                                                        <asp:Label ID="lblPONo" runat="server" Text="PO. No. *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtPONo" runat="server" Width="200px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPONo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblPODate" runat="server" Text="Date" Width="40px"></asp:Label>
                                                        <asp:TextBox ID="txtPODate" runat="server" Width="85px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPODate"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblOrgID" runat="server" Text="Company *" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlOrgID" runat="server" Width="322px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlOrgID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlOrgID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblBankName" runat="server" Text="Bank Name *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtBankName" runat="server" Width="317px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBankName"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblChequeNo" runat="server" Text="Cheque No. *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtChequeNo" runat="server" Width="120px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtChequeNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblChequeDate" runat="server" Text="Cheque Date" Width="82px"></asp:Label>
                                                        <asp:TextBox ID="txtChequeDate" runat="server" Width="85px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtChequeDate"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblDescription" runat="server" Text="Description *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtDescription" runat="server" Width="317px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDescription"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMID" runat="server" Text="Manufacturer *" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMID" runat="server" Width="322px" AutoPostBack="True" OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlMID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMacID" runat="server" Text="Equipment Model *" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMacID" runat="server" Width="322px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlMacID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblPartCodeNo" runat="server" Text="Part Code No *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtPartCodeNo" runat="server" Width="317px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPartCodeNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity *" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="Right" Width="110px" onkeypress="return isNumberKey(event)" onBlur="answers(this.value)"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtQuantity"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price *" Width="70px"></asp:Label>
                                                        <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="Right" Width="110px" onkeypress="return isNumberKey(event)" onBlur="answers(this.value)"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtUnitPrice"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblDisType" runat="server" Text="Discount Type" Width="130px"></asp:Label>
                                                        <asp:DropDownList ID="ddlDisType" runat="server" Width="115px">
                                                            <asp:ListItem>Discount</asp:ListItem>
                                                            <asp:ListItem>Commission</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lblDisPct" runat="server" Text="Discount %" Width="80px"></asp:Label>
                                                        <asp:DropDownList ID="ddlDisPct" runat="server" Width="115px" onchange="answers(this.value)">
                                                            <asp:ListItem>5%</asp:ListItem>
                                                            <asp:ListItem>10%</asp:ListItem>
                                                            <asp:ListItem>15%</asp:ListItem>
                                                            <asp:ListItem>20%</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblDisAmount" runat="server" Text="Discount Amount" Width="130px"></asp:Label>
                                                        <asp:TextBox ID="txtDisAmount" runat="server" CssClass="Right" Width="110px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                        <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price" Width="80px"></asp:Label>
                                                        <asp:TextBox ID="txtTotalPrice" runat="server" CssClass="Right" Width="110px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="grdCenter" runat="server" AllowPaging="True" AllowSorting="True"
                                                            AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="sDsPO" OnRowCommand="grdCDetails_RowCommand"
                                                            PagerStyle-CssClass="pgr">
                                                            <Columns>
                                                                <asp:BoundField DataField="Row" HeaderText="SN" ItemStyle-Width="30" ItemStyle-HorizontalAlign="Center"
                                                                    SortExpression="POID" />
                                                                <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="150px"
                                                                    ItemStyle-HorizontalAlign="Left" />
                                                                <asp:BoundField DataField="PartCodeNo" HeaderText="Code No" ItemStyle-HorizontalAlign="Left"
                                                                    ItemStyle-Width="100px" />
                                                                <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-HorizontalAlign="Right"
                                                                    ItemStyle-Width="30px" ItemStyle-Font-Bold="true" />
                                                                <asp:BoundField DataField="UnitPrice" HeaderText="Price" ItemStyle-HorizontalAlign="Right"
                                                                    ItemStyle-Width="50px" ItemStyle-Font-Bold="true" />
                                                                <asp:BoundField DataField="DisAmount" HeaderText="DisAmt" ItemStyle-HorizontalAlign="Right"
                                                                    ItemStyle-Width="50px" ItemStyle-Font-Bold="true" />
                                                                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" ItemStyle-Width="100px" />
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
                                                        <asp:SqlDataSource ID="sDsPO" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                            SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY POID) AS Row , [POID] as Code , [Description], [PartCodeNo], [Quantity], [UnitPrice], [DisAmount], [TotalPrice] FROM [vwPurchaseOrder] WHERE ([PONo] = @PONo)">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="PONo" SessionField="strCode" Type="String" />
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
            <asp:AsyncPostBackTrigger ControlID="ddlOrgID" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>

<%@ page language="C#" autoeventwireup="true" inherits="DebitNote, App_Web_lzdpsiox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Debit Note</title>
    <link href="CSS/FormControls.css" rel="stylesheet" type="text/css" />
    <link href="CSS/SuperAdminCss.css" rel="stylesheet" type="text/css" />
    <link href="CSS/sGrid.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/trirand/jquery.jqDatePicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="themes/custom-theme/jquery.ui.all.css" />
    <script src="js/Bass.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        UserDate('txtDNDate');
        UserDate('txtPOWTo');
        UserDate('txtPOWFrom');
    </script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            UserDate('txtDNDate');
            UserDate('txtPOWTo');
            UserDate('txtPOWFrom');
        }
    </script>
    <script type="text/javascript">
        function mSum() {
            var txtQty = document.getElementById('<%= txtQuantity.ClientID %>');
            var cValue = document.getElementById('<%= txtContractValue.ClientID %>');
            var sTax = document.getElementById('<%= txtServiceTax.ClientID %>');

            if (txtQty.value.length == 0) {
                txtQty.value = 0;
            }

            if (cValue.value.length == 0) {
                cValue.value = 0;
            }

            if (sTax.value.length == 0) {
                sTax.value = 0;
            }

            var x = parseFloat(txtQty.value);
            var y = parseFloat(cValue.value);
            var z = parseFloat(sTax.value);

            document.getElementById('<%= txtTatolServiceTax.ClientID %>').value = (((x * y) * z) / 100).toFixed(2);
            document.getElementById('<%= txtTotal.ClientID %>').value = (((x * y) * z) / 100 + y).toFixed(2);
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
                                <a href="DebitNoteDetails.aspx">
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
                        <legend><span class="spanCss">Debit Note</span></legend>
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
                        <asp:Panel ID="PnlHead" runat="server" Style="width: 95%; margin-left: 9px;">
                            <table align="center">
                                <tr>
                                    <td>
                                        <div align="center" style="padding: 5px;">
                                            <table cellpadding="0" cellspacing="5" style="border: solid 2px #b7ddf2; background: #ebf4fb;
                                                width: 95%; padding: 5px 5px 5px 10px">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblDNNo" runat="server" Text="Debit Note No *" Width="140px"></asp:Label>
                                                        <asp:TextBox ID="txtDNNo" runat="server" Width="160px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDNNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblDNDate" runat="server" Text="Date" Width="60px"></asp:Label>
                                                        <asp:TextBox ID="txtDNDate" runat="server" Width="80px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblOrgID" runat="server" Text="Company *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlOrgID" runat="server" Width="325px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlOrgID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlOrgID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCDID" runat="server" Text="Customer *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlCDID" runat="server" Width="325px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCDID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMID" runat="server" Text="Manufacturer *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMID" runat="server" Width="325px" AutoPostBack="True" OnSelectedIndexChanged="ddlMID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlMID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMacID" runat="server" Text="Equipment Model *" Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlMacID" runat="server" Width="325px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlMacID"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblESerialNo" runat="server" Text="Equipment Serial No. *" 
                                                            Width="140px"></asp:Label>
                                                        <asp:TextBox ID="txtESerialNo" runat="server" Width="317px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtESerialNo"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblElegibility" runat="server" Text="Elegibility" 
                                                            Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlElegibility" runat="server" Width="115px">
                                                            <asp:ListItem>Warranty</asp:ListItem>
                                                            <asp:ListItem>LAMC</asp:ListItem>
                                                            <asp:ListItem>CMA</asp:ListItem>
                                                            <asp:ListItem>Paid Category</asp:ListItem>
                                                            <asp:ListItem>Installation</asp:ListItem>
                                                        </asp:DropDownList>                                                        
                                                        <asp:Label ID="lblLocation" runat="server" Text="Location" Width="80px"></asp:Label>
                                                        <asp:DropDownList ID="ddlLocation" runat="server" Width="115px">
                                                            <asp:ListItem>Instation</asp:ListItem>
                                                            <asp:ListItem>OutStation</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblPOWTo" runat="server" Text="Warranty Period From *" 
                                                            Width="140px"></asp:Label>
                                                        <asp:TextBox ID="txtPOWTo" runat="server" Width="90px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                                            ControlToValidate="txtPOWFrom" ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblPOWFrom" runat="server" Text="To *" Width="85px"></asp:Label>
                                                        <asp:TextBox ID="txtPOWFrom" runat="server" Width="90px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                            ControlToValidate="txtPOWTo" ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblReasonForClaim" runat="server" Text="Reason For Claim" 
                                                            Width="140px"></asp:Label>
                                                        <asp:DropDownList ID="ddlReasonForClaim" runat="server" Width="325px">
                                                            <asp:ListItem>Labour Support 1st 6months</asp:ListItem>
                                                            <asp:ListItem>Labour Support 2nd 6months</asp:ListItem>
                                                            <asp:ListItem>Installation</asp:ListItem>
                                                            <asp:ListItem>Service Commision</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity *" Width="140px"></asp:Label>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="Right" Width="85px" onkeypress="return isNumberKey(event)"
                                                            onBlur="mSum()"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtQuantity"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblServiceOrderNo" runat="server" Text="Service Order No." Width="107px"></asp:Label>
                                                        <asp:TextBox ID="txtServiceOrderNo" runat="server" CssClass="Right" Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblContractValue" runat="server" Text="Contract Value *" 
                                                            Width="140px"></asp:Label>
                                                        <asp:TextBox ID="txtContractValue" runat="server" CssClass="Right" onkeypress="return isNumberKey(event)"
                                                            Width="100px" onBlur="mSum()"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtContractValue"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblServiceTax" runat="server" Text="Service Tax *" Width="92px"></asp:Label>
                                                        <asp:TextBox ID="txtServiceTax" runat="server" CssClass="Right" Width="100px" onkeypress="return isNumberKey(event)"
                                                            onBlur="mSum()"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtServiceTax"
                                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTatolServiceTax" runat="server" Text="Tatol Service Tax" 
                                                            Width="140px"></asp:Label>
                                                        <asp:TextBox ID="txtTatolServiceTax" runat="server" CssClass="Right" Width="100px"
                                                            onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total Amt" Width="100px"></asp:Label>
                                                        <asp:TextBox ID="txtTotal" runat="server" CssClass="Right" Width="100px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="grdCenter" runat="server" AllowPaging="True" AllowSorting="True"
                                                            AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="sDsDebitNote" OnRowCommand="grdCDetails_RowCommand"
                                                            PagerStyle-CssClass="pgr" PageSize="5" ShowFooter="True" DataKeyNames="Code">
                                                            <Columns>
                                                                <asp:BoundField DataField="Row" HeaderText="SN" ReadOnly="True" ItemStyle-Width="30px" />
                                                                <asp:BoundField DataField="ManName" HeaderText="Manufacturer" ItemStyle-Width="120px" />
                                                                <asp:BoundField DataField="ESerialNo" HeaderText="Serial No" ItemStyle-Width="100px"
                                                                    ItemStyle-HorizontalAlign="Left" />
                                                                <asp:BoundField DataField="Quantity" HeaderText="Qty" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Right" />
                                                                <asp:BoundField DataField="ContractValue" HeaderText="Con. Value" ItemStyle-Width="70px"
                                                                    ItemStyle-HorizontalAlign="Right" />
                                                                <asp:BoundField DataField="TatolServiceTax" HeaderText="Tatol S.Tax" ItemStyle-Width="70px"
                                                                    ItemStyle-HorizontalAlign="Right" />
                                                                <asp:BoundField DataField="Total" HeaderText="Total" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
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
                                                        <asp:SqlDataSource ID="sDsDebitNote" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                                                            SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY DNID) AS Row , [DNID] as Code, SUBSTRING(ManName,0,20)+'...' as ManName  , [ESerialNo], [Quantity], [ContractValue], [TatolServiceTax], [Total] FROM [vwDebitNote] WHERE ([DNNo] = @DNNo)">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="DNNo" SessionField="strCode" Type="String" />
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
            <asp:AsyncPostBackTrigger ControlID="ddlOrgID" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlMID" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlMacID" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="grdCenter" EventName="RowCommand" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>

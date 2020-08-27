<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktEnquiry.aspx.vb" Inherits="EF_mktEnquiry" title="Edit: Enquiry" %>
<asp:Content ID="CPHmktEnquiry" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktEnquiry" runat="server" Text="&nbsp;Edit: Enquiry"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiry" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktEnquiry"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    EnableDelete = "False"
    EnablePrint = "True"
    PrintUrl = "../App_Print/RP_mktEnquiry.aspx?pk="
    ValidationGroup = "mktEnquiry"
    runat = "server" />
    <script type="text/javascript">
      var pcnt = 0;
      function print_report(o) {
        pcnt = pcnt + 1;
        var nam = 'wTask' + pcnt;
        var url = self.location.href.replace('App_Forms/GF_','App_Print/RP_');
        url = url + '?pk=' + o.alt;
        url = o.alt;
        window.open(url, nam, 'left=20,top=20,width=1000,height=600,toolbar=1,resizable=1,scrollbars=1');
        return false;
      }
    </script>
<asp:FormView ID="FVmktEnquiry"
  runat = "server"
  DataKeyNames = "SerialNo"
  DataSourceID = "ODSmktEnquiry"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SerialNo" runat="server" ForeColor="#CC6633" Text="Serial No :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SerialNo"
            Text='<%# Bind("SerialNo") %>'
            ToolTip="Value of Serial No."
            Enabled = "False"
            CssClass = "mypktxt"
            Width="88px"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProspectNo" runat="server" Text="Prospect No :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProspectNo"
            Text='<%# Bind("ProspectNo") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktEnquiry"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Prospect No."
            MaxLength="50"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVProspectNo"
            runat = "server"
            ControlToValidate = "F_ProspectNo"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktEnquiry"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EnquiryDate" runat="server" Text="Enquiry Date :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EnquiryDate"
            Text='<%# Bind("EnquiryDate") %>'
            Width="80px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktEnquiry"
            runat="server" />
          <asp:Image ID="ImageButtonEnquiryDate" runat="server" ToolTip="Click to open calendar" style="cursor: pointer; vertical-align:bottom" ImageUrl="~/Images/cal.png" />
          <AJX:CalendarExtender 
            ID = "CEEnquiryDate"
            TargetControlID="F_EnquiryDate"
            Format="dd/MM/yyyy"
            runat = "server" CssClass="MyCalendar" PopupButtonID="ImageButtonEnquiryDate" />
          <AJX:MaskedEditExtender 
            ID = "MEEEnquiryDate"
            runat = "server"
            mask = "99/99/9999"
            MaskType="Date"
            CultureName = "en-GB"
            MessageValidatorTip="true"
            InputDirection="LeftToRight"
            ErrorTooltipEnabled="true"
            TargetControlID="F_EnquiryDate" />
          <AJX:MaskedEditValidator 
            ID = "MEVEnquiryDate"
            runat = "server"
            ControlToValidate = "F_EnquiryDate"
            ControlExtender = "MEEEnquiryDate"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktEnquiry"
            IsValidEmpty = "false"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_MktVericalID" runat="server" Text="Marketing Verical :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <LGM:LC_mktVerticals
            ID="F_MktVericalID"
            SelectedValue='<%# Bind("MktVericalID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            ValidationGroup = "mktEnquiry"
            RequiredFieldErrorMessage = "<div class='errorLG'>Required!</div>"
            onblur= "script_mktEnquiry.validate_MktVericalID(this);"
            Runat="Server" />
          </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CustomerName" runat="server" Text="Customer Name :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_CustomerName"
            Text='<%# Bind("CustomerName") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Customer Name."
            MaxLength="250"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_CustomerID" runat="server" Text="Customer ID :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_CustomerID"
            CssClass = "myfktxt"
            Text='<%# Bind("CustomerID") %>'
            AutoCompleteType = "None"
            Width="80px"
            onfocus = "return this.select();"
            ToolTip="Enter value for Customer ID."
            onblur= "script_mktEnquiry.validate_CustomerID(this);"
            Runat="Server" />
          <asp:Label
            ID = "F_CustomerID_Display"
            Text='<%# Eval("VR_BusinessPartner15_BPName") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACECustomerID"
            BehaviorID="B_ACECustomerID"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="CustomerIDCompletionList"
            TargetControlID="F_CustomerID"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_mktEnquiry.ACECustomerID_Selected"
            OnClientPopulating="script_mktEnquiry.ACECustomerID_Populating"
            OnClientPopulated="script_mktEnquiry.ACECustomerID_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_MktSiteID" runat="server" Text="Site :" />&nbsp;
        </td>
        <td>
          <LGM:LC_mktSites
            ID="F_MktSiteID"
            SelectedValue='<%# Bind("MktSiteID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            onblur= "script_mktEnquiry.validate_MktSiteID(this);"
            Runat="Server" />
          </td>
        <td class="alignright">
          <asp:Label ID="L_MktRegionID" runat="server" Text="Region :" />&nbsp;
        </td>
        <td>
          <LGM:LC_mktRegions
            ID="F_MktRegionID"
            SelectedValue='<%# Bind("MktRegionID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            onblur= "script_mktEnquiry.validate_MktRegionID(this);"
            Runat="Server" />
          </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_IndianStateID" runat="server" Text="Indian State :" />&nbsp;
        </td>
        <td>
          <LGM:LC_spmtERPStates
            ID="F_IndianStateID"
            SelectedValue='<%# Bind("IndianStateID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            onblur= "script_mktEnquiry.validate_IndianStateID(this);"
            Runat="Server" />
          </td>
      <td></td><td></td></tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_SiteLocation" runat="server" Text="Site Location :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SiteLocation"
            Text='<%# Bind("SiteLocation") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Site Location."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ResponsibleSalsePerson" runat="server" Text="Responsible Salse Person :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_ResponsibleSalsePerson"
            CssClass = "myfktxt"
            Text='<%# Bind("ResponsibleSalsePerson") %>'
            AutoCompleteType = "None"
            Width="72px"
            onfocus = "return this.select();"
            ToolTip="Enter value for Responsible Salse Person."
            ValidationGroup = "mktEnquiry"
            onblur= "script_mktEnquiry.validate_ResponsibleSalsePerson(this);"
            Runat="Server" />
          <asp:RequiredFieldValidator 
            ID = "RFVResponsibleSalsePerson"
            runat = "server"
            ControlToValidate = "F_ResponsibleSalsePerson"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktEnquiry"
            SetFocusOnError="true" />
          <asp:Label
            ID = "F_ResponsibleSalsePerson_Display"
            Text='<%# Eval("aspnet_users1_UserFullName") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACEResponsibleSalsePerson"
            BehaviorID="B_ACEResponsibleSalsePerson"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="ResponsibleSalsePersonCompletionList"
            TargetControlID="F_ResponsibleSalsePerson"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_mktEnquiry.ACEResponsibleSalsePerson_Selected"
            OnClientPopulating="script_mktEnquiry.ACEResponsibleSalsePerson_Populating"
            OnClientPopulated="script_mktEnquiry.ACEResponsibleSalsePerson_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectName" runat="server" Text="Project Name :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProjectName"
            Text='<%# Bind("ProjectName") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Name."
            MaxLength="250"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ProjectID" runat="server" Text="Project ID :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_ProjectID"
            CssClass = "myfktxt"
            Text='<%# Bind("ProjectID") %>'
            AutoCompleteType = "None"
            Width="56px"
            onfocus = "return this.select();"
            ToolTip="Enter value for Project ID."
            onblur= "script_mktEnquiry.validate_ProjectID(this);"
            Runat="Server" />
          <asp:Label
            ID = "F_ProjectID_Display"
            Text='<%# Eval("IDM_Projects4_Description") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACEProjectID"
            BehaviorID="B_ACEProjectID"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="ProjectIDCompletionList"
            TargetControlID="F_ProjectID"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_mktEnquiry.ACEProjectID_Selected"
            OnClientPopulating="script_mktEnquiry.ACEProjectID_Populating"
            OnClientPopulated="script_mktEnquiry.ACEProjectID_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectConsultant" runat="server" Text="Project Consultant :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProjectConsultant"
            Text='<%# Bind("ProjectConsultant") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Consultant."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_BidApprovalRequired" runat="server" Text="Bid Approval Required :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_BidApprovalRequired"
            Checked='<%# Bind("BidApprovalRequired") %>'
            CssClass = "mychk"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ProjectBaseID" runat="server" Text="Project Base :" />&nbsp;
        </td>
        <td>
          <LGM:LC_mktProjectBases
            ID="F_ProjectBaseID"
            SelectedValue='<%# Bind("ProjectBaseID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            onblur= "script_mktEnquiry.validate_ProjectBaseID(this);"
            Runat="Server" />
          </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CustomerKeyOfficials" runat="server" Text="Customer`s Key Officials :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_CustomerKeyOfficials"
            Text='<%# Bind("CustomerKeyOfficials") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Customer`s Key Officials."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_BidSubmissionDate" runat="server" Text="Bid Submission Date :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BidSubmissionDate"
            Text='<%# Bind("BidSubmissionDate") %>'
            Width="80px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            runat="server" />
          <asp:Image ID="ImageButtonBidSubmissionDate" runat="server" ToolTip="Click to open calendar" style="cursor: pointer; vertical-align:bottom" ImageUrl="~/Images/cal.png" />
          <AJX:CalendarExtender 
            ID = "CEBidSubmissionDate"
            TargetControlID="F_BidSubmissionDate"
            Format="dd/MM/yyyy"
            runat = "server" CssClass="MyCalendar" PopupButtonID="ImageButtonBidSubmissionDate" />
          <AJX:MaskedEditExtender 
            ID = "MEEBidSubmissionDate"
            runat = "server"
            mask = "99/99/9999"
            MaskType="Date"
            CultureName = "en-GB"
            MessageValidatorTip="true"
            InputDirection="LeftToRight"
            ErrorTooltipEnabled="true"
            TargetControlID="F_BidSubmissionDate" />
          <AJX:MaskedEditValidator 
            ID = "MEVBidSubmissionDate"
            runat = "server"
            ControlToValidate = "F_BidSubmissionDate"
            ControlExtender = "MEEBidSubmissionDate"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            IsValidEmpty = "True"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_OrderFinalizationYear" runat="server" Text="Order Finalization Year :" />&nbsp;
        </td>
        <td>
          <LGM:LC_mktYears
            ID="F_OrderFinalizationYear"
            SelectedValue='<%# Bind("OrderFinalizationYear") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            onblur= "script_mktEnquiry.validate_OrderFinalizationYear(this);"
            Runat="Server" />
          </td>
        <td class="alignright">
          <asp:Label ID="L_OrderFinalizationMonth" runat="server" Text="Order Finalization Month :" />&nbsp;
        </td>
        <td>
          <LGM:LC_mktMonths
            ID="F_OrderFinalizationMonth"
            SelectedValue='<%# Bind("OrderFinalizationMonth") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            onblur= "script_mktEnquiry.validate_OrderFinalizationMonth(this);"
            Runat="Server" />
          </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ApproxProjectValue" runat="server" Text="Approx Project Value :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ApproxProjectValue"
            Text='<%# Bind("ApproxProjectValue") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Approx Project Value."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EnquiryTypeID" runat="server" Text="Enquiry Type :" />&nbsp;
        </td>
        <td colspan="3">
          <LGM:LC_mktEnquiryTypes
            ID="F_EnquiryTypeID"
            SelectedValue='<%# Bind("EnquiryTypeID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            onblur= "script_mktEnquiry.validate_EnquiryTypeID(this);"
            Runat="Server" />
          </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_Competitors" runat="server" Text="Competitors :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_Competitors"
            Text='<%# Bind("Competitors") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Competitors."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectFunding" runat="server" Text="Project Funding :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProjectFunding"
            Text='<%# Bind("ProjectFunding") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Funding."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_BidderTypeID" runat="server" Text="Bidder Type :" />&nbsp;
        </td>
        <td colspan="3">
          <LGM:LC_mktBidderTypes
            ID="F_BidderTypeID"
            SelectedValue='<%# Bind("BidderTypeID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            onblur= "script_mktEnquiry.validate_BidderTypeID(this);"
            Runat="Server" />
          </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_BriefScope" runat="server" Text="Brief Scope :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BriefScope"
            Text='<%# Bind("BriefScope") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Brief Scope."
            MaxLength="1000"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectStatus" runat="server" Text="Project Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProjectStatus"
            Text='<%# Bind("ProjectStatus") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Status."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_PPAStatus" runat="server" Text="PPA Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_PPAStatus"
            Text='<%# Bind("PPAStatus") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for PPA Status."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_LandAcquisitionStatus" runat="server" Text="Land Acquisition Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_LandAcquisitionStatus"
            Text='<%# Bind("LandAcquisitionStatus") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Land Acquisition Status."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_StatutoryClearanceStatus" runat="server" Text="Statutory Clearance Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_StatutoryClearanceStatus"
            Text='<%# Bind("StatutoryClearanceStatus") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Statutory Clearance Status."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_PreQualificationRequirement" runat="server" Text="Pre-Qualification Requirement :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_PreQualificationRequirement"
            Text='<%# Bind("PreQualificationRequirement") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Pre-Qualification Requirement."
            MaxLength="250"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProposedRiskreviewdate" runat="server" Text="Proposed Risk Review Date :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProposedRiskreviewdate"
            Text='<%# Bind("ProposedRiskreviewdate") %>'
            Width="80px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            runat="server" />
          <asp:Image ID="ImageButtonProposedRiskreviewdate" runat="server" ToolTip="Click to open calendar" style="cursor: pointer; vertical-align:bottom" ImageUrl="~/Images/cal.png" />
          <AJX:CalendarExtender 
            ID = "CEProposedRiskreviewdate"
            TargetControlID="F_ProposedRiskreviewdate"
            Format="dd/MM/yyyy"
            runat = "server" CssClass="MyCalendar" PopupButtonID="ImageButtonProposedRiskreviewdate" />
          <AJX:MaskedEditExtender 
            ID = "MEEProposedRiskreviewdate"
            runat = "server"
            mask = "99/99/9999"
            MaskType="Date"
            CultureName = "en-GB"
            MessageValidatorTip="true"
            InputDirection="LeftToRight"
            ErrorTooltipEnabled="true"
            TargetControlID="F_ProposedRiskreviewdate" />
          <AJX:MaskedEditValidator 
            ID = "MEVProposedRiskreviewdate"
            runat = "server"
            ControlToValidate = "F_ProposedRiskreviewdate"
            ControlExtender = "MEEProposedRiskreviewdate"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            IsValidEmpty = "True"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_RiskReviewMeetingComments" runat="server" Text="Risk Review Meeting Comments :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_RiskReviewMeetingComments"
            Text='<%# Bind("RiskReviewMeetingComments") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Risk Review Meeting Comments."
            MaxLength="1000"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_RiskReviewApproval" runat="server" Text="Risk Review Approval :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:CheckBox ID="F_RiskReviewApproval"
            Checked='<%# Bind("RiskReviewApproval") %>'
            CssClass = "mychk"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CreatedBy" runat="server" Text="Created By :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_CreatedBy"
            Width="72px"
            Text='<%# Bind("CreatedBy") %>'
            Enabled = "False"
            ToolTip="Value of Created By."
            CssClass = "dmyfktxt"
            Runat="Server" />
          <asp:Label
            ID = "F_CreatedBy_Display"
            Text='<%# Eval("aspnet_users2_UserFullName") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ModifiedBy" runat="server" Text="Modified By :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_ModifiedBy"
            Width="72px"
            Text='<%# Bind("ModifiedBy") %>'
            Enabled = "False"
            ToolTip="Value of Modified By."
            CssClass = "dmyfktxt"
            Runat="Server" />
          <asp:Label
            ID = "F_ModifiedBy_Display"
            Text='<%# Eval("aspnet_users3_UserFullName") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CreatedOn" runat="server" Text="Created On :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_CreatedOn"
            Text='<%# Bind("CreatedOn") %>'
            ToolTip="Value of Created On."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ModifiedOn" runat="server" Text="Modified On :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ModifiedOn"
            Text='<%# Bind("ModifiedOn") %>'
            ToolTip="Value of Modified On."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_StatusID" runat="server" Text="Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_StatusID"
            Width="88px"
            Text='<%# Bind("StatusID") %>'
            Enabled = "False"
            ToolTip="Value of Status."
            CssClass = "dmyfktxt"
            Runat="Server" />
          <asp:Label
            ID = "F_StatusID_Display"
            Text='<%# Eval("MKT_EnquiryStatus6_StatusName") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
<fieldset class="ui-widget-content page">
<legend>
    <asp:Label ID="LabelmktSalesPersons" runat="server" Text="&nbsp;List: Sales Persons List"></asp:Label>
</legend>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktSalesPersons" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktSalesPersons"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktSalesPersons.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktSalesPersons.aspx"
      AddPostBack = "True"
      EnableExit = "false"
      ValidationGroup = "mktSalesPersons"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktSalesPersons" runat="server" AssociatedUpdatePanelID="UPNLmktSalesPersons" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktSalesPersons" SkinID="gv_silver" runat="server" DataSourceID="ODSmktSalesPersons" DataKeyNames="SerialNo,SalesPerson">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Serial No" SortExpression="MKT_Enquiry2_ProspectNo">
          <ItemTemplate>
             <asp:Label ID="L_SerialNo" runat="server" ForeColor='<%# EVal("ForeColor") %>' Title='<%# EVal("SerialNo") %>' Text='<%# Eval("MKT_Enquiry2_ProspectNo") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sales Person" SortExpression="aspnet_users1_UserFullName">
          <ItemTemplate>
             <asp:Label ID="L_SalesPerson" runat="server" ForeColor='<%# EVal("ForeColor") %>' Title='<%# EVal("SalesPerson") %>' Text='<%# Eval("aspnet_users1_UserFullName") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle Width="100px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSmktSalesPersons"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktSalesPersons"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktSalesPersonsSelectList"
      TypeName = "SIS.MKT.mktSalesPersons"
      SelectCountMethod = "mktSalesPersonsSelectCount"
      SortParameterName="OrderBy" EnablePaging="True">
      <SelectParameters >
        <asp:ControlParameter ControlID="F_SerialNo" PropertyName="Text" Name="SerialNo" Type="Int32" Size="10" />
        <asp:Parameter Name="SearchState" Type="Boolean" Direction="Input" DefaultValue="false" />
        <asp:Parameter Name="SearchText" Type="String" Direction="Input" DefaultValue="" />
      </SelectParameters>
    </asp:ObjectDataSource>
    <br />
  </td></tr></table>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="GVmktSalesPersons" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</fieldset>
<fieldset class="ui-widget-content page">
<legend>
    <asp:Label ID="LabelmktEnquiryHistory" runat="server" Text="&nbsp;List: Enquiry History"></asp:Label>
</legend>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryHistory" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktEnquiryHistory"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktEnquiryHistory.aspx"
      EnableAdd = "False"
      EnableExit = "false"
      ValidationGroup = "mktEnquiryHistory"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktEnquiryHistory" runat="server" AssociatedUpdatePanelID="UPNLmktEnquiryHistory" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktEnquiryHistory" SkinID="gv_silver" runat="server" DataSourceID="ODSmktEnquiryHistory" DataKeyNames="HistoryID,SerialNo">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="History ID" SortExpression="HistoryID">
          <ItemTemplate>
            <asp:Label ID="LabelHistoryID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("HistoryID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Prospect No" SortExpression="ProspectNo">
          <ItemTemplate>
            <asp:Label ID="LabelProspectNo" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("ProspectNo") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Customer Name" SortExpression="CustomerName">
          <ItemTemplate>
            <asp:Label ID="LabelCustomerName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("CustomerName") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Site" SortExpression="MktSiteID">
          <ItemTemplate>
            <asp:Label ID="LabelMktSiteID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("MktSiteID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="80px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Responsible Salse Person" SortExpression="ResponsibleSalsePerson">
          <ItemTemplate>
            <asp:Label ID="LabelResponsibleSalsePerson" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("ResponsibleSalsePerson") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="50px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Project Name" SortExpression="ProjectName">
          <ItemTemplate>
            <asp:Label ID="LabelProjectName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("ProjectName") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Bid Submission Date" SortExpression="BidSubmissionDate">
          <ItemTemplate>
            <asp:Label ID="LabelBidSubmissionDate" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("BidSubmissionDate") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="90px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Marketing Verical" SortExpression="MktVericalID">
          <ItemTemplate>
            <asp:Label ID="LabelMktVericalID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("MktVericalID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="80px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Enquiry Date" SortExpression="EnquiryDate">
          <ItemTemplate>
            <asp:Label ID="LabelEnquiryDate" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("EnquiryDate") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="90px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSmktEnquiryHistory"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktEnquiryHistory"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktEnquiryHistorySelectList"
      TypeName = "SIS.MKT.mktEnquiryHistory"
      SelectCountMethod = "mktEnquiryHistorySelectCount"
      SortParameterName="OrderBy" EnablePaging="True">
      <SelectParameters >
        <asp:ControlParameter ControlID="F_SerialNo" PropertyName="Text" Name="SerialNo" Type="Int32" Size="10" />
        <asp:Parameter Name="SearchState" Type="Boolean" Direction="Input" DefaultValue="false" />
        <asp:Parameter Name="SearchText" Type="String" Direction="Input" DefaultValue="" />
      </SelectParameters>
    </asp:ObjectDataSource>
    <br />
  </td></tr></table>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="GVmktEnquiryHistory" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</fieldset>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktEnquiry"
  DataObjectTypeName = "SIS.MKT.mktEnquiry"
  SelectMethod = "mktEnquiryGetByID"
  UpdateMethod="UZ_mktEnquiryUpdate"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktEnquiry"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="SerialNo" Name="SerialNo" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

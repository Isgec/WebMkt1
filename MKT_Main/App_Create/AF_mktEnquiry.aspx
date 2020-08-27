<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktEnquiry.aspx.vb" Inherits="AF_mktEnquiry" title="Add: Enquiry" %>
<asp:Content ID="CPHmktEnquiry" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktEnquiry" runat="server" Text="&nbsp;Add: Enquiry"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiry" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktEnquiry"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    AfterInsertURL = "~/MKT_Main/App_Edit/EF_mktEnquiry.aspx"
    ValidationGroup = "mktEnquiry"
    runat = "server" />
<asp:FormView ID="FVmktEnquiry"
  runat = "server"
  DataKeyNames = "SerialNo"
  DataSourceID = "ODSmktEnquiry"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktEnquiry" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SerialNo" ForeColor="#CC6633" runat="server" Text="Serial No :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SerialNo" Enabled="False" CssClass="mypktxt" Width="88px" runat="server" Text="0" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProspectNo" runat="server" Text="Prospect No :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProspectNo"
            Text='<%# Bind("ProspectNo") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktEnquiry"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Prospect No."
            MaxLength="50"
            Width="408px"
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EnquiryDate" runat="server" Text="Enquiry Date :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EnquiryDate"
            Text='<%# Bind("EnquiryDate") %>'
            Width="80px"
            CssClass = "mytxt"
            ValidationGroup="mktEnquiry"
            onfocus = "return this.select();"
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CustomerName" runat="server" Text="Customer Name :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_CustomerName"
            Text='<%# Bind("CustomerName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Customer Name."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_CustomerID" runat="server" Text="Customer ID :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_CustomerID"
            CssClass = "myfktxt"
            Width="80px"
            Text='<%# Bind("CustomerID") %>'
            AutoCompleteType = "None"
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
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Site Location."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ResponsibleSalsePerson" runat="server" Text="Responsible Salse Person :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_ResponsibleSalsePerson"
            CssClass = "myfktxt"
            Width="72px"
            Text='<%# Bind("ResponsibleSalsePerson") %>'
            AutoCompleteType = "None"
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectName" runat="server" Text="Project Name :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProjectName"
            Text='<%# Bind("ProjectName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Name."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ProjectID" runat="server" Text="Project ID :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_ProjectID"
            CssClass = "myfktxt"
            Width="56px"
            Text='<%# Bind("ProjectID") %>'
            AutoCompleteType = "None"
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectConsultant" runat="server" Text="Project Consultant :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProjectConsultant"
            Text='<%# Bind("ProjectConsultant") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Consultant."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CustomerKeyOfficials" runat="server" Text="Customer`s Key Officials :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_CustomerKeyOfficials"
            Text='<%# Bind("CustomerKeyOfficials") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Customer`s Key Officials."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ApproxProjectValue" runat="server" Text="Approx Project Value :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ApproxProjectValue"
            Text='<%# Bind("ApproxProjectValue") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Approx Project Value."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_Competitors" runat="server" Text="Competitors :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_Competitors"
            Text='<%# Bind("Competitors") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Competitors."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectFunding" runat="server" Text="Project Funding :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProjectFunding"
            Text='<%# Bind("ProjectFunding") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Funding."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_BriefScope" runat="server" Text="Brief Scope :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BriefScope"
            Text='<%# Bind("BriefScope") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Brief Scope."
            MaxLength="1000"
            Width="350px"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectStatus" runat="server" Text="Project Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProjectStatus"
            Text='<%# Bind("ProjectStatus") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Status."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_PPAStatus" runat="server" Text="PPA Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_PPAStatus"
            Text='<%# Bind("PPAStatus") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for PPA Status."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_LandAcquisitionStatus" runat="server" Text="Land Acquisition Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_LandAcquisitionStatus"
            Text='<%# Bind("LandAcquisitionStatus") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Land Acquisition Status."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_StatutoryClearanceStatus" runat="server" Text="Statutory Clearance Status :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_StatutoryClearanceStatus"
            Text='<%# Bind("StatutoryClearanceStatus") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Statutory Clearance Status."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_PreQualificationRequirement" runat="server" Text="Pre-Qualification Requirement :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_PreQualificationRequirement"
            Text='<%# Bind("PreQualificationRequirement") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Pre-Qualification Requirement."
            MaxLength="250"
            Width="350px"
            runat="server" />
        </td>
      </tr>
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_RiskReviewMeetingComments" runat="server" Text="Risk Review Meeting Comments :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_RiskReviewMeetingComments"
            Text='<%# Bind("RiskReviewMeetingComments") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Risk Review Meeting Comments."
            MaxLength="1000"
            Width="350px"
            runat="server" />
        </td>
      </tr>
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
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktEnquiry"
  DataObjectTypeName = "SIS.MKT.mktEnquiry"
  InsertMethod="UZ_mktEnquiryInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktEnquiry"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

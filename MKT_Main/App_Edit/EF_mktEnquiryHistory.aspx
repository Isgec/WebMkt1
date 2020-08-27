<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktEnquiryHistory.aspx.vb" Inherits="EF_mktEnquiryHistory" title="Edit: Enquiry History" %>
<asp:Content ID="CPHmktEnquiryHistory" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktEnquiryHistory" runat="server" Text="&nbsp;Edit: Enquiry History"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryHistory" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktEnquiryHistory"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    EnableDelete = "False"
    EnableSave="false"
    ValidationGroup = "mktEnquiryHistory"
    runat = "server" />
<asp:FormView ID="FVmktEnquiryHistory"
  runat = "server"
  DataKeyNames = "HistoryID,SerialNo"
  DataSourceID = "ODSmktEnquiryHistory"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_HistoryID" runat="server" ForeColor="#CC6633" Text="History ID :" /><span style="color:red">*</span></b>
        </td>
        <td>
          <asp:TextBox ID="F_HistoryID"
            Text='<%# Bind("HistoryID") %>'
            ToolTip="Value of History ID."
            Enabled = "False"
            CssClass = "mypktxt"
            Width="88px"
            style="text-align: right"
            runat="server" />
        </td>
        <td class="alignright">
          <b><asp:Label ID="L_SerialNo" runat="server" ForeColor="#CC6633" Text="Serial No :" /><span style="color:red">*</span></b>
        </td>
        <td>
          <asp:TextBox
            ID = "F_SerialNo"
            Width="88px"
            Text='<%# Bind("SerialNo") %>'
            CssClass = "mypktxt"
            Enabled = "False"
            ToolTip="Value of Serial No."
            Runat="Server" />
          <asp:Label
            ID = "F_SerialNo_Display"
            Text='<%# Eval("MKT_Enquiry1_ProspectNo") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProspectNo" runat="server" Text="Prospect No :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProspectNo"
            Text='<%# Bind("ProspectNo") %>'
            ToolTip="Value of Prospect No."
            Enabled = "False"
            Width="408px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_MktVericalID" runat="server" Text="Marketing Verical :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_MktVericalID"
            Text='<%# Bind("MktVericalID") %>'
            ToolTip="Value of Marketing Verical."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CustomerID" runat="server" Text="Customer ID :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_CustomerID"
            Text='<%# Bind("CustomerID") %>'
            ToolTip="Value of Customer ID."
            Enabled = "False"
            Width="80px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_CustomerName" runat="server" Text="Customer Name :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_CustomerName"
            Text='<%# Bind("CustomerName") %>'
            ToolTip="Value of Customer Name."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_MktSiteID" runat="server" Text="Site :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_MktSiteID"
            Text='<%# Bind("MktSiteID") %>'
            ToolTip="Value of Site."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_MktRegionID" runat="server" Text="Region :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_MktRegionID"
            Text='<%# Bind("MktRegionID") %>'
            ToolTip="Value of Region."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_IndianStateID" runat="server" Text="Indian State :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_IndianStateID"
            Text='<%# Bind("IndianStateID") %>'
            ToolTip="Value of Indian State."
            Enabled = "False"
            Width="24px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_SiteLocation" runat="server" Text="Site Location :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_SiteLocation"
            Text='<%# Bind("SiteLocation") %>'
            ToolTip="Value of Site Location."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ResponsibleSalsePerson" runat="server" Text="Responsible Salse Person :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ResponsibleSalsePerson"
            Text='<%# Bind("ResponsibleSalsePerson") %>'
            ToolTip="Value of Responsible Salse Person."
            Enabled = "False"
            Width="72px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ProjectID" runat="server" Text="Project ID :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProjectID"
            Text='<%# Bind("ProjectID") %>'
            ToolTip="Value of Project ID."
            Enabled = "False"
            Width="56px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectName" runat="server" Text="Project Name :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProjectName"
            Text='<%# Bind("ProjectName") %>'
            ToolTip="Value of Project Name."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ProjectConsultant" runat="server" Text="Project Consultant :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProjectConsultant"
            Text='<%# Bind("ProjectConsultant") %>'
            ToolTip="Value of Project Consultant."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
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
            Enabled = "False"
            CssClass = "dmychk"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ProjectBaseID" runat="server" Text="Project Base :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProjectBaseID"
            Text='<%# Bind("ProjectBaseID") %>'
            ToolTip="Value of Project Base."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CustomerKeyOfficials" runat="server" Text="Customer Key Officials :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_CustomerKeyOfficials"
            Text='<%# Bind("CustomerKeyOfficials") %>'
            ToolTip="Value of Customer Key Officials."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_BidSubmissionDate" runat="server" Text="Bid Submission Date :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_BidSubmissionDate"
            Text='<%# Bind("BidSubmissionDate") %>'
            ToolTip="Value of Bid Submission Date."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_OrderFinalizationYear" runat="server" Text="Order Finalization Year :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_OrderFinalizationYear"
            Text='<%# Bind("OrderFinalizationYear") %>'
            ToolTip="Value of Order Finalization Year."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_OrderFinalizationMonth" runat="server" Text="Order Finalization Month :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_OrderFinalizationMonth"
            Text='<%# Bind("OrderFinalizationMonth") %>'
            ToolTip="Value of Order Finalization Month."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ApproxProjectValue" runat="server" Text="Approx Project Value :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ApproxProjectValue"
            Text='<%# Bind("ApproxProjectValue") %>'
            ToolTip="Value of Approx Project Value."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_EnquiryTypeID" runat="server" Text="Enquiry Type :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_EnquiryTypeID"
            Text='<%# Bind("EnquiryTypeID") %>'
            ToolTip="Value of Enquiry Type."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_Competitors" runat="server" Text="Competitors :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_Competitors"
            Text='<%# Bind("Competitors") %>'
            ToolTip="Value of Competitors."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ProjectFunding" runat="server" Text="Project Funding :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProjectFunding"
            Text='<%# Bind("ProjectFunding") %>'
            ToolTip="Value of Project Funding."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_BidderTypeID" runat="server" Text="Bidder Type :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_BidderTypeID"
            Text='<%# Bind("BidderTypeID") %>'
            ToolTip="Value of Bidder Type."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_BriefScope" runat="server" Text="Brief Scope :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_BriefScope"
            Text='<%# Bind("BriefScope") %>'
            ToolTip="Value of Brief Scope."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ProjectStatus" runat="server" Text="Project Status :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProjectStatus"
            Text='<%# Bind("ProjectStatus") %>'
            ToolTip="Value of Project Status."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_PPAStatus" runat="server" Text="PPA Status :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_PPAStatus"
            Text='<%# Bind("PPAStatus") %>'
            ToolTip="Value of PPA Status."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_LandAcquisitionStatus" runat="server" Text="Land Acquisition Status :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_LandAcquisitionStatus"
            Text='<%# Bind("LandAcquisitionStatus") %>'
            ToolTip="Value of Land Acquisition Status."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_StatutoryClearanceStatus" runat="server" Text="Statutory Clearance Status :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_StatutoryClearanceStatus"
            Text='<%# Bind("StatutoryClearanceStatus") %>'
            ToolTip="Value of Statutory Clearance Status."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_PreQualificationRequirement" runat="server" Text="Pre-Qualification Requirement :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_PreQualificationRequirement"
            Text='<%# Bind("PreQualificationRequirement") %>'
            ToolTip="Value of Pre-Qualification Requirement."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ProposedRiskreviewdate" runat="server" Text="Proposed Risk Review Date :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ProposedRiskreviewdate"
            Text='<%# Bind("ProposedRiskreviewdate") %>'
            ToolTip="Value of Proposed Risk Review Date."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_RiskReviewMeetingComments" runat="server" Text="Risk Review Meeting Comments :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_RiskReviewMeetingComments"
            Text='<%# Bind("RiskReviewMeetingComments") %>'
            ToolTip="Value of Risk Review Meeting Comments."
            Enabled = "False"
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_RiskReviewApproval" runat="server" Text="Risk Review Approval :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_RiskReviewApproval"
            Checked='<%# Bind("RiskReviewApproval") %>'
            Enabled = "False"
            CssClass = "dmychk"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CreatedBy" runat="server" Text="Created By :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_CreatedBy"
            Text='<%# Bind("CreatedBy") %>'
            ToolTip="Value of Created By."
            Enabled = "False"
            Width="72px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
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
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ModifiedBy" runat="server" Text="Modified By :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ModifiedBy"
            Text='<%# Bind("ModifiedBy") %>'
            ToolTip="Value of Modified By."
            Enabled = "False"
            Width="72px"
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
      <tr>
        <td class="alignright">
          <asp:Label ID="L_StatusID" runat="server" Text="Status :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_StatusID"
            Text='<%# Bind("StatusID") %>'
            ToolTip="Value of Status."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_EnquiryDate" runat="server" Text="Enquiry Date :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox ID="F_EnquiryDate"
            Text='<%# Bind("EnquiryDate") %>'
            Width="80px"
            CssClass = "dmytxt"
            Enabled = "False"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktEnquiryHistory"
  DataObjectTypeName = "SIS.MKT.mktEnquiryHistory"
  SelectMethod = "mktEnquiryHistoryGetByID"
  UpdateMethod="mktEnquiryHistoryUpdate"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktEnquiryHistory"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="HistoryID" Name="HistoryID" Type="Int32" />
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="SerialNo" Name="SerialNo" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

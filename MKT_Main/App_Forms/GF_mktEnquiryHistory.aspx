<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktEnquiryHistory.aspx.vb" Inherits="GF_mktEnquiryHistory" title="Maintain List: Enquiry History" %>
<asp:Content ID="CPHmktEnquiryHistory" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktEnquiryHistory" runat="server" Text="&nbsp;List: Enquiry History"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryHistory" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktEnquiryHistory"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktEnquiryHistory.aspx"
      EnableAdd = "False"
      ValidationGroup = "mktEnquiryHistory"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktEnquiryHistory" runat="server" AssociatedUpdatePanelID="UPNLmktEnquiryHistory" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:Panel ID="pnlH" runat="server" CssClass="cph_filter">
      <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
        <div style="float: left;">Filter Records </div>
        <div style="float: left; margin-left: 20px;">
          <asp:Label ID="lblH" runat="server">(Show Filters...)</asp:Label>
        </div>
        <div style="float: right; vertical-align: middle;">
          <asp:ImageButton ID="imgH" runat="server" ImageUrl="~/images/ua.png" AlternateText="(Show Filters...)" />
        </div>
      </div>
    </asp:Panel>
    <asp:Panel ID="pnlD" runat="server" CssClass="cp_filter" Height="0">
    <table>
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SerialNo" runat="server" Text="Serial No :" /></b>
        </td>
        <td>
          <asp:TextBox
            ID = "F_SerialNo"
            CssClass = "mypktxt"
            Width="88px"
            Text=""
            onfocus = "return this.select();"
            AutoCompleteType = "None"
            onblur= "validate_SerialNo(this);"
            Runat="Server" />
          <asp:Label
            ID = "F_SerialNo_Display"
            Text=""
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACESerialNo"
            BehaviorID="B_ACESerialNo"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="SerialNoCompletionList"
            TargetControlID="F_SerialNo"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="ACESerialNo_Selected"
            OnClientPopulating="ACESerialNo_Populating"
            OnClientPopulated="ACESerialNo_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
    </table>
    </asp:Panel>
    <AJX:CollapsiblePanelExtender ID="cpe1" runat="Server" TargetControlID="pnlD" ExpandControlID="pnlH" CollapseControlID="pnlH" Collapsed="True" TextLabelID="lblH" ImageControlID="imgH" ExpandedText="(Hide Filters...)" CollapsedText="(Show Filters...)" ExpandedImage="~/images/ua.png" CollapsedImage="~/images/da.png" SuppressPostBack="true" />
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
    <asp:AsyncPostBackTrigger ControlID="F_SerialNo" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

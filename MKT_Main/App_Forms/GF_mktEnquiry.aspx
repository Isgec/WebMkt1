<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktEnquiry.aspx.vb" Inherits="GF_mktEnquiry" title="Maintain List: Enquiry" %>
<asp:Content ID="CPHmktEnquiry" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktEnquiry" runat="server" Text="&nbsp;List: Enquiry"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiry" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktEnquiry"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktEnquiry.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktEnquiry.aspx?skip=1"
      ValidationGroup = "mktEnquiry"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktEnquiry" runat="server" AssociatedUpdatePanelID="UPNLmktEnquiry" DisplayAfter="100">
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
          <b><asp:Label ID="L_MktSiteID" runat="server" Text="Site :" /></b>
        </td>
        <td>
          <LGM:LC_mktSites
            ID="F_MktSiteID"
            OrderBy="SiteName"
            DataTextField="SiteName"
            DataValueField="MktSiteID"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            AutoPostBack="true"
            RequiredFieldErrorMessage="<div class='errorLG'>Required!</div>"
            CssClass="myddl"
            Runat="Server" />
          </td>
      </tr>
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktVericalID" runat="server" Text="Marketing Verical :" /></b>
        </td>
        <td>
          <LGM:LC_mktVerticals
            ID="F_MktVericalID"
            OrderBy="VerticalName"
            DataTextField="VerticalName"
            DataValueField="MktVericalID"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            AutoPostBack="true"
            RequiredFieldErrorMessage="<div class='errorLG'>Required!</div>"
            CssClass="myddl"
            Runat="Server" />
          </td>
      </tr>
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_IndianStateID" runat="server" Text="Indian State :" /></b>
        </td>
        <td>
          <LGM:LC_spmtERPStates
            ID="F_IndianStateID"
            OrderBy="Description"
            DataTextField="Description"
            DataValueField="StateID"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            AutoPostBack="true"
            RequiredFieldErrorMessage="<div class='errorLG'>Required!</div>"
            CssClass="myddl"
            Runat="Server" />
          </td>
      </tr>
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_EnquiryTypeID" runat="server" Text="Enquiry Type :" /></b>
        </td>
        <td>
          <LGM:LC_mktEnquiryTypes
            ID="F_EnquiryTypeID"
            OrderBy="EnquiryTypeName"
            DataTextField="EnquiryTypeName"
            DataValueField="EnquiryTypeID"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            AutoPostBack="true"
            RequiredFieldErrorMessage="<div class='errorLG'>Required!</div>"
            CssClass="myddl"
            Runat="Server" />
          </td>
      </tr>
    </table>
    </asp:Panel>
    <AJX:CollapsiblePanelExtender ID="cpe1" runat="Server" TargetControlID="pnlD" ExpandControlID="pnlH" CollapseControlID="pnlH" Collapsed="True" TextLabelID="lblH" ImageControlID="imgH" ExpandedText="(Hide Filters...)" CollapsedText="(Show Filters...)" ExpandedImage="~/images/ua.png" CollapsedImage="~/images/da.png" SuppressPostBack="true" />
    <script type="text/javascript">
      var pcnt = 0;
      function print_report(o) {
        pcnt = pcnt + 1;
        var nam = 'wTask' + pcnt;
        var url = self.location.href.replace('App_Forms/GF_','App_Print/RP_');
        url = url + '?pk=' + o.alt;
        window.open(url, nam, 'left=20,top=20,width=1000,height=600,toolbar=1,resizable=1,scrollbars=1');
        return false;
      }
    </script>
    <asp:GridView ID="GVmktEnquiry" SkinID="gv_silver" runat="server" DataSourceID="ODSmktEnquiry" DataKeyNames="SerialNo">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PRINT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdPrintPage" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText='<%# EVal("PrimaryKey") %>' ToolTip="Print the record." SkinID="Print" OnClientClick="return print_report(this);" />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Serial No" SortExpression="SerialNo">
          <ItemTemplate>
            <asp:Label ID="LabelSerialNo" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("SerialNo") %>'></asp:Label>
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
        <asp:TemplateField HeaderText="Site" SortExpression="MKT_Sites11_SiteName">
          <ItemTemplate>
             <asp:Label ID="L_MktSiteID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Title='<%# EVal("MktSiteID") %>' Text='<%# Eval("MKT_Sites11_SiteName") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Responsible Salse Person" SortExpression="aspnet_users1_UserFullName">
          <ItemTemplate>
             <asp:Label ID="L_ResponsibleSalsePerson" runat="server" ForeColor='<%# EVal("ForeColor") %>' Title='<%# EVal("ResponsibleSalsePerson") %>' Text='<%# Eval("aspnet_users1_UserFullName") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle Width="100px" />
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
        <asp:TemplateField HeaderText="Marketing Verical" SortExpression="MKT_Verticals12_VerticalName">
          <ItemTemplate>
             <asp:Label ID="L_MktVericalID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Title='<%# EVal("MktVericalID") %>' Text='<%# Eval("MKT_Verticals12_VerticalName") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle Width="100px" />
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
      ID = "ODSmktEnquiry"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktEnquiry"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "UZ_mktEnquirySelectList"
      TypeName = "SIS.MKT.mktEnquiry"
      SelectCountMethod = "mktEnquirySelectCount"
      SortParameterName="OrderBy" EnablePaging="True">
      <SelectParameters >
        <asp:ControlParameter ControlID="F_MktSiteID" PropertyName="SelectedValue" Name="MktSiteID" Type="Int32" Size="10" />
        <asp:ControlParameter ControlID="F_MktVericalID" PropertyName="SelectedValue" Name="MktVericalID" Type="Int32" Size="10" />
        <asp:ControlParameter ControlID="F_IndianStateID" PropertyName="SelectedValue" Name="IndianStateID" Type="String" Size="2" />
        <asp:ControlParameter ControlID="F_EnquiryTypeID" PropertyName="SelectedValue" Name="EnquiryTypeID" Type="Int32" Size="10" />
        <asp:Parameter Name="SearchState" Type="Boolean" Direction="Input" DefaultValue="false" />
        <asp:Parameter Name="SearchText" Type="String" Direction="Input" DefaultValue="" />
      </SelectParameters>
    </asp:ObjectDataSource>
    <br />
  </td></tr></table>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="GVmktEnquiry" EventName="PageIndexChanged" />
    <asp:AsyncPostBackTrigger ControlID="F_MktSiteID" />
    <asp:AsyncPostBackTrigger ControlID="F_MktVericalID" />
    <asp:AsyncPostBackTrigger ControlID="F_IndianStateID" />
    <asp:AsyncPostBackTrigger ControlID="F_EnquiryTypeID" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktEnquiryStatus.aspx.vb" Inherits="GF_mktEnquiryStatus" title="Maintain List: Enquiry Status" %>
<asp:Content ID="CPHmktEnquiryStatus" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktEnquiryStatus" runat="server" Text="&nbsp;List: Enquiry Status"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryStatus" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktEnquiryStatus"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktEnquiryStatus.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktEnquiryStatus.aspx"
      ValidationGroup = "mktEnquiryStatus"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktEnquiryStatus" runat="server" AssociatedUpdatePanelID="UPNLmktEnquiryStatus" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktEnquiryStatus" SkinID="gv_silver" runat="server" DataSourceID="ODSmktEnquiryStatus" DataKeyNames="StatusID">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status ID" SortExpression="StatusID">
          <ItemTemplate>
            <asp:Label ID="LabelStatusID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("StatusID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="80px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status Name" SortExpression="StatusName">
          <ItemTemplate>
            <asp:Label ID="LabelStatusName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("StatusName") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="100px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSmktEnquiryStatus"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktEnquiryStatus"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktEnquiryStatusSelectList"
      TypeName = "SIS.MKT.mktEnquiryStatus"
      SelectCountMethod = "mktEnquiryStatusSelectCount"
      SortParameterName="OrderBy" EnablePaging="True">
      <SelectParameters >
        <asp:Parameter Name="SearchState" Type="Boolean" Direction="Input" DefaultValue="false" />
        <asp:Parameter Name="SearchText" Type="String" Direction="Input" DefaultValue="" />
      </SelectParameters>
    </asp:ObjectDataSource>
    <br />
  </td></tr></table>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="GVmktEnquiryStatus" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

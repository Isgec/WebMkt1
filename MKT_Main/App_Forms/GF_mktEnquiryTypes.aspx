<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktEnquiryTypes.aspx.vb" Inherits="GF_mktEnquiryTypes" title="Maintain List: Enquiry Types" %>
<asp:Content ID="CPHmktEnquiryTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktEnquiryTypes" runat="server" Text="&nbsp;List: Enquiry Types"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryTypes" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktEnquiryTypes"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktEnquiryTypes.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktEnquiryTypes.aspx"
      ValidationGroup = "mktEnquiryTypes"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktEnquiryTypes" runat="server" AssociatedUpdatePanelID="UPNLmktEnquiryTypes" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktEnquiryTypes" SkinID="gv_silver" runat="server" DataSourceID="ODSmktEnquiryTypes" DataKeyNames="EnquiryTypeID">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Enquiry Type" SortExpression="EnquiryTypeID">
          <ItemTemplate>
            <asp:Label ID="LabelEnquiryTypeID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("EnquiryTypeID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Enquiry Type Name" SortExpression="EnquiryTypeName">
          <ItemTemplate>
            <asp:Label ID="LabelEnquiryTypeName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("EnquiryTypeName") %>'></asp:Label>
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
      ID = "ODSmktEnquiryTypes"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktEnquiryTypes"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktEnquiryTypesSelectList"
      TypeName = "SIS.MKT.mktEnquiryTypes"
      SelectCountMethod = "mktEnquiryTypesSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVmktEnquiryTypes" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

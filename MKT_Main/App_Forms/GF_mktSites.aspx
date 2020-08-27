<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktSites.aspx.vb" Inherits="GF_mktSites" title="Maintain List: Sites" %>
<asp:Content ID="CPHmktSites" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktSites" runat="server" Text="&nbsp;List: Sites"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktSites" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktSites"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktSites.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktSites.aspx"
      ValidationGroup = "mktSites"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktSites" runat="server" AssociatedUpdatePanelID="UPNLmktSites" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktSites" SkinID="gv_silver" runat="server" DataSourceID="ODSmktSites" DataKeyNames="MktSiteID">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Site ID" SortExpression="MktSiteID">
          <ItemTemplate>
            <asp:Label ID="LabelMktSiteID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("MktSiteID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Site Name" SortExpression="SiteName">
          <ItemTemplate>
            <asp:Label ID="LabelSiteName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("SiteName") %>'></asp:Label>
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
      ID = "ODSmktSites"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktSites"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktSitesSelectList"
      TypeName = "SIS.MKT.mktSites"
      SelectCountMethod = "mktSitesSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVmktSites" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

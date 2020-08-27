<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktRegions.aspx.vb" Inherits="GF_mktRegions" title="Maintain List: Regions" %>
<asp:Content ID="CPHmktRegions" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktRegions" runat="server" Text="&nbsp;List: Regions"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktRegions" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktRegions"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktRegions.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktRegions.aspx"
      ValidationGroup = "mktRegions"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktRegions" runat="server" AssociatedUpdatePanelID="UPNLmktRegions" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktRegions" SkinID="gv_silver" runat="server" DataSourceID="ODSmktRegions" DataKeyNames="MktRegionID">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Region ID" SortExpression="MktRegionID">
          <ItemTemplate>
            <asp:Label ID="LabelMktRegionID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("MktRegionID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Region Name" SortExpression="RegionName">
          <ItemTemplate>
            <asp:Label ID="LabelRegionName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("RegionName") %>'></asp:Label>
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
      ID = "ODSmktRegions"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktRegions"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktRegionsSelectList"
      TypeName = "SIS.MKT.mktRegions"
      SelectCountMethod = "mktRegionsSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVmktRegions" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

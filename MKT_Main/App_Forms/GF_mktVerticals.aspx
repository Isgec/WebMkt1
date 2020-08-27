<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktVerticals.aspx.vb" Inherits="GF_mktVerticals" title="Maintain List: Marketing Verticals" %>
<asp:Content ID="CPHmktVerticals" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktVerticals" runat="server" Text="&nbsp;List: Marketing Verticals"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktVerticals" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktVerticals"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktVerticals.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktVerticals.aspx"
      ValidationGroup = "mktVerticals"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktVerticals" runat="server" AssociatedUpdatePanelID="UPNLmktVerticals" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktVerticals" SkinID="gv_silver" runat="server" DataSourceID="ODSmktVerticals" DataKeyNames="MktVericalID">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Marketing Verical" SortExpression="MktVericalID">
          <ItemTemplate>
            <asp:Label ID="LabelMktVericalID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("MktVericalID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Vertical Name" SortExpression="VerticalName">
          <ItemTemplate>
            <asp:Label ID="LabelVerticalName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("VerticalName") %>'></asp:Label>
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
      ID = "ODSmktVerticals"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktVerticals"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktVerticalsSelectList"
      TypeName = "SIS.MKT.mktVerticals"
      SelectCountMethod = "mktVerticalsSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVmktVerticals" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

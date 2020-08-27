<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktProjectBases.aspx.vb" Inherits="GF_mktProjectBases" title="Maintain List: Project Bases" %>
<asp:Content ID="CPHmktProjectBases" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktProjectBases" runat="server" Text="&nbsp;List: Project Bases"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktProjectBases" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktProjectBases"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktProjectBases.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktProjectBases.aspx"
      ValidationGroup = "mktProjectBases"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktProjectBases" runat="server" AssociatedUpdatePanelID="UPNLmktProjectBases" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktProjectBases" SkinID="gv_silver" runat="server" DataSourceID="ODSmktProjectBases" DataKeyNames="ProjectBaseID">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Project Base" SortExpression="ProjectBaseID">
          <ItemTemplate>
            <asp:Label ID="LabelProjectBaseID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("ProjectBaseID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Base Name" SortExpression="BaseName">
          <ItemTemplate>
            <asp:Label ID="LabelBaseName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("BaseName") %>'></asp:Label>
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
      ID = "ODSmktProjectBases"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktProjectBases"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktProjectBasesSelectList"
      TypeName = "SIS.MKT.mktProjectBases"
      SelectCountMethod = "mktProjectBasesSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVmktProjectBases" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

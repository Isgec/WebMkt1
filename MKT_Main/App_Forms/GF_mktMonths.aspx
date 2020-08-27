<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktMonths.aspx.vb" Inherits="GF_mktMonths" title="Maintain List: Months" %>
<asp:Content ID="CPHmktMonths" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktMonths" runat="server" Text="&nbsp;List: Months"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktMonths" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktMonths"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktMonths.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktMonths.aspx"
      ValidationGroup = "mktMonths"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktMonths" runat="server" AssociatedUpdatePanelID="UPNLmktMonths" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktMonths" SkinID="gv_silver" runat="server" DataSourceID="ODSmktMonths" DataKeyNames="MktMonthID">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Month" SortExpression="MktMonthID">
          <ItemTemplate>
            <asp:Label ID="LabelMktMonthID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("MktMonthID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="80px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Month Name" SortExpression="MonthName">
          <ItemTemplate>
            <asp:Label ID="LabelMonthName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("MonthName") %>'></asp:Label>
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
      ID = "ODSmktMonths"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktMonths"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktMonthsSelectList"
      TypeName = "SIS.MKT.mktMonths"
      SelectCountMethod = "mktMonthsSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVmktMonths" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

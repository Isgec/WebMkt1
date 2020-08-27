<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_mktBidderTypes.aspx.vb" Inherits="GF_mktBidderTypes" title="Maintain List: Bidder Types" %>
<asp:Content ID="CPHmktBidderTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelmktBidderTypes" runat="server" Text="&nbsp;List: Bidder Types"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLmktBidderTypes" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLmktBidderTypes"
      ToolType = "lgNMGrid"
      EditUrl = "~/MKT_Main/App_Edit/EF_mktBidderTypes.aspx"
      AddUrl = "~/MKT_Main/App_Create/AF_mktBidderTypes.aspx"
      ValidationGroup = "mktBidderTypes"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSmktBidderTypes" runat="server" AssociatedUpdatePanelID="UPNLmktBidderTypes" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVmktBidderTypes" SkinID="gv_silver" runat="server" DataSourceID="ODSmktBidderTypes" DataKeyNames="BidderTypeID">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Bidder Type" SortExpression="BidderTypeID">
          <ItemTemplate>
            <asp:Label ID="LabelBidderTypeID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("BidderTypeID") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Bidder Type Name" SortExpression="BidderName">
          <ItemTemplate>
            <asp:Label ID="LabelBidderName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("BidderName") %>'></asp:Label>
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
      ID = "ODSmktBidderTypes"
      runat = "server"
      DataObjectTypeName = "SIS.MKT.mktBidderTypes"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "mktBidderTypesSelectList"
      TypeName = "SIS.MKT.mktBidderTypes"
      SelectCountMethod = "mktBidderTypesSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVmktBidderTypes" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>

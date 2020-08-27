<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktSites.aspx.vb" Inherits="AF_mktSites" title="Add: Sites" %>
<asp:Content ID="CPHmktSites" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktSites" runat="server" Text="&nbsp;Add: Sites"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktSites" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktSites"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktSites"
    runat = "server" />
<asp:FormView ID="FVmktSites"
  runat = "server"
  DataKeyNames = "MktSiteID"
  DataSourceID = "ODSmktSites"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktSites" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktSiteID" ForeColor="#CC6633" runat="server" Text="Site ID :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktSiteID" Enabled="False" CssClass="mypktxt" Width="88px" runat="server" Text="0" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_SiteName" runat="server" Text="Site Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SiteName"
            Text='<%# Bind("SiteName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktSites"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Site Name."
            MaxLength="50"
            Width="408px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVSiteName"
            runat = "server"
            ControlToValidate = "F_SiteName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktSites"
            SetFocusOnError="true" />
        </td>
      </tr>
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktSites"
  DataObjectTypeName = "SIS.MKT.mktSites"
  InsertMethod="mktSitesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktSites"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

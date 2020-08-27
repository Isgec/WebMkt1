<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktSites.aspx.vb" Inherits="EF_mktSites" title="Edit: Sites" %>
<asp:Content ID="CPHmktSites" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktSites" runat="server" Text="&nbsp;Edit: Sites"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktSites" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktSites"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktSites"
    runat = "server" />
<asp:FormView ID="FVmktSites"
  runat = "server"
  DataKeyNames = "MktSiteID"
  DataSourceID = "ODSmktSites"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktSiteID" runat="server" ForeColor="#CC6633" Text="Site ID :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktSiteID"
            Text='<%# Bind("MktSiteID") %>'
            ToolTip="Value of Site ID."
            Enabled = "False"
            CssClass = "mypktxt"
            Width="88px"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_SiteName" runat="server" Text="Site Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SiteName"
            Text='<%# Bind("SiteName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktSites"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Site Name."
            MaxLength="50"
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
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktSites"
  DataObjectTypeName = "SIS.MKT.mktSites"
  SelectMethod = "mktSitesGetByID"
  UpdateMethod="mktSitesUpdate"
  DeleteMethod="mktSitesDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktSites"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="MktSiteID" Name="MktSiteID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

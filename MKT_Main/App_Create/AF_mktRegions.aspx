<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktRegions.aspx.vb" Inherits="AF_mktRegions" title="Add: Regions" %>
<asp:Content ID="CPHmktRegions" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktRegions" runat="server" Text="&nbsp;Add: Regions"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktRegions" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktRegions"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktRegions"
    runat = "server" />
<asp:FormView ID="FVmktRegions"
  runat = "server"
  DataKeyNames = "MktRegionID"
  DataSourceID = "ODSmktRegions"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktRegions" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktRegionID" ForeColor="#CC6633" runat="server" Text="Region ID :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktRegionID" Enabled="False" CssClass="mypktxt" Width="88px" runat="server" Text="0" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_RegionName" runat="server" Text="Region Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_RegionName"
            Text='<%# Bind("RegionName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktRegions"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Region Name."
            MaxLength="50"
            Width="408px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVRegionName"
            runat = "server"
            ControlToValidate = "F_RegionName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktRegions"
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
  ID = "ODSmktRegions"
  DataObjectTypeName = "SIS.MKT.mktRegions"
  InsertMethod="mktRegionsInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktRegions"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

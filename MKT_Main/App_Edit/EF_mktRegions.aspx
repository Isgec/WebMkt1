<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktRegions.aspx.vb" Inherits="EF_mktRegions" title="Edit: Regions" %>
<asp:Content ID="CPHmktRegions" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktRegions" runat="server" Text="&nbsp;Edit: Regions"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktRegions" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktRegions"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktRegions"
    runat = "server" />
<asp:FormView ID="FVmktRegions"
  runat = "server"
  DataKeyNames = "MktRegionID"
  DataSourceID = "ODSmktRegions"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktRegionID" runat="server" ForeColor="#CC6633" Text="Region ID :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktRegionID"
            Text='<%# Bind("MktRegionID") %>'
            ToolTip="Value of Region ID."
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
          <asp:Label ID="L_RegionName" runat="server" Text="Region Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_RegionName"
            Text='<%# Bind("RegionName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktRegions"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Region Name."
            MaxLength="50"
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
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktRegions"
  DataObjectTypeName = "SIS.MKT.mktRegions"
  SelectMethod = "mktRegionsGetByID"
  UpdateMethod="mktRegionsUpdate"
  DeleteMethod="mktRegionsDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktRegions"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="MktRegionID" Name="MktRegionID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

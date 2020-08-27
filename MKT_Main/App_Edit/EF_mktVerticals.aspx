<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktVerticals.aspx.vb" Inherits="EF_mktVerticals" title="Edit: Marketing Verticals" %>
<asp:Content ID="CPHmktVerticals" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktVerticals" runat="server" Text="&nbsp;Edit: Marketing Verticals"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktVerticals" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktVerticals"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktVerticals"
    runat = "server" />
<asp:FormView ID="FVmktVerticals"
  runat = "server"
  DataKeyNames = "MktVericalID"
  DataSourceID = "ODSmktVerticals"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktVericalID" runat="server" ForeColor="#CC6633" Text="Marketing Verical :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktVericalID"
            Text='<%# Bind("MktVericalID") %>'
            ToolTip="Value of Marketing Verical."
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
          <asp:Label ID="L_VerticalName" runat="server" Text="Vertical Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_VerticalName"
            Text='<%# Bind("VerticalName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktVerticals"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Vertical Name."
            MaxLength="50"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVVerticalName"
            runat = "server"
            ControlToValidate = "F_VerticalName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktVerticals"
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
  ID = "ODSmktVerticals"
  DataObjectTypeName = "SIS.MKT.mktVerticals"
  SelectMethod = "mktVerticalsGetByID"
  UpdateMethod="mktVerticalsUpdate"
  DeleteMethod="mktVerticalsDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktVerticals"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="MktVericalID" Name="MktVericalID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

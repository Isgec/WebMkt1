<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktVerticals.aspx.vb" Inherits="AF_mktVerticals" title="Add: Marketing Verticals" %>
<asp:Content ID="CPHmktVerticals" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktVerticals" runat="server" Text="&nbsp;Add: Marketing Verticals"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktVerticals" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktVerticals"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktVerticals"
    runat = "server" />
<asp:FormView ID="FVmktVerticals"
  runat = "server"
  DataKeyNames = "MktVericalID"
  DataSourceID = "ODSmktVerticals"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktVerticals" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktVericalID" ForeColor="#CC6633" runat="server" Text="Marketing Verical :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktVericalID" Enabled="False" CssClass="mypktxt" Width="88px" runat="server" Text="0" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_VerticalName" runat="server" Text="Vertical Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_VerticalName"
            Text='<%# Bind("VerticalName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktVerticals"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Vertical Name."
            MaxLength="50"
            Width="408px"
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
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktVerticals"
  DataObjectTypeName = "SIS.MKT.mktVerticals"
  InsertMethod="mktVerticalsInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktVerticals"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktBidderTypes.aspx.vb" Inherits="EF_mktBidderTypes" title="Edit: Bidder Types" %>
<asp:Content ID="CPHmktBidderTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktBidderTypes" runat="server" Text="&nbsp;Edit: Bidder Types"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktBidderTypes" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktBidderTypes"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktBidderTypes"
    runat = "server" />
<asp:FormView ID="FVmktBidderTypes"
  runat = "server"
  DataKeyNames = "BidderTypeID"
  DataSourceID = "ODSmktBidderTypes"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_BidderTypeID" runat="server" ForeColor="#CC6633" Text="Bidder Type :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BidderTypeID"
            Text='<%# Bind("BidderTypeID") %>'
            ToolTip="Value of Bidder Type."
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
          <asp:Label ID="L_BidderName" runat="server" Text="Bidder Type Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BidderName"
            Text='<%# Bind("BidderName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktBidderTypes"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Bidder Type Name."
            MaxLength="50"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVBidderName"
            runat = "server"
            ControlToValidate = "F_BidderName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktBidderTypes"
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
  ID = "ODSmktBidderTypes"
  DataObjectTypeName = "SIS.MKT.mktBidderTypes"
  SelectMethod = "mktBidderTypesGetByID"
  UpdateMethod="mktBidderTypesUpdate"
  DeleteMethod="mktBidderTypesDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktBidderTypes"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="BidderTypeID" Name="BidderTypeID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktBidderTypes.aspx.vb" Inherits="AF_mktBidderTypes" title="Add: Bidder Types" %>
<asp:Content ID="CPHmktBidderTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktBidderTypes" runat="server" Text="&nbsp;Add: Bidder Types"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktBidderTypes" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktBidderTypes"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktBidderTypes"
    runat = "server" />
<asp:FormView ID="FVmktBidderTypes"
  runat = "server"
  DataKeyNames = "BidderTypeID"
  DataSourceID = "ODSmktBidderTypes"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktBidderTypes" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_BidderTypeID" ForeColor="#CC6633" runat="server" Text="Bidder Type :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BidderTypeID" Enabled="False" CssClass="mypktxt" Width="88px" runat="server" Text="0" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_BidderName" runat="server" Text="Bidder Type Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BidderName"
            Text='<%# Bind("BidderName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktBidderTypes"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Bidder Type Name."
            MaxLength="50"
            Width="408px"
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
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktBidderTypes"
  DataObjectTypeName = "SIS.MKT.mktBidderTypes"
  InsertMethod="mktBidderTypesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktBidderTypes"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

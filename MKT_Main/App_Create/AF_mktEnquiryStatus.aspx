<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktEnquiryStatus.aspx.vb" Inherits="AF_mktEnquiryStatus" title="Add: Enquiry Status" %>
<asp:Content ID="CPHmktEnquiryStatus" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktEnquiryStatus" runat="server" Text="&nbsp;Add: Enquiry Status"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryStatus" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktEnquiryStatus"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktEnquiryStatus"
    runat = "server" />
<asp:FormView ID="FVmktEnquiryStatus"
  runat = "server"
  DataKeyNames = "StatusID"
  DataSourceID = "ODSmktEnquiryStatus"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktEnquiryStatus" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_StatusID" ForeColor="#CC6633" runat="server" Text="Status ID :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_StatusID"
            Text='<%# Bind("StatusID") %>'
            Width="88px"
            style="text-align: Right"
            CssClass = "mypktxt"
            ValidationGroup="mktEnquiryStatus"
            MaxLength="10"
            onfocus = "return this.select();"
            runat="server" />
          <AJX:MaskedEditExtender 
            ID = "MEEStatusID"
            runat = "server"
            mask = "9999999999"
            AcceptNegative = "Left"
            MaskType="Number"
            MessageValidatorTip="true"
            InputDirection="RightToLeft"
            ErrorTooltipEnabled="true"
            TargetControlID="F_StatusID" />
          <AJX:MaskedEditValidator 
            ID = "MEVStatusID"
            runat = "server"
            ControlToValidate = "F_StatusID"
            ControlExtender = "MEEStatusID"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktEnquiryStatus"
            IsValidEmpty = "false"
            MinimumValue = "1"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_StatusName" runat="server" Text="Status Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_StatusName"
            Text='<%# Bind("StatusName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktEnquiryStatus"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Status Name."
            MaxLength="50"
            Width="408px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVStatusName"
            runat = "server"
            ControlToValidate = "F_StatusName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktEnquiryStatus"
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
  ID = "ODSmktEnquiryStatus"
  DataObjectTypeName = "SIS.MKT.mktEnquiryStatus"
  InsertMethod="mktEnquiryStatusInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktEnquiryStatus"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktMonths.aspx.vb" Inherits="AF_mktMonths" title="Add: Months" %>
<asp:Content ID="CPHmktMonths" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktMonths" runat="server" Text="&nbsp;Add: Months"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktMonths" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktMonths"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktMonths"
    runat = "server" />
<asp:FormView ID="FVmktMonths"
  runat = "server"
  DataKeyNames = "MktMonthID"
  DataSourceID = "ODSmktMonths"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktMonths" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktMonthID" ForeColor="#CC6633" runat="server" Text="Month :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktMonthID"
            Text='<%# Bind("MktMonthID") %>'
            Width="88px"
            style="text-align: Right"
            CssClass = "mypktxt"
            ValidationGroup="mktMonths"
            MaxLength="10"
            onfocus = "return this.select();"
            runat="server" />
          <AJX:MaskedEditExtender 
            ID = "MEEMktMonthID"
            runat = "server"
            mask = "9999999999"
            AcceptNegative = "Left"
            MaskType="Number"
            MessageValidatorTip="true"
            InputDirection="RightToLeft"
            ErrorTooltipEnabled="true"
            TargetControlID="F_MktMonthID" />
          <AJX:MaskedEditValidator 
            ID = "MEVMktMonthID"
            runat = "server"
            ControlToValidate = "F_MktMonthID"
            ControlExtender = "MEEMktMonthID"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktMonths"
            IsValidEmpty = "false"
            MinimumValue = "1"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_MonthName" runat="server" Text="Month Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MonthName"
            Text='<%# Bind("MonthName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktMonths"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Month Name."
            MaxLength="50"
            Width="408px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVMonthName"
            runat = "server"
            ControlToValidate = "F_MonthName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktMonths"
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
  ID = "ODSmktMonths"
  DataObjectTypeName = "SIS.MKT.mktMonths"
  InsertMethod="mktMonthsInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktMonths"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

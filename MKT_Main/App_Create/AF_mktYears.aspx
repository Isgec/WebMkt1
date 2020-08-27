<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktYears.aspx.vb" Inherits="AF_mktYears" title="Add: Years" %>
<asp:Content ID="CPHmktYears" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktYears" runat="server" Text="&nbsp;Add: Years"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktYears" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktYears"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktYears"
    runat = "server" />
<asp:FormView ID="FVmktYears"
  runat = "server"
  DataKeyNames = "MktYearID"
  DataSourceID = "ODSmktYears"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktYears" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktYearID" ForeColor="#CC6633" runat="server" Text="Year :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktYearID"
            Text='<%# Bind("MktYearID") %>'
            Width="88px"
            style="text-align: Right"
            CssClass = "mypktxt"
            ValidationGroup="mktYears"
            MaxLength="10"
            onfocus = "return this.select();"
            runat="server" />
          <AJX:MaskedEditExtender 
            ID = "MEEMktYearID"
            runat = "server"
            mask = "9999999999"
            AcceptNegative = "Left"
            MaskType="Number"
            MessageValidatorTip="true"
            InputDirection="RightToLeft"
            ErrorTooltipEnabled="true"
            TargetControlID="F_MktYearID" />
          <AJX:MaskedEditValidator 
            ID = "MEVMktYearID"
            runat = "server"
            ControlToValidate = "F_MktYearID"
            ControlExtender = "MEEMktYearID"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktYears"
            IsValidEmpty = "false"
            MinimumValue = "1"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_YearName" runat="server" Text="Description :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_YearName"
            Text='<%# Bind("YearName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktYears"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Description."
            MaxLength="50"
            Width="408px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVYearName"
            runat = "server"
            ControlToValidate = "F_YearName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktYears"
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
  ID = "ODSmktYears"
  DataObjectTypeName = "SIS.MKT.mktYears"
  InsertMethod="mktYearsInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktYears"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

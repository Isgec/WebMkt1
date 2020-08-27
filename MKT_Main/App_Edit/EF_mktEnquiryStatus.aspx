<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktEnquiryStatus.aspx.vb" Inherits="EF_mktEnquiryStatus" title="Edit: Enquiry Status" %>
<asp:Content ID="CPHmktEnquiryStatus" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktEnquiryStatus" runat="server" Text="&nbsp;Edit: Enquiry Status"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryStatus" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktEnquiryStatus"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktEnquiryStatus"
    runat = "server" />
<asp:FormView ID="FVmktEnquiryStatus"
  runat = "server"
  DataKeyNames = "StatusID"
  DataSourceID = "ODSmktEnquiryStatus"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_StatusID" runat="server" ForeColor="#CC6633" Text="Status ID :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_StatusID"
            Text='<%# Bind("StatusID") %>'
            ToolTip="Value of Status ID."
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
          <asp:Label ID="L_StatusName" runat="server" Text="Status Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_StatusName"
            Text='<%# Bind("StatusName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktEnquiryStatus"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Status Name."
            MaxLength="50"
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
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktEnquiryStatus"
  DataObjectTypeName = "SIS.MKT.mktEnquiryStatus"
  SelectMethod = "mktEnquiryStatusGetByID"
  UpdateMethod="mktEnquiryStatusUpdate"
  DeleteMethod="mktEnquiryStatusDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktEnquiryStatus"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="StatusID" Name="StatusID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

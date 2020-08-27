<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktEnquiryTypes.aspx.vb" Inherits="EF_mktEnquiryTypes" title="Edit: Enquiry Types" %>
<asp:Content ID="CPHmktEnquiryTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktEnquiryTypes" runat="server" Text="&nbsp;Edit: Enquiry Types"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryTypes" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktEnquiryTypes"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktEnquiryTypes"
    runat = "server" />
<asp:FormView ID="FVmktEnquiryTypes"
  runat = "server"
  DataKeyNames = "EnquiryTypeID"
  DataSourceID = "ODSmktEnquiryTypes"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_EnquiryTypeID" runat="server" ForeColor="#CC6633" Text="Enquiry Type :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EnquiryTypeID"
            Text='<%# Bind("EnquiryTypeID") %>'
            ToolTip="Value of Enquiry Type."
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
          <asp:Label ID="L_EnquiryTypeName" runat="server" Text="Enquiry Type Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EnquiryTypeName"
            Text='<%# Bind("EnquiryTypeName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktEnquiryTypes"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Enquiry Type Name."
            MaxLength="50"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVEnquiryTypeName"
            runat = "server"
            ControlToValidate = "F_EnquiryTypeName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktEnquiryTypes"
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
  ID = "ODSmktEnquiryTypes"
  DataObjectTypeName = "SIS.MKT.mktEnquiryTypes"
  SelectMethod = "mktEnquiryTypesGetByID"
  UpdateMethod="mktEnquiryTypesUpdate"
  DeleteMethod="mktEnquiryTypesDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktEnquiryTypes"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="EnquiryTypeID" Name="EnquiryTypeID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

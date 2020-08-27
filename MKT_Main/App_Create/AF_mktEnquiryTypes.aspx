<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktEnquiryTypes.aspx.vb" Inherits="AF_mktEnquiryTypes" title="Add: Enquiry Types" %>
<asp:Content ID="CPHmktEnquiryTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktEnquiryTypes" runat="server" Text="&nbsp;Add: Enquiry Types"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktEnquiryTypes" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktEnquiryTypes"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktEnquiryTypes"
    runat = "server" />
<asp:FormView ID="FVmktEnquiryTypes"
  runat = "server"
  DataKeyNames = "EnquiryTypeID"
  DataSourceID = "ODSmktEnquiryTypes"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktEnquiryTypes" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_EnquiryTypeID" ForeColor="#CC6633" runat="server" Text="Enquiry Type :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EnquiryTypeID" Enabled="False" CssClass="mypktxt" Width="88px" runat="server" Text="0" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EnquiryTypeName" runat="server" Text="Enquiry Type Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EnquiryTypeName"
            Text='<%# Bind("EnquiryTypeName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktEnquiryTypes"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Enquiry Type Name."
            MaxLength="50"
            Width="408px"
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
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktEnquiryTypes"
  DataObjectTypeName = "SIS.MKT.mktEnquiryTypes"
  InsertMethod="mktEnquiryTypesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktEnquiryTypes"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktEnquiry.ascx.vb" Inherits="LC_mktEnquiry" %>
<asp:DropDownList 
  ID = "DDLmktEnquiry"
  DataSourceID = "OdsDdlmktEnquiry"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktEnquiry"
  Runat = "server" 
  ControlToValidate = "DDLmktEnquiry"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktEnquiry"
  TypeName = "SIS.MKT.mktEnquiry"
  SortParameterName = "OrderBy"
  SelectMethod = "mktEnquirySelectList"
  Runat="server" />

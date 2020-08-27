<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktEnquiryStatus.ascx.vb" Inherits="LC_mktEnquiryStatus" %>
<asp:DropDownList 
  ID = "DDLmktEnquiryStatus"
  DataSourceID = "OdsDdlmktEnquiryStatus"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktEnquiryStatus"
  Runat = "server" 
  ControlToValidate = "DDLmktEnquiryStatus"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktEnquiryStatus"
  TypeName = "SIS.MKT.mktEnquiryStatus"
  SortParameterName = "OrderBy"
  SelectMethod = "mktEnquiryStatusSelectList"
  Runat="server" />

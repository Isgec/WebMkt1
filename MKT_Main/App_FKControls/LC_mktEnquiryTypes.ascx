<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktEnquiryTypes.ascx.vb" Inherits="LC_mktEnquiryTypes" %>
<asp:DropDownList 
  ID = "DDLmktEnquiryTypes"
  DataSourceID = "OdsDdlmktEnquiryTypes"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktEnquiryTypes"
  Runat = "server" 
  ControlToValidate = "DDLmktEnquiryTypes"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktEnquiryTypes"
  TypeName = "SIS.MKT.mktEnquiryTypes"
  SortParameterName = "OrderBy"
  SelectMethod = "mktEnquiryTypesSelectList"
  Runat="server" />

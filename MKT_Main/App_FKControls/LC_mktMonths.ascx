<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktMonths.ascx.vb" Inherits="LC_mktMonths" %>
<asp:DropDownList 
  ID = "DDLmktMonths"
  DataSourceID = "OdsDdlmktMonths"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktMonths"
  Runat = "server" 
  ControlToValidate = "DDLmktMonths"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktMonths"
  TypeName = "SIS.MKT.mktMonths"
  SortParameterName = "OrderBy"
  SelectMethod = "mktMonthsSelectList"
  Runat="server" />

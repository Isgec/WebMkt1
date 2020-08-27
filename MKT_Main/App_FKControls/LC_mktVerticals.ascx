<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktVerticals.ascx.vb" Inherits="LC_mktVerticals" %>
<asp:DropDownList 
  ID = "DDLmktVerticals"
  DataSourceID = "OdsDdlmktVerticals"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktVerticals"
  Runat = "server" 
  ControlToValidate = "DDLmktVerticals"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktVerticals"
  TypeName = "SIS.MKT.mktVerticals"
  SortParameterName = "OrderBy"
  SelectMethod = "mktVerticalsSelectList"
  Runat="server" />

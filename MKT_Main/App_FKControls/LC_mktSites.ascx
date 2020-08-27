<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktSites.ascx.vb" Inherits="LC_mktSites" %>
<asp:DropDownList 
  ID = "DDLmktSites"
  DataSourceID = "OdsDdlmktSites"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktSites"
  Runat = "server" 
  ControlToValidate = "DDLmktSites"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktSites"
  TypeName = "SIS.MKT.mktSites"
  SortParameterName = "OrderBy"
  SelectMethod = "mktSitesSelectList"
  Runat="server" />

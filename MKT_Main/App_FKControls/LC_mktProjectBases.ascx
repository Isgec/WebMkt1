<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktProjectBases.ascx.vb" Inherits="LC_mktProjectBases" %>
<asp:DropDownList 
  ID = "DDLmktProjectBases"
  DataSourceID = "OdsDdlmktProjectBases"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktProjectBases"
  Runat = "server" 
  ControlToValidate = "DDLmktProjectBases"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktProjectBases"
  TypeName = "SIS.MKT.mktProjectBases"
  SortParameterName = "OrderBy"
  SelectMethod = "mktProjectBasesSelectList"
  Runat="server" />

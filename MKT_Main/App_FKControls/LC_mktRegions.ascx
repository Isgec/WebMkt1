<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktRegions.ascx.vb" Inherits="LC_mktRegions" %>
<asp:DropDownList 
  ID = "DDLmktRegions"
  DataSourceID = "OdsDdlmktRegions"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktRegions"
  Runat = "server" 
  ControlToValidate = "DDLmktRegions"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktRegions"
  TypeName = "SIS.MKT.mktRegions"
  SortParameterName = "OrderBy"
  SelectMethod = "mktRegionsSelectList"
  Runat="server" />

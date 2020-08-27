<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktBidderTypes.ascx.vb" Inherits="LC_mktBidderTypes" %>
<asp:DropDownList 
  ID = "DDLmktBidderTypes"
  DataSourceID = "OdsDdlmktBidderTypes"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktBidderTypes"
  Runat = "server" 
  ControlToValidate = "DDLmktBidderTypes"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktBidderTypes"
  TypeName = "SIS.MKT.mktBidderTypes"
  SortParameterName = "OrderBy"
  SelectMethod = "mktBidderTypesSelectList"
  Runat="server" />

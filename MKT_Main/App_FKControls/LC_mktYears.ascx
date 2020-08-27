<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_mktYears.ascx.vb" Inherits="LC_mktYears" %>
<asp:DropDownList 
  ID = "DDLmktYears"
  DataSourceID = "OdsDdlmktYears"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatormktYears"
  Runat = "server" 
  ControlToValidate = "DDLmktYears"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlmktYears"
  TypeName = "SIS.MKT.mktYears"
  SortParameterName = "OrderBy"
  SelectMethod = "mktYearsSelectList"
  Runat="server" />

<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" ClientIDMode="Static" AutoEventWireup="false" CodeFile="AF_mktSalesPersons.aspx.vb" Inherits="AF_mktSalesPersons" title="Add: Sales Persons List" %>
<asp:Content ID="CPHmktSalesPersons" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktSalesPersons" runat="server" Text="&nbsp;Add: Sales Persons List"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktSalesPersons" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktSalesPersons"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktSalesPersons"
    runat = "server" />
<asp:FormView ID="FVmktSalesPersons"
  runat = "server"
  DataKeyNames = "SerialNo,SalesPerson"
  DataSourceID = "ODSmktSalesPersons"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktSalesPersons" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SerialNo" ForeColor="#CC6633" runat="server" Text="Serial No :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_SerialNo"
            CssClass = "mypktxt"
            Width="88px"
            Text='<%# Bind("SerialNo") %>'
            AutoCompleteType = "None"
            onfocus = "return this.select();"
            ToolTip="Enter value for Serial No."
            ValidationGroup = "mktSalesPersons"
            onblur= "script_mktSalesPersons.validate_SerialNo(this);"
            Runat="Server" />
          <asp:RequiredFieldValidator 
            ID = "RFVSerialNo"
            runat = "server"
            ControlToValidate = "F_SerialNo"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktSalesPersons"
            SetFocusOnError="true" />
          <asp:Label
            ID = "F_SerialNo_Display"
            Text='<%# Eval("MKT_Enquiry2_ProspectNo") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACESerialNo"
            BehaviorID="B_ACESerialNo"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="SerialNoCompletionList"
            TargetControlID="F_SerialNo"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_mktSalesPersons.ACESerialNo_Selected"
            OnClientPopulating="script_mktSalesPersons.ACESerialNo_Populating"
            OnClientPopulated="script_mktSalesPersons.ACESerialNo_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SalesPerson" ForeColor="#CC6633" runat="server" Text="Sales Person :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_SalesPerson"
            CssClass = "mypktxt"
            Width="72px"
            Text='<%# Bind("SalesPerson") %>'
            AutoCompleteType = "None"
            onfocus = "return this.select();"
            ToolTip="Enter value for Sales Person."
            ValidationGroup = "mktSalesPersons"
            onblur= "script_mktSalesPersons.validate_SalesPerson(this);"
            Runat="Server" />
          <asp:RequiredFieldValidator 
            ID = "RFVSalesPerson"
            runat = "server"
            ControlToValidate = "F_SalesPerson"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktSalesPersons"
            SetFocusOnError="true" />
          <asp:Label
            ID = "F_SalesPerson_Display"
            Text='<%# Eval("aspnet_users1_UserFullName") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACESalesPerson"
            BehaviorID="B_ACESalesPerson"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="SalesPersonCompletionList"
            TargetControlID="F_SalesPerson"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_mktSalesPersons.ACESalesPerson_Selected"
            OnClientPopulating="script_mktSalesPersons.ACESalesPerson_Populating"
            OnClientPopulated="script_mktSalesPersons.ACESalesPerson_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktSalesPersons"
  DataObjectTypeName = "SIS.MKT.mktSalesPersons"
  InsertMethod="mktSalesPersonsInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktSalesPersons"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

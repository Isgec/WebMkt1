<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" ClientIDMode="Static" AutoEventWireup="false" CodeFile="EF_mktSalesPersons.aspx.vb" Inherits="EF_mktSalesPersons" title="Edit: Sales Persons List" %>
<asp:Content ID="CPHmktSalesPersons" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktSalesPersons" runat="server" Text="&nbsp;Edit: Sales Persons List"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktSalesPersons" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktSalesPersons"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktSalesPersons"
    runat = "server" />
<asp:FormView ID="FVmktSalesPersons"
  runat = "server"
  DataKeyNames = "SerialNo,SalesPerson"
  DataSourceID = "ODSmktSalesPersons"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SerialNo" runat="server" ForeColor="#CC6633" Text="Serial No :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_SerialNo"
            Width="88px"
            Text='<%# Bind("SerialNo") %>'
            CssClass = "mypktxt"
            Enabled = "False"
            ToolTip="Value of Serial No."
            Runat="Server" />
          <asp:Label
            ID = "F_SerialNo_Display"
            Text='<%# Eval("MKT_Enquiry2_ProspectNo") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SalesPerson" runat="server" ForeColor="#CC6633" Text="Sales Person :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_SalesPerson"
            Width="72px"
            Text='<%# Bind("SalesPerson") %>'
            CssClass = "mypktxt"
            Enabled = "False"
            ToolTip="Value of Sales Person."
            Runat="Server" />
          <asp:Label
            ID = "F_SalesPerson_Display"
            Text='<%# Eval("aspnet_users1_UserFullName") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktSalesPersons"
  DataObjectTypeName = "SIS.MKT.mktSalesPersons"
  SelectMethod = "mktSalesPersonsGetByID"
  UpdateMethod="mktSalesPersonsUpdate"
  DeleteMethod="mktSalesPersonsDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktSalesPersons"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="SerialNo" Name="SerialNo" Type="Int32" />
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="SalesPerson" Name="SalesPerson" Type="String" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

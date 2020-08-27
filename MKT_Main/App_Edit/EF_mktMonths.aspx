<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktMonths.aspx.vb" Inherits="EF_mktMonths" title="Edit: Months" %>
<asp:Content ID="CPHmktMonths" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktMonths" runat="server" Text="&nbsp;Edit: Months"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktMonths" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktMonths"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktMonths"
    runat = "server" />
<asp:FormView ID="FVmktMonths"
  runat = "server"
  DataKeyNames = "MktMonthID"
  DataSourceID = "ODSmktMonths"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktMonthID" runat="server" ForeColor="#CC6633" Text="Month :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktMonthID"
            Text='<%# Bind("MktMonthID") %>'
            ToolTip="Value of Month."
            Enabled = "False"
            CssClass = "mypktxt"
            Width="88px"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_MonthName" runat="server" Text="Month Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MonthName"
            Text='<%# Bind("MonthName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktMonths"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Month Name."
            MaxLength="50"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVMonthName"
            runat = "server"
            ControlToValidate = "F_MonthName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktMonths"
            SetFocusOnError="true" />
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
  ID = "ODSmktMonths"
  DataObjectTypeName = "SIS.MKT.mktMonths"
  SelectMethod = "mktMonthsGetByID"
  UpdateMethod="mktMonthsUpdate"
  DeleteMethod="mktMonthsDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktMonths"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="MktMonthID" Name="MktMonthID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

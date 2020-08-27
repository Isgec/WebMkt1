<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktYears.aspx.vb" Inherits="EF_mktYears" title="Edit: Years" %>
<asp:Content ID="CPHmktYears" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktYears" runat="server" Text="&nbsp;Edit: Years"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktYears" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktYears"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktYears"
    runat = "server" />
<asp:FormView ID="FVmktYears"
  runat = "server"
  DataKeyNames = "MktYearID"
  DataSourceID = "ODSmktYears"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_MktYearID" runat="server" ForeColor="#CC6633" Text="Year :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_MktYearID"
            Text='<%# Bind("MktYearID") %>'
            ToolTip="Value of Year."
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
          <asp:Label ID="L_YearName" runat="server" Text="Description :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_YearName"
            Text='<%# Bind("YearName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktYears"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Description."
            MaxLength="50"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVYearName"
            runat = "server"
            ControlToValidate = "F_YearName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktYears"
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
  ID = "ODSmktYears"
  DataObjectTypeName = "SIS.MKT.mktYears"
  SelectMethod = "mktYearsGetByID"
  UpdateMethod="mktYearsUpdate"
  DeleteMethod="mktYearsDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktYears"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="MktYearID" Name="MktYearID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

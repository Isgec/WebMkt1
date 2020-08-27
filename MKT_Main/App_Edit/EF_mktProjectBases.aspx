<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_mktProjectBases.aspx.vb" Inherits="EF_mktProjectBases" title="Edit: Project Bases" %>
<asp:Content ID="CPHmktProjectBases" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktProjectBases" runat="server" Text="&nbsp;Edit: Project Bases"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktProjectBases" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktProjectBases"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "mktProjectBases"
    runat = "server" />
<asp:FormView ID="FVmktProjectBases"
  runat = "server"
  DataKeyNames = "ProjectBaseID"
  DataSourceID = "ODSmktProjectBases"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_ProjectBaseID" runat="server" ForeColor="#CC6633" Text="Project Base :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProjectBaseID"
            Text='<%# Bind("ProjectBaseID") %>'
            ToolTip="Value of Project Base."
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
          <asp:Label ID="L_BaseName" runat="server" Text="Base Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BaseName"
            Text='<%# Bind("BaseName") %>'
            Width="408px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktProjectBases"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Base Name."
            MaxLength="50"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVBaseName"
            runat = "server"
            ControlToValidate = "F_BaseName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "mktProjectBases"
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
  ID = "ODSmktProjectBases"
  DataObjectTypeName = "SIS.MKT.mktProjectBases"
  SelectMethod = "mktProjectBasesGetByID"
  UpdateMethod="mktProjectBasesUpdate"
  DeleteMethod="mktProjectBasesDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktProjectBases"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="ProjectBaseID" Name="ProjectBaseID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

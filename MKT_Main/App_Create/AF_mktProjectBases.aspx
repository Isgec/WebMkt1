<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_mktProjectBases.aspx.vb" Inherits="AF_mktProjectBases" title="Add: Project Bases" %>
<asp:Content ID="CPHmktProjectBases" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelmktProjectBases" runat="server" Text="&nbsp;Add: Project Bases"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLmktProjectBases" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLmktProjectBases"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "mktProjectBases"
    runat = "server" />
<asp:FormView ID="FVmktProjectBases"
  runat = "server"
  DataKeyNames = "ProjectBaseID"
  DataSourceID = "ODSmktProjectBases"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgmktProjectBases" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_ProjectBaseID" ForeColor="#CC6633" runat="server" Text="Project Base :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ProjectBaseID" Enabled="False" CssClass="mypktxt" Width="88px" runat="server" Text="0" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_BaseName" runat="server" Text="Base Name :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_BaseName"
            Text='<%# Bind("BaseName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="mktProjectBases"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Base Name."
            MaxLength="50"
            Width="408px"
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
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSmktProjectBases"
  DataObjectTypeName = "SIS.MKT.mktProjectBases"
  InsertMethod="mktProjectBasesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.MKT.mktProjectBases"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>

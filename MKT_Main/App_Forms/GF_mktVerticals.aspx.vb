Imports System.Web.Script.Serialization
Partial Class GF_mktVerticals
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktVerticals.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?MktVericalID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktVerticals_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktVerticals.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim MktVericalID As Int32 = GVmktVerticals.DataKeys(e.CommandArgument).Values("MktVericalID")  
        Dim RedirectUrl As String = TBLmktVerticals.EditUrl & "?MktVericalID=" & MktVericalID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktVerticals_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktVerticals.Init
    DataClassName = "GmktVerticals"
    SetGridView = GVmktVerticals
  End Sub
  Protected Sub TBLmktVerticals_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktVerticals.Init
    SetToolBar = TBLmktVerticals
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class

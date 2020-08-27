Imports System.Web.Script.Serialization
Partial Class GF_mktSites
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktSites.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?MktSiteID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktSites_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktSites.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim MktSiteID As Int32 = GVmktSites.DataKeys(e.CommandArgument).Values("MktSiteID")  
        Dim RedirectUrl As String = TBLmktSites.EditUrl & "?MktSiteID=" & MktSiteID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktSites_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktSites.Init
    DataClassName = "GmktSites"
    SetGridView = GVmktSites
  End Sub
  Protected Sub TBLmktSites_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktSites.Init
    SetToolBar = TBLmktSites
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class

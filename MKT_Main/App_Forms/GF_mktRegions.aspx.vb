Imports System.Web.Script.Serialization
Partial Class GF_mktRegions
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktRegions.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?MktRegionID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktRegions_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktRegions.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim MktRegionID As Int32 = GVmktRegions.DataKeys(e.CommandArgument).Values("MktRegionID")  
        Dim RedirectUrl As String = TBLmktRegions.EditUrl & "?MktRegionID=" & MktRegionID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktRegions_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktRegions.Init
    DataClassName = "GmktRegions"
    SetGridView = GVmktRegions
  End Sub
  Protected Sub TBLmktRegions_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktRegions.Init
    SetToolBar = TBLmktRegions
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class

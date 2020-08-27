Imports System.Web.Script.Serialization
Partial Class GF_mktProjectBases
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktProjectBases.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?ProjectBaseID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktProjectBases_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktProjectBases.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim ProjectBaseID As Int32 = GVmktProjectBases.DataKeys(e.CommandArgument).Values("ProjectBaseID")  
        Dim RedirectUrl As String = TBLmktProjectBases.EditUrl & "?ProjectBaseID=" & ProjectBaseID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktProjectBases_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktProjectBases.Init
    DataClassName = "GmktProjectBases"
    SetGridView = GVmktProjectBases
  End Sub
  Protected Sub TBLmktProjectBases_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktProjectBases.Init
    SetToolBar = TBLmktProjectBases
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class

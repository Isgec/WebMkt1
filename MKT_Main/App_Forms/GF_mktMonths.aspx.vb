Imports System.Web.Script.Serialization
Partial Class GF_mktMonths
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktMonths.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?MktMonthID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktMonths_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktMonths.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim MktMonthID As Int32 = GVmktMonths.DataKeys(e.CommandArgument).Values("MktMonthID")  
        Dim RedirectUrl As String = TBLmktMonths.EditUrl & "?MktMonthID=" & MktMonthID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktMonths_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktMonths.Init
    DataClassName = "GmktMonths"
    SetGridView = GVmktMonths
  End Sub
  Protected Sub TBLmktMonths_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktMonths.Init
    SetToolBar = TBLmktMonths
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class

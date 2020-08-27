Imports System.Web.Script.Serialization
Partial Class GF_mktYears
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktYears.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?MktYearID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktYears_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktYears.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim MktYearID As Int32 = GVmktYears.DataKeys(e.CommandArgument).Values("MktYearID")  
        Dim RedirectUrl As String = TBLmktYears.EditUrl & "?MktYearID=" & MktYearID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktYears_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktYears.Init
    DataClassName = "GmktYears"
    SetGridView = GVmktYears
  End Sub
  Protected Sub TBLmktYears_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktYears.Init
    SetToolBar = TBLmktYears
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class

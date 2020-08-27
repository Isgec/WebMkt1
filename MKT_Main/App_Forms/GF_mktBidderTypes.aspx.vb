Imports System.Web.Script.Serialization
Partial Class GF_mktBidderTypes
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktBidderTypes.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?BidderTypeID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktBidderTypes_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktBidderTypes.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim BidderTypeID As Int32 = GVmktBidderTypes.DataKeys(e.CommandArgument).Values("BidderTypeID")  
        Dim RedirectUrl As String = TBLmktBidderTypes.EditUrl & "?BidderTypeID=" & BidderTypeID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktBidderTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktBidderTypes.Init
    DataClassName = "GmktBidderTypes"
    SetGridView = GVmktBidderTypes
  End Sub
  Protected Sub TBLmktBidderTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktBidderTypes.Init
    SetToolBar = TBLmktBidderTypes
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class

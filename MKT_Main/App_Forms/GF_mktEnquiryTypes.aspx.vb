Imports System.Web.Script.Serialization
Partial Class GF_mktEnquiryTypes
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktEnquiryTypes.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?EnquiryTypeID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktEnquiryTypes_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktEnquiryTypes.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim EnquiryTypeID As Int32 = GVmktEnquiryTypes.DataKeys(e.CommandArgument).Values("EnquiryTypeID")  
        Dim RedirectUrl As String = TBLmktEnquiryTypes.EditUrl & "?EnquiryTypeID=" & EnquiryTypeID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktEnquiryTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktEnquiryTypes.Init
    DataClassName = "GmktEnquiryTypes"
    SetGridView = GVmktEnquiryTypes
  End Sub
  Protected Sub TBLmktEnquiryTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiryTypes.Init
    SetToolBar = TBLmktEnquiryTypes
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class

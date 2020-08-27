Partial Class AF_mktEnquiryStatus
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktEnquiryStatus_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryStatus.Init
    DataClassName = "AmktEnquiryStatus"
    SetFormView = FVmktEnquiryStatus
  End Sub
  Protected Sub TBLmktEnquiryStatus_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiryStatus.Init
    SetToolBar = TBLmktEnquiryStatus
  End Sub
  Protected Sub FVmktEnquiryStatus_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryStatus.DataBound
    SIS.MKT.mktEnquiryStatus.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktEnquiryStatus_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryStatus.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktEnquiryStatus.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktEnquiryStatus") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktEnquiryStatus", mStr)
    End If
    If Request.QueryString("StatusID") IsNot Nothing Then
      CType(FVmktEnquiryStatus.FindControl("F_StatusID"), TextBox).Text = Request.QueryString("StatusID")
      CType(FVmktEnquiryStatus.FindControl("F_StatusID"), TextBox).Enabled = False
    End If
  End Sub

End Class

Partial Class AF_mktEnquiryTypes
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktEnquiryTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryTypes.Init
    DataClassName = "AmktEnquiryTypes"
    SetFormView = FVmktEnquiryTypes
  End Sub
  Protected Sub TBLmktEnquiryTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiryTypes.Init
    SetToolBar = TBLmktEnquiryTypes
  End Sub
  Protected Sub FVmktEnquiryTypes_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryTypes.DataBound
    SIS.MKT.mktEnquiryTypes.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktEnquiryTypes_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryTypes.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktEnquiryTypes.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktEnquiryTypes") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktEnquiryTypes", mStr)
    End If
    If Request.QueryString("EnquiryTypeID") IsNot Nothing Then
      CType(FVmktEnquiryTypes.FindControl("F_EnquiryTypeID"), TextBox).Text = Request.QueryString("EnquiryTypeID")
      CType(FVmktEnquiryTypes.FindControl("F_EnquiryTypeID"), TextBox).Enabled = False
    End If
  End Sub

End Class

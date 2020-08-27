Partial Class AF_mktRegions
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktRegions_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktRegions.Init
    DataClassName = "AmktRegions"
    SetFormView = FVmktRegions
  End Sub
  Protected Sub TBLmktRegions_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktRegions.Init
    SetToolBar = TBLmktRegions
  End Sub
  Protected Sub FVmktRegions_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktRegions.DataBound
    SIS.MKT.mktRegions.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktRegions_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktRegions.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktRegions.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktRegions") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktRegions", mStr)
    End If
    If Request.QueryString("MktRegionID") IsNot Nothing Then
      CType(FVmktRegions.FindControl("F_MktRegionID"), TextBox).Text = Request.QueryString("MktRegionID")
      CType(FVmktRegions.FindControl("F_MktRegionID"), TextBox).Enabled = False
    End If
  End Sub

End Class

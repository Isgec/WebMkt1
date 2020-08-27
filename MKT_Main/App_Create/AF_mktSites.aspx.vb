Partial Class AF_mktSites
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktSites_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSites.Init
    DataClassName = "AmktSites"
    SetFormView = FVmktSites
  End Sub
  Protected Sub TBLmktSites_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktSites.Init
    SetToolBar = TBLmktSites
  End Sub
  Protected Sub FVmktSites_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSites.DataBound
    SIS.MKT.mktSites.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktSites_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSites.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktSites.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktSites") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktSites", mStr)
    End If
    If Request.QueryString("MktSiteID") IsNot Nothing Then
      CType(FVmktSites.FindControl("F_MktSiteID"), TextBox).Text = Request.QueryString("MktSiteID")
      CType(FVmktSites.FindControl("F_MktSiteID"), TextBox).Enabled = False
    End If
  End Sub

End Class

Partial Class AF_mktProjectBases
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktProjectBases_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktProjectBases.Init
    DataClassName = "AmktProjectBases"
    SetFormView = FVmktProjectBases
  End Sub
  Protected Sub TBLmktProjectBases_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktProjectBases.Init
    SetToolBar = TBLmktProjectBases
  End Sub
  Protected Sub FVmktProjectBases_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktProjectBases.DataBound
    SIS.MKT.mktProjectBases.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktProjectBases_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktProjectBases.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktProjectBases.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktProjectBases") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktProjectBases", mStr)
    End If
    If Request.QueryString("ProjectBaseID") IsNot Nothing Then
      CType(FVmktProjectBases.FindControl("F_ProjectBaseID"), TextBox).Text = Request.QueryString("ProjectBaseID")
      CType(FVmktProjectBases.FindControl("F_ProjectBaseID"), TextBox).Enabled = False
    End If
  End Sub

End Class

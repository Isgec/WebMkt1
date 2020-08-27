Partial Class AF_mktVerticals
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktVerticals_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktVerticals.Init
    DataClassName = "AmktVerticals"
    SetFormView = FVmktVerticals
  End Sub
  Protected Sub TBLmktVerticals_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktVerticals.Init
    SetToolBar = TBLmktVerticals
  End Sub
  Protected Sub FVmktVerticals_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktVerticals.DataBound
    SIS.MKT.mktVerticals.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktVerticals_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktVerticals.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktVerticals.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktVerticals") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktVerticals", mStr)
    End If
    If Request.QueryString("MktVericalID") IsNot Nothing Then
      CType(FVmktVerticals.FindControl("F_MktVericalID"), TextBox).Text = Request.QueryString("MktVericalID")
      CType(FVmktVerticals.FindControl("F_MktVericalID"), TextBox).Enabled = False
    End If
  End Sub

End Class

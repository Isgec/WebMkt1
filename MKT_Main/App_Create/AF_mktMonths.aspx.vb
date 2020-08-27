Partial Class AF_mktMonths
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktMonths_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktMonths.Init
    DataClassName = "AmktMonths"
    SetFormView = FVmktMonths
  End Sub
  Protected Sub TBLmktMonths_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktMonths.Init
    SetToolBar = TBLmktMonths
  End Sub
  Protected Sub FVmktMonths_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktMonths.DataBound
    SIS.MKT.mktMonths.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktMonths_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktMonths.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktMonths.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktMonths") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktMonths", mStr)
    End If
    If Request.QueryString("MktMonthID") IsNot Nothing Then
      CType(FVmktMonths.FindControl("F_MktMonthID"), TextBox).Text = Request.QueryString("MktMonthID")
      CType(FVmktMonths.FindControl("F_MktMonthID"), TextBox).Enabled = False
    End If
  End Sub

End Class

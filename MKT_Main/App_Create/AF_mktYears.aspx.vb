Partial Class AF_mktYears
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktYears_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktYears.Init
    DataClassName = "AmktYears"
    SetFormView = FVmktYears
  End Sub
  Protected Sub TBLmktYears_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktYears.Init
    SetToolBar = TBLmktYears
  End Sub
  Protected Sub FVmktYears_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktYears.DataBound
    SIS.MKT.mktYears.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktYears_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktYears.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktYears.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktYears") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktYears", mStr)
    End If
    If Request.QueryString("MktYearID") IsNot Nothing Then
      CType(FVmktYears.FindControl("F_MktYearID"), TextBox).Text = Request.QueryString("MktYearID")
      CType(FVmktYears.FindControl("F_MktYearID"), TextBox).Enabled = False
    End If
  End Sub

End Class

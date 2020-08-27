Partial Class AF_mktBidderTypes
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktBidderTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktBidderTypes.Init
    DataClassName = "AmktBidderTypes"
    SetFormView = FVmktBidderTypes
  End Sub
  Protected Sub TBLmktBidderTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktBidderTypes.Init
    SetToolBar = TBLmktBidderTypes
  End Sub
  Protected Sub FVmktBidderTypes_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktBidderTypes.DataBound
    SIS.MKT.mktBidderTypes.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktBidderTypes_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktBidderTypes.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktBidderTypes.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktBidderTypes") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktBidderTypes", mStr)
    End If
    If Request.QueryString("BidderTypeID") IsNot Nothing Then
      CType(FVmktBidderTypes.FindControl("F_BidderTypeID"), TextBox).Text = Request.QueryString("BidderTypeID")
      CType(FVmktBidderTypes.FindControl("F_BidderTypeID"), TextBox).Enabled = False
    End If
  End Sub

End Class

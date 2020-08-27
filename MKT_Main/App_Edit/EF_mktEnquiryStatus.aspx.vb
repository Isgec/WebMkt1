Imports System.Web.Script.Serialization
Partial Class EF_mktEnquiryStatus
  Inherits SIS.SYS.UpdateBase
  Public Property Editable() As Boolean
    Get
      If ViewState("Editable") IsNot Nothing Then
        Return CType(ViewState("Editable"), Boolean)
      End If
      Return True
    End Get
    Set(ByVal value As Boolean)
      ViewState.Add("Editable", value)
    End Set
  End Property
  Public Property Deleteable() As Boolean
    Get
      If ViewState("Deleteable") IsNot Nothing Then
        Return CType(ViewState("Deleteable"), Boolean)
      End If
      Return True
    End Get
    Set(ByVal value As Boolean)
      ViewState.Add("Deleteable", value)
    End Set
  End Property
  Public Property PrimaryKey() As String
    Get
      If ViewState("PrimaryKey") IsNot Nothing Then
        Return CType(ViewState("PrimaryKey"), String)
      End If
      Return True
    End Get
    Set(ByVal value As String)
      ViewState.Add("PrimaryKey", value)
    End Set
  End Property
  Protected Sub ODSmktEnquiryStatus_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktEnquiryStatus.Selected
    Dim tmp As SIS.MKT.mktEnquiryStatus = CType(e.ReturnValue, SIS.MKT.mktEnquiryStatus)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktEnquiryStatus_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryStatus.Init
    DataClassName = "EmktEnquiryStatus"
    SetFormView = FVmktEnquiryStatus
  End Sub
  Protected Sub TBLmktEnquiryStatus_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiryStatus.Init
    SetToolBar = TBLmktEnquiryStatus
  End Sub
  Protected Sub FVmktEnquiryStatus_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryStatus.PreRender
    TBLmktEnquiryStatus.EnableSave = Editable
    TBLmktEnquiryStatus.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktEnquiryStatus.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktEnquiryStatus") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktEnquiryStatus", mStr)
    End If
  End Sub

End Class

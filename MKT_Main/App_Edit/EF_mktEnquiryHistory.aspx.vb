Imports System.Web.Script.Serialization
Partial Class EF_mktEnquiryHistory
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
  Protected Sub ODSmktEnquiryHistory_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktEnquiryHistory.Selected
    Dim tmp As SIS.MKT.mktEnquiryHistory = CType(e.ReturnValue, SIS.MKT.mktEnquiryHistory)
    Editable = False
    Deleteable = False
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktEnquiryHistory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryHistory.Init
    DataClassName = "EmktEnquiryHistory"
    SetFormView = FVmktEnquiryHistory
  End Sub
  Protected Sub TBLmktEnquiryHistory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiryHistory.Init
    SetToolBar = TBLmktEnquiryHistory
  End Sub
  Protected Sub FVmktEnquiryHistory_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryHistory.PreRender
    TBLmktEnquiryHistory.EnableSave = Editable
    TBLmktEnquiryHistory.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktEnquiryHistory.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktEnquiryHistory") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktEnquiryHistory", mStr)
    End If
  End Sub

End Class

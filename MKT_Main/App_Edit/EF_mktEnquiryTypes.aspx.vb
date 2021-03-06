Imports System.Web.Script.Serialization
Partial Class EF_mktEnquiryTypes
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
  Protected Sub ODSmktEnquiryTypes_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktEnquiryTypes.Selected
    Dim tmp As SIS.MKT.mktEnquiryTypes = CType(e.ReturnValue, SIS.MKT.mktEnquiryTypes)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktEnquiryTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryTypes.Init
    DataClassName = "EmktEnquiryTypes"
    SetFormView = FVmktEnquiryTypes
  End Sub
  Protected Sub TBLmktEnquiryTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiryTypes.Init
    SetToolBar = TBLmktEnquiryTypes
  End Sub
  Protected Sub FVmktEnquiryTypes_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiryTypes.PreRender
    TBLmktEnquiryTypes.EnableSave = Editable
    TBLmktEnquiryTypes.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktEnquiryTypes.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktEnquiryTypes") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktEnquiryTypes", mStr)
    End If
  End Sub

End Class

Imports System.Web.Script.Serialization
Partial Class EF_mktVerticals
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
  Protected Sub ODSmktVerticals_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktVerticals.Selected
    Dim tmp As SIS.MKT.mktVerticals = CType(e.ReturnValue, SIS.MKT.mktVerticals)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktVerticals_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktVerticals.Init
    DataClassName = "EmktVerticals"
    SetFormView = FVmktVerticals
  End Sub
  Protected Sub TBLmktVerticals_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktVerticals.Init
    SetToolBar = TBLmktVerticals
  End Sub
  Protected Sub FVmktVerticals_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktVerticals.PreRender
    TBLmktVerticals.EnableSave = Editable
    TBLmktVerticals.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktVerticals.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktVerticals") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktVerticals", mStr)
    End If
  End Sub

End Class

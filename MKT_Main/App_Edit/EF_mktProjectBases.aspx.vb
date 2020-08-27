Imports System.Web.Script.Serialization
Partial Class EF_mktProjectBases
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
  Protected Sub ODSmktProjectBases_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktProjectBases.Selected
    Dim tmp As SIS.MKT.mktProjectBases = CType(e.ReturnValue, SIS.MKT.mktProjectBases)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktProjectBases_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktProjectBases.Init
    DataClassName = "EmktProjectBases"
    SetFormView = FVmktProjectBases
  End Sub
  Protected Sub TBLmktProjectBases_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktProjectBases.Init
    SetToolBar = TBLmktProjectBases
  End Sub
  Protected Sub FVmktProjectBases_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktProjectBases.PreRender
    TBLmktProjectBases.EnableSave = Editable
    TBLmktProjectBases.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktProjectBases.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktProjectBases") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktProjectBases", mStr)
    End If
  End Sub

End Class

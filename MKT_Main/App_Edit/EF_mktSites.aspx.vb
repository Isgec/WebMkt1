Imports System.Web.Script.Serialization
Partial Class EF_mktSites
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
  Protected Sub ODSmktSites_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktSites.Selected
    Dim tmp As SIS.MKT.mktSites = CType(e.ReturnValue, SIS.MKT.mktSites)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktSites_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSites.Init
    DataClassName = "EmktSites"
    SetFormView = FVmktSites
  End Sub
  Protected Sub TBLmktSites_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktSites.Init
    SetToolBar = TBLmktSites
  End Sub
  Protected Sub FVmktSites_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSites.PreRender
    TBLmktSites.EnableSave = Editable
    TBLmktSites.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktSites.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktSites") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktSites", mStr)
    End If
  End Sub

End Class

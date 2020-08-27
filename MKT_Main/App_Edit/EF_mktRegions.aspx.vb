Imports System.Web.Script.Serialization
Partial Class EF_mktRegions
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
  Protected Sub ODSmktRegions_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktRegions.Selected
    Dim tmp As SIS.MKT.mktRegions = CType(e.ReturnValue, SIS.MKT.mktRegions)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktRegions_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktRegions.Init
    DataClassName = "EmktRegions"
    SetFormView = FVmktRegions
  End Sub
  Protected Sub TBLmktRegions_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktRegions.Init
    SetToolBar = TBLmktRegions
  End Sub
  Protected Sub FVmktRegions_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktRegions.PreRender
    TBLmktRegions.EnableSave = Editable
    TBLmktRegions.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktRegions.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktRegions") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktRegions", mStr)
    End If
  End Sub

End Class

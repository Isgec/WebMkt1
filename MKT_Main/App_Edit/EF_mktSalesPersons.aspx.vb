Imports System.Web.Script.Serialization
Partial Class EF_mktSalesPersons
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
  Protected Sub ODSmktSalesPersons_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktSalesPersons.Selected
    Dim tmp As SIS.MKT.mktSalesPersons = CType(e.ReturnValue, SIS.MKT.mktSalesPersons)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktSalesPersons_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSalesPersons.Init
    DataClassName = "EmktSalesPersons"
    SetFormView = FVmktSalesPersons
  End Sub
  Protected Sub TBLmktSalesPersons_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktSalesPersons.Init
    SetToolBar = TBLmktSalesPersons
  End Sub
  Protected Sub FVmktSalesPersons_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSalesPersons.PreRender
    TBLmktSalesPersons.EnableSave = Editable
    TBLmktSalesPersons.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktSalesPersons.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktSalesPersons") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktSalesPersons", mStr)
    End If
  End Sub

End Class

Imports System.Web.Script.Serialization
Partial Class EF_mktBidderTypes
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
  Protected Sub ODSmktBidderTypes_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktBidderTypes.Selected
    Dim tmp As SIS.MKT.mktBidderTypes = CType(e.ReturnValue, SIS.MKT.mktBidderTypes)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktBidderTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktBidderTypes.Init
    DataClassName = "EmktBidderTypes"
    SetFormView = FVmktBidderTypes
  End Sub
  Protected Sub TBLmktBidderTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktBidderTypes.Init
    SetToolBar = TBLmktBidderTypes
  End Sub
  Protected Sub FVmktBidderTypes_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktBidderTypes.PreRender
    TBLmktBidderTypes.EnableSave = Editable
    TBLmktBidderTypes.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktBidderTypes.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktBidderTypes") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktBidderTypes", mStr)
    End If
  End Sub

End Class

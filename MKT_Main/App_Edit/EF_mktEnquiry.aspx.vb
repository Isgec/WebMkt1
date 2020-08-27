Imports System.Web.Script.Serialization
Partial Class EF_mktEnquiry
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
  Protected Sub ODSmktEnquiry_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktEnquiry.Selected
    Dim tmp As SIS.MKT.mktEnquiry = CType(e.ReturnValue, SIS.MKT.mktEnquiry)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVmktEnquiry_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiry.Init
    DataClassName = "EmktEnquiry"
    SetFormView = FVmktEnquiry
  End Sub
  Protected Sub TBLmktEnquiry_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiry.Init
    SetToolBar = TBLmktEnquiry
  End Sub
  Protected Sub FVmktEnquiry_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiry.PreRender
    TBLmktEnquiry.EnableSave = Editable
    TBLmktEnquiry.EnableDelete = Deleteable
    TBLmktEnquiry.PrintUrl &= Request.QueryString("SerialNo") & "|"
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Edit") & "/EF_mktEnquiry.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktEnquiry") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktEnquiry", mStr)
    End If
  End Sub
  Partial Class gvBase
    Inherits SIS.SYS.GridBase
  End Class
  Private WithEvents gvmktSalesPersonsCC As New gvBase
  Protected Sub GVmktSalesPersons_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktSalesPersons.Init
    gvmktSalesPersonsCC.DataClassName = "GmktSalesPersons"
    gvmktSalesPersonsCC.SetGridView = GVmktSalesPersons
  End Sub
  Protected Sub TBLmktSalesPersons_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktSalesPersons.Init
    gvmktSalesPersonsCC.SetToolBar = TBLmktSalesPersons
  End Sub
  Protected Sub GVmktSalesPersons_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktSalesPersons.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim SerialNo As Int32 = GVmktSalesPersons.DataKeys(e.CommandArgument).Values("SerialNo")  
        Dim SalesPerson As String = GVmktSalesPersons.DataKeys(e.CommandArgument).Values("SalesPerson")  
        Dim RedirectUrl As String = TBLmktSalesPersons.EditUrl & "?SerialNo=" & SerialNo & "&SalesPerson=" & SalesPerson
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub TBLmktSalesPersons_AddClicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles TBLmktSalesPersons.AddClicked
    Dim SerialNo As Int32 = CType(FVmktEnquiry.FindControl("F_SerialNo"),TextBox).Text
    TBLmktSalesPersons.AddUrl &= "?SerialNo=" & SerialNo
  End Sub
  Private WithEvents gvmktEnquiryHistoryCC As New gvBase
  Protected Sub GVmktEnquiryHistory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktEnquiryHistory.Init
    gvmktEnquiryHistoryCC.DataClassName = "GmktEnquiryHistory"
    gvmktEnquiryHistoryCC.SetGridView = GVmktEnquiryHistory
  End Sub
  Protected Sub TBLmktEnquiryHistory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiryHistory.Init
    gvmktEnquiryHistoryCC.SetToolBar = TBLmktEnquiryHistory
  End Sub
  Protected Sub GVmktEnquiryHistory_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktEnquiryHistory.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim HistoryID As Int32 = GVmktEnquiryHistory.DataKeys(e.CommandArgument).Values("HistoryID")  
        Dim SerialNo As Int32 = GVmktEnquiryHistory.DataKeys(e.CommandArgument).Values("SerialNo")  
        Dim RedirectUrl As String = TBLmktEnquiryHistory.EditUrl & "?HistoryID=" & HistoryID & "&SerialNo=" & SerialNo
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function CustomerIDCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.VR.vrBusinessPartner.SelectvrBusinessPartnerAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function ResponsibleSalsePersonCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.QCM.qcmUsers.SelectqcmUsersAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function ProjectIDCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.QCM.qcmProjects.SelectqcmProjectsAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_Enquiry_SalesPerson(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim ResponsibleSalsePerson As String = CType(aVal(1),String)
    Dim oVar As SIS.QCM.qcmUsers = SIS.QCM.qcmUsers.qcmUsersGetByID(ResponsibleSalsePerson)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_Enquiry_ProjectID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim ProjectID As String = CType(aVal(1),String)
    Dim oVar As SIS.QCM.qcmProjects = SIS.QCM.qcmProjects.qcmProjectsGetByID(ProjectID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_Enquiry_CustomerID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim CustomerID As String = CType(aVal(1),String)
    Dim oVar As SIS.VR.vrBusinessPartner = SIS.VR.vrBusinessPartner.vrBusinessPartnerGetByID(CustomerID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function

End Class

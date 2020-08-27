Partial Class AF_mktSalesPersons
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktSalesPersons_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSalesPersons.Init
    DataClassName = "AmktSalesPersons"
    SetFormView = FVmktSalesPersons
  End Sub
  Protected Sub TBLmktSalesPersons_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktSalesPersons.Init
    SetToolBar = TBLmktSalesPersons
  End Sub
  Protected Sub FVmktSalesPersons_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSalesPersons.DataBound
    SIS.MKT.mktSalesPersons.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktSalesPersons_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktSalesPersons.PreRender
    Dim oF_SerialNo_Display As Label  = FVmktSalesPersons.FindControl("F_SerialNo_Display")
    oF_SerialNo_Display.Text = String.Empty
    If Not Session("F_SerialNo_Display") Is Nothing Then
      If Session("F_SerialNo_Display") <> String.Empty Then
        oF_SerialNo_Display.Text = Session("F_SerialNo_Display")
      End If
    End If
    Dim oF_SerialNo As TextBox  = FVmktSalesPersons.FindControl("F_SerialNo")
    oF_SerialNo.Enabled = True
    oF_SerialNo.Text = String.Empty
    If Not Session("F_SerialNo") Is Nothing Then
      If Session("F_SerialNo") <> String.Empty Then
        oF_SerialNo.Text = Session("F_SerialNo")
      End If
    End If
    Dim oF_SalesPerson_Display As Label  = FVmktSalesPersons.FindControl("F_SalesPerson_Display")
    Dim oF_SalesPerson As TextBox  = FVmktSalesPersons.FindControl("F_SalesPerson")
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktSalesPersons.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktSalesPersons") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktSalesPersons", mStr)
    End If
    If Request.QueryString("SerialNo") IsNot Nothing Then
      CType(FVmktSalesPersons.FindControl("F_SerialNo"), TextBox).Text = Request.QueryString("SerialNo")
      CType(FVmktSalesPersons.FindControl("F_SerialNo"), TextBox).Enabled = False
    End If
    If Request.QueryString("SalesPerson") IsNot Nothing Then
      CType(FVmktSalesPersons.FindControl("F_SalesPerson"), TextBox).Text = Request.QueryString("SalesPerson")
      CType(FVmktSalesPersons.FindControl("F_SalesPerson"), TextBox).Enabled = False
    End If
  End Sub
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function SerialNoCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.MKT.mktEnquiry.SelectmktEnquiryAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function SalesPersonCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.QCM.qcmUsers.SelectqcmUsersAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_SalesPersons_SalesPerson(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim SalesPerson As String = CType(aVal(1),String)
    Dim oVar As SIS.QCM.qcmUsers = SIS.QCM.qcmUsers.qcmUsersGetByID(SalesPerson)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_SalesPersons_SerialNo(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim SerialNo As Int32 = CType(aVal(1),Int32)
    Dim oVar As SIS.MKT.mktEnquiry = SIS.MKT.mktEnquiry.mktEnquiryGetByID(SerialNo)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function

End Class

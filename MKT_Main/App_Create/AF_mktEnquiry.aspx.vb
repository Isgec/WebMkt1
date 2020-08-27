Partial Class AF_mktEnquiry
  Inherits SIS.SYS.InsertBase
  Protected Sub FVmktEnquiry_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiry.Init
    DataClassName = "AmktEnquiry"
    SetFormView = FVmktEnquiry
  End Sub
  Protected Sub TBLmktEnquiry_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiry.Init
    SetToolBar = TBLmktEnquiry
  End Sub
  Protected Sub ODSmktEnquiry_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSmktEnquiry.Inserted
    If e.Exception Is Nothing Then
      Dim oDC As SIS.MKT.mktEnquiry = CType(e.ReturnValue,SIS.MKT.mktEnquiry)
      Dim tmpURL As String = "?tmp=1"
      tmpURL &= "&SerialNo=" & oDC.SerialNo
      TBLmktEnquiry.AfterInsertURL &= tmpURL 
    End If
  End Sub
  Protected Sub FVmktEnquiry_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiry.DataBound
    SIS.MKT.mktEnquiry.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVmktEnquiry_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVmktEnquiry.PreRender
    Dim oF_MktVericalID As LC_mktVerticals = FVmktEnquiry.FindControl("F_MktVericalID")
    oF_MktVericalID.Enabled = True
    oF_MktVericalID.SelectedValue = String.Empty
    If Not Session("F_MktVericalID") Is Nothing Then
      If Session("F_MktVericalID") <> String.Empty Then
        oF_MktVericalID.SelectedValue = Session("F_MktVericalID")
      End If
    End If
    Dim oF_CustomerID_Display As Label  = FVmktEnquiry.FindControl("F_CustomerID_Display")
    Dim oF_CustomerID As TextBox  = FVmktEnquiry.FindControl("F_CustomerID")
    Dim oF_MktSiteID As LC_mktSites = FVmktEnquiry.FindControl("F_MktSiteID")
    oF_MktSiteID.Enabled = True
    oF_MktSiteID.SelectedValue = String.Empty
    If Not Session("F_MktSiteID") Is Nothing Then
      If Session("F_MktSiteID") <> String.Empty Then
        oF_MktSiteID.SelectedValue = Session("F_MktSiteID")
      End If
    End If
    Dim oF_IndianStateID As LC_spmtERPStates = FVmktEnquiry.FindControl("F_IndianStateID")
    oF_IndianStateID.Enabled = True
    oF_IndianStateID.SelectedValue = String.Empty
    If Not Session("F_IndianStateID") Is Nothing Then
      If Session("F_IndianStateID") <> String.Empty Then
        oF_IndianStateID.SelectedValue = Session("F_IndianStateID")
      End If
    End If
    Dim oF_ResponsibleSalsePerson_Display As Label  = FVmktEnquiry.FindControl("F_ResponsibleSalsePerson_Display")
    Dim oF_ResponsibleSalsePerson As TextBox  = FVmktEnquiry.FindControl("F_ResponsibleSalsePerson")
    Dim oF_ProjectID_Display As Label  = FVmktEnquiry.FindControl("F_ProjectID_Display")
    Dim oF_ProjectID As TextBox  = FVmktEnquiry.FindControl("F_ProjectID")
    Dim oF_EnquiryTypeID As LC_mktEnquiryTypes = FVmktEnquiry.FindControl("F_EnquiryTypeID")
    oF_EnquiryTypeID.Enabled = True
    oF_EnquiryTypeID.SelectedValue = String.Empty
    If Not Session("F_EnquiryTypeID") Is Nothing Then
      If Session("F_EnquiryTypeID") <> String.Empty Then
        oF_EnquiryTypeID.SelectedValue = Session("F_EnquiryTypeID")
      End If
    End If
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/MKT_Main/App_Create") & "/AF_mktEnquiry.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptmktEnquiry") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptmktEnquiry", mStr)
    End If
    If Request.QueryString("SerialNo") IsNot Nothing Then
      CType(FVmktEnquiry.FindControl("F_SerialNo"), TextBox).Text = Request.QueryString("SerialNo")
      CType(FVmktEnquiry.FindControl("F_SerialNo"), TextBox).Enabled = False
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

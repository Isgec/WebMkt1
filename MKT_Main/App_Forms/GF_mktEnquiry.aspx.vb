Imports System.Web.Script.Serialization
Partial Class GF_mktEnquiry
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktEnquiry.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?SerialNo=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVmktEnquiry_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVmktEnquiry.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim SerialNo As Int32 = GVmktEnquiry.DataKeys(e.CommandArgument).Values("SerialNo")  
        Dim RedirectUrl As String = TBLmktEnquiry.EditUrl & "?SerialNo=" & SerialNo
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVmktEnquiry_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVmktEnquiry.Init
    DataClassName = "GmktEnquiry"
    SetGridView = GVmktEnquiry
  End Sub
  Protected Sub TBLmktEnquiry_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLmktEnquiry.Init
    SetToolBar = TBLmktEnquiry
  End Sub
  Protected Sub F_MktSiteID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles F_MktSiteID.SelectedIndexChanged
    Session("F_MktSiteID") = F_MktSiteID.SelectedValue
    InitGridPage()
  End Sub
  Protected Sub F_MktVericalID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles F_MktVericalID.SelectedIndexChanged
    Session("F_MktVericalID") = F_MktVericalID.SelectedValue
    InitGridPage()
  End Sub
  Protected Sub F_IndianStateID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles F_IndianStateID.SelectedIndexChanged
    Session("F_IndianStateID") = F_IndianStateID.SelectedValue
    InitGridPage()
  End Sub
  Protected Sub F_EnquiryTypeID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles F_EnquiryTypeID.SelectedIndexChanged
    Session("F_EnquiryTypeID") = F_EnquiryTypeID.SelectedValue
    InitGridPage()
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
    F_MktSiteID.SelectedValue = String.Empty
    If Not Session("F_MktSiteID") Is Nothing Then
      If Session("F_MktSiteID") <> String.Empty Then
        F_MktSiteID.SelectedValue = Session("F_MktSiteID")
      End If
    End If
    F_MktVericalID.SelectedValue = String.Empty
    If Not Session("F_MktVericalID") Is Nothing Then
      If Session("F_MktVericalID") <> String.Empty Then
        F_MktVericalID.SelectedValue = Session("F_MktVericalID")
      End If
    End If
    F_IndianStateID.SelectedValue = String.Empty
    If Not Session("F_IndianStateID") Is Nothing Then
      If Session("F_IndianStateID") <> String.Empty Then
        F_IndianStateID.SelectedValue = Session("F_IndianStateID")
      End If
    End If
    F_EnquiryTypeID.SelectedValue = String.Empty
    If Not Session("F_EnquiryTypeID") Is Nothing Then
      If Session("F_EnquiryTypeID") <> String.Empty Then
        F_EnquiryTypeID.SelectedValue = Session("F_EnquiryTypeID")
      End If
    End If
    Dim validateScriptMktSiteID As String = "<script type=""text/javascript"">" & _
      "  function validate_MktSiteID(o) {" & _
      "    validated_FK_MKT_Enquiry_MktSiteID_main = true;" & _
      "    validate_FK_MKT_Enquiry_MktSiteID(o);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateMktSiteID") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateMktSiteID", validateScriptMktSiteID)
    End If
    Dim validateScriptMktVericalID As String = "<script type=""text/javascript"">" & _
      "  function validate_MktVericalID(o) {" & _
      "    validated_FK_MKT_Enquiry_MktVerticalID_main = true;" & _
      "    validate_FK_MKT_Enquiry_MktVerticalID(o);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateMktVericalID") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateMktVericalID", validateScriptMktVericalID)
    End If
    Dim validateScriptIndianStateID As String = "<script type=""text/javascript"">" & _
      "  function validate_IndianStateID(o) {" & _
      "    validated_FK_MKT_Enquiry_IndianStateID_main = true;" & _
      "    validate_FK_MKT_Enquiry_IndianStateID(o);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateIndianStateID") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateIndianStateID", validateScriptIndianStateID)
    End If
    Dim validateScriptEnquiryTypeID As String = "<script type=""text/javascript"">" & _
      "  function validate_EnquiryTypeID(o) {" & _
      "    validated_FK_MKT_Enquiry_EnquiryTypeID_main = true;" & _
      "    validate_FK_MKT_Enquiry_EnquiryTypeID(o);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateEnquiryTypeID") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateEnquiryTypeID", validateScriptEnquiryTypeID)
    End If
    Dim validateScriptFK_MKT_Enquiry_EnquiryTypeID As String = "<script type=""text/javascript"">" & _
      "  function validate_FK_MKT_Enquiry_EnquiryTypeID(o) {" & _
      "    var value = o.id;" & _
      "    var EnquiryTypeID = $get('" & F_EnquiryTypeID.ClientID & "');" & _
      "    try{" & _
      "    if(EnquiryTypeID.value==''){" & _
      "      if(validated_FK_MKT_Enquiry_EnquiryTypeID.main){" & _
      "        var o_d = $get(o.id +'_Display');" & _
      "        try{o_d.innerHTML = '';}catch(ex){}" & _
      "      }" & _
      "    }" & _
      "    value = value + ',' + EnquiryTypeID.value ;" & _
      "    }catch(ex){}" & _
      "    o.style.backgroundImage  = 'url(../../images/pkloader.gif)';" & _
      "    o.style.backgroundRepeat= 'no-repeat';" & _
      "    o.style.backgroundPosition = 'right';" & _
      "    PageMethods.validate_FK_MKT_Enquiry_EnquiryTypeID(value, validated_FK_MKT_Enquiry_EnquiryTypeID);" & _
      "  }" & _
      "  validated_FK_MKT_Enquiry_EnquiryTypeID_main = false;" & _
      "  function validated_FK_MKT_Enquiry_EnquiryTypeID(result) {" & _
      "    var p = result.split('|');" & _
      "    var o = $get(p[1]);" & _
      "    var o_d = $get(p[1]+'_Display');" & _
      "    try{o_d.innerHTML = p[2];}catch(ex){}" & _
      "    o.style.backgroundImage  = 'none';" & _
      "    if(p[0]=='1'){" & _
      "      o.value='';" & _
      "      try{o_d.innerHTML = '';}catch(ex){}" & _
      "      __doPostBack(o.id, o.value);" & _
      "    }" & _
      "    else" & _
      "      __doPostBack(o.id, o.value);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateFK_MKT_Enquiry_EnquiryTypeID") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateFK_MKT_Enquiry_EnquiryTypeID", validateScriptFK_MKT_Enquiry_EnquiryTypeID)
    End If
    Dim validateScriptFK_MKT_Enquiry_MktSiteID As String = "<script type=""text/javascript"">" & _
      "  function validate_FK_MKT_Enquiry_MktSiteID(o) {" & _
      "    var value = o.id;" & _
      "    var MktSiteID = $get('" & F_MktSiteID.ClientID & "');" & _
      "    try{" & _
      "    if(MktSiteID.value==''){" & _
      "      if(validated_FK_MKT_Enquiry_MktSiteID.main){" & _
      "        var o_d = $get(o.id +'_Display');" & _
      "        try{o_d.innerHTML = '';}catch(ex){}" & _
      "      }" & _
      "    }" & _
      "    value = value + ',' + MktSiteID.value ;" & _
      "    }catch(ex){}" & _
      "    o.style.backgroundImage  = 'url(../../images/pkloader.gif)';" & _
      "    o.style.backgroundRepeat= 'no-repeat';" & _
      "    o.style.backgroundPosition = 'right';" & _
      "    PageMethods.validate_FK_MKT_Enquiry_MktSiteID(value, validated_FK_MKT_Enquiry_MktSiteID);" & _
      "  }" & _
      "  validated_FK_MKT_Enquiry_MktSiteID_main = false;" & _
      "  function validated_FK_MKT_Enquiry_MktSiteID(result) {" & _
      "    var p = result.split('|');" & _
      "    var o = $get(p[1]);" & _
      "    var o_d = $get(p[1]+'_Display');" & _
      "    try{o_d.innerHTML = p[2];}catch(ex){}" & _
      "    o.style.backgroundImage  = 'none';" & _
      "    if(p[0]=='1'){" & _
      "      o.value='';" & _
      "      try{o_d.innerHTML = '';}catch(ex){}" & _
      "      __doPostBack(o.id, o.value);" & _
      "    }" & _
      "    else" & _
      "      __doPostBack(o.id, o.value);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateFK_MKT_Enquiry_MktSiteID") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateFK_MKT_Enquiry_MktSiteID", validateScriptFK_MKT_Enquiry_MktSiteID)
    End If
    Dim validateScriptFK_MKT_Enquiry_MktVerticalID As String = "<script type=""text/javascript"">" & _
      "  function validate_FK_MKT_Enquiry_MktVerticalID(o) {" & _
      "    var value = o.id;" & _
      "    var MktVericalID = $get('" & F_MktVericalID.ClientID & "');" & _
      "    try{" & _
      "    if(MktVericalID.value==''){" & _
      "      if(validated_FK_MKT_Enquiry_MktVerticalID.main){" & _
      "        var o_d = $get(o.id +'_Display');" & _
      "        try{o_d.innerHTML = '';}catch(ex){}" & _
      "      }" & _
      "    }" & _
      "    value = value + ',' + MktVericalID.value ;" & _
      "    }catch(ex){}" & _
      "    o.style.backgroundImage  = 'url(../../images/pkloader.gif)';" & _
      "    o.style.backgroundRepeat= 'no-repeat';" & _
      "    o.style.backgroundPosition = 'right';" & _
      "    PageMethods.validate_FK_MKT_Enquiry_MktVerticalID(value, validated_FK_MKT_Enquiry_MktVerticalID);" & _
      "  }" & _
      "  validated_FK_MKT_Enquiry_MktVerticalID_main = false;" & _
      "  function validated_FK_MKT_Enquiry_MktVerticalID(result) {" & _
      "    var p = result.split('|');" & _
      "    var o = $get(p[1]);" & _
      "    var o_d = $get(p[1]+'_Display');" & _
      "    try{o_d.innerHTML = p[2];}catch(ex){}" & _
      "    o.style.backgroundImage  = 'none';" & _
      "    if(p[0]=='1'){" & _
      "      o.value='';" & _
      "      try{o_d.innerHTML = '';}catch(ex){}" & _
      "      __doPostBack(o.id, o.value);" & _
      "    }" & _
      "    else" & _
      "      __doPostBack(o.id, o.value);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateFK_MKT_Enquiry_MktVerticalID") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateFK_MKT_Enquiry_MktVerticalID", validateScriptFK_MKT_Enquiry_MktVerticalID)
    End If
    Dim validateScriptFK_MKT_Enquiry_IndianStateID As String = "<script type=""text/javascript"">" & _
      "  function validate_FK_MKT_Enquiry_IndianStateID(o) {" & _
      "    var value = o.id;" & _
      "    var IndianStateID = $get('" & F_IndianStateID.ClientID & "');" & _
      "    try{" & _
      "    if(IndianStateID.value==''){" & _
      "      if(validated_FK_MKT_Enquiry_IndianStateID.main){" & _
      "        var o_d = $get(o.id +'_Display');" & _
      "        try{o_d.innerHTML = '';}catch(ex){}" & _
      "      }" & _
      "    }" & _
      "    value = value + ',' + IndianStateID.value ;" & _
      "    }catch(ex){}" & _
      "    o.style.backgroundImage  = 'url(../../images/pkloader.gif)';" & _
      "    o.style.backgroundRepeat= 'no-repeat';" & _
      "    o.style.backgroundPosition = 'right';" & _
      "    PageMethods.validate_FK_MKT_Enquiry_IndianStateID(value, validated_FK_MKT_Enquiry_IndianStateID);" & _
      "  }" & _
      "  validated_FK_MKT_Enquiry_IndianStateID_main = false;" & _
      "  function validated_FK_MKT_Enquiry_IndianStateID(result) {" & _
      "    var p = result.split('|');" & _
      "    var o = $get(p[1]);" & _
      "    var o_d = $get(p[1]+'_Display');" & _
      "    try{o_d.innerHTML = p[2];}catch(ex){}" & _
      "    o.style.backgroundImage  = 'none';" & _
      "    if(p[0]=='1'){" & _
      "      o.value='';" & _
      "      try{o_d.innerHTML = '';}catch(ex){}" & _
      "      __doPostBack(o.id, o.value);" & _
      "    }" & _
      "    else" & _
      "      __doPostBack(o.id, o.value);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateFK_MKT_Enquiry_IndianStateID") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateFK_MKT_Enquiry_IndianStateID", validateScriptFK_MKT_Enquiry_IndianStateID)
    End If
  End Sub
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_Enquiry_EnquiryTypeID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim EnquiryTypeID As Int32 = CType(aVal(1),Int32)
    Dim oVar As SIS.MKT.mktEnquiryTypes = SIS.MKT.mktEnquiryTypes.mktEnquiryTypesGetByID(EnquiryTypeID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_Enquiry_MktSiteID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim MktSiteID As Int32 = CType(aVal(1),Int32)
    Dim oVar As SIS.MKT.mktSites = SIS.MKT.mktSites.mktSitesGetByID(MktSiteID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_Enquiry_MktVerticalID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim MktVericalID As Int32 = CType(aVal(1),Int32)
    Dim oVar As SIS.MKT.mktVerticals = SIS.MKT.mktVerticals.mktVerticalsGetByID(MktVericalID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_MKT_Enquiry_IndianStateID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim IndianStateID As String = CType(aVal(1),String)
    Dim oVar As SIS.SPMT.spmtERPStates = SIS.SPMT.spmtERPStates.spmtERPStatesGetByID(IndianStateID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
End Class

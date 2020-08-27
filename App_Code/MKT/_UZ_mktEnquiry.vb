Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.MKT
  Partial Public Class mktEnquiry
    Public Function GetColor() As System.Drawing.Color
      Dim mRet As System.Drawing.Color = Drawing.Color.Blue
      Return mRet
    End Function
    Public Function GetVisible() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public Function GetEnable() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public Function GetEditable() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public Function GetDeleteable() As Boolean
      Dim mRet As Boolean = False
      Return mRet
    End Function
    Public ReadOnly Property Editable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEditable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Deleteable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetDeleteable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public Shared Function UZ_mktEnquirySelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal MktVericalID As Int32, ByVal MktSiteID As Int32, ByVal IndianStateID As String, ByVal EnquiryTypeID As Int32) As List(Of SIS.MKT.mktEnquiry)
      Dim Results As List(Of SIS.MKT.mktEnquiry) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "SerialNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "spmkt_LG_EnquirySelectListSearch"
            Cmd.CommandText = "spmktEnquirySelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "spmkt_LG_EnquirySelectListFilteres"
            Cmd.CommandText = "spmktEnquirySelectListFilteres"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_MktVericalID",SqlDbType.Int,10, IIf(MktVericalID = Nothing, 0,MktVericalID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_MktSiteID",SqlDbType.Int,10, IIf(MktSiteID = Nothing, 0,MktSiteID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_IndianStateID",SqlDbType.NVarChar,2, IIf(IndianStateID Is Nothing, String.Empty,IndianStateID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_EnquiryTypeID",SqlDbType.Int,10, IIf(EnquiryTypeID = Nothing, 0,EnquiryTypeID))
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.MKT.mktEnquiry)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.MKT.mktEnquiry(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function UZ_mktEnquiryInsert(ByVal Record As SIS.MKT.mktEnquiry) As SIS.MKT.mktEnquiry
      Dim _Result As SIS.MKT.mktEnquiry = mktEnquiryInsert(Record)
      SIS.MKT.mktEnquiryHistory.InsertData(_Result)
      Return _Result
    End Function
    Public Shared Function UZ_mktEnquiryUpdate(ByVal Record As SIS.MKT.mktEnquiry) As SIS.MKT.mktEnquiry
      Dim _Result As SIS.MKT.mktEnquiry = mktEnquiryUpdate(Record)
      SIS.MKT.mktEnquiryHistory.InsertData(_Result)
      Return _Result
    End Function
    Public Shared Function UZ_mktEnquiryDelete(ByVal Record As SIS.MKT.mktEnquiry) As Integer
      Dim _Result as Integer = mktEnquiryDelete(Record)
      Return _Result
    End Function
    Public Shared Function SetDefaultValues(ByVal sender As System.Web.UI.WebControls.FormView, ByVal e As System.EventArgs) As System.Web.UI.WebControls.FormView
      With sender
        Try
        CType(.FindControl("F_SerialNo"), TextBox).Text = ""
        CType(.FindControl("F_ProspectNo"), TextBox).Text = ""
        CType(.FindControl("F_EnquiryDate"), TextBox).Text = ""
        CType(.FindControl("F_MktVericalID"),Object).SelectedValue = ""
        CType(.FindControl("F_CustomerName"), TextBox).Text = ""
        CType(.FindControl("F_CustomerID"), TextBox).Text = ""
        CType(.FindControl("F_CustomerID_Display"), Label).Text = ""
        CType(.FindControl("F_MktSiteID"),Object).SelectedValue = ""
        CType(.FindControl("F_MktRegionID"),Object).SelectedValue = ""
        CType(.FindControl("F_IndianStateID"),Object).SelectedValue = ""
        CType(.FindControl("F_SiteLocation"), TextBox).Text = ""
        CType(.FindControl("F_ResponsibleSalsePerson"), TextBox).Text = ""
        CType(.FindControl("F_ResponsibleSalsePerson_Display"), Label).Text = ""
        CType(.FindControl("F_ProjectName"), TextBox).Text = ""
        CType(.FindControl("F_ProjectID"), TextBox).Text = ""
        CType(.FindControl("F_ProjectID_Display"), Label).Text = ""
        CType(.FindControl("F_ProjectConsultant"), TextBox).Text = ""
        CType(.FindControl("F_BidApprovalRequired"), CheckBox).Checked = False
        CType(.FindControl("F_ProjectBaseID"),Object).SelectedValue = ""
        CType(.FindControl("F_CustomerKeyOfficials"), TextBox).Text = ""
        CType(.FindControl("F_BidSubmissionDate"), TextBox).Text = ""
        CType(.FindControl("F_OrderFinalizationYear"),Object).SelectedValue = ""
        CType(.FindControl("F_OrderFinalizationMonth"),Object).SelectedValue = ""
        CType(.FindControl("F_ApproxProjectValue"), TextBox).Text = ""
        CType(.FindControl("F_EnquiryTypeID"),Object).SelectedValue = ""
        CType(.FindControl("F_Competitors"), TextBox).Text = ""
        CType(.FindControl("F_ProjectFunding"), TextBox).Text = ""
        CType(.FindControl("F_BidderTypeID"),Object).SelectedValue = ""
        CType(.FindControl("F_BriefScope"), TextBox).Text = ""
        CType(.FindControl("F_ProjectStatus"), TextBox).Text = ""
        CType(.FindControl("F_PPAStatus"), TextBox).Text = ""
        CType(.FindControl("F_LandAcquisitionStatus"), TextBox).Text = ""
        CType(.FindControl("F_StatutoryClearanceStatus"), TextBox).Text = ""
        CType(.FindControl("F_PreQualificationRequirement"), TextBox).Text = ""
        CType(.FindControl("F_ProposedRiskreviewdate"), TextBox).Text = ""
        CType(.FindControl("F_RiskReviewMeetingComments"), TextBox).Text = ""
        CType(.FindControl("F_RiskReviewApproval"), CheckBox).Checked = False
        Catch ex As Exception
        End Try
      End With
      Return sender
    End Function
  End Class
End Namespace

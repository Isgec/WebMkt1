Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.MKT
  Partial Public Class mktEnquiryHistory
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
    Public Shared Function SetDefaultValues(ByVal sender As System.Web.UI.WebControls.FormView, ByVal e As System.EventArgs) As System.Web.UI.WebControls.FormView
      With sender
        Try
        CType(.FindControl("F_HistoryID"), TextBox).Text = ""
        CType(.FindControl("F_SerialNo"), TextBox).Text = ""
        CType(.FindControl("F_SerialNo_Display"), Label).Text = ""
        CType(.FindControl("F_ProspectNo"), TextBox).Text = ""
        CType(.FindControl("F_MktVericalID"), TextBox).Text = 0
        CType(.FindControl("F_CustomerID"), TextBox).Text = ""
        CType(.FindControl("F_CustomerName"), TextBox).Text = ""
        CType(.FindControl("F_MktSiteID"), TextBox).Text = 0
        CType(.FindControl("F_MktRegionID"), TextBox).Text = 0
        CType(.FindControl("F_IndianStateID"), TextBox).Text = ""
        CType(.FindControl("F_SiteLocation"), TextBox).Text = ""
        CType(.FindControl("F_SalesPersonList"), TextBox).Text = ""
        CType(.FindControl("F_ResponsibleSalsePerson"), TextBox).Text = ""
        CType(.FindControl("F_ProjectID"), TextBox).Text = ""
        CType(.FindControl("F_ProjectName"), TextBox).Text = ""
        CType(.FindControl("F_ProjectConsultant"), TextBox).Text = ""
        CType(.FindControl("F_BidApprovalRequired"), CheckBox).Checked = False
        CType(.FindControl("F_ProjectBaseID"), TextBox).Text = 0
        CType(.FindControl("F_CustomerKeyOfficials"), TextBox).Text = ""
        CType(.FindControl("F_BidSubmissionDate"), TextBox).Text = ""
        CType(.FindControl("F_OrderFinalizationYear"), TextBox).Text = 0
        CType(.FindControl("F_OrderFinalizationMonth"), TextBox).Text = 0
        CType(.FindControl("F_ApproxProjectValue"), TextBox).Text = ""
        CType(.FindControl("F_EnquiryTypeID"), TextBox).Text = 0
        CType(.FindControl("F_Competitors"), TextBox).Text = ""
        CType(.FindControl("F_ProjectFunding"), TextBox).Text = ""
        CType(.FindControl("F_BidderTypeID"), TextBox).Text = 0
        CType(.FindControl("F_BriefScope"), TextBox).Text = ""
        CType(.FindControl("F_ProjectStatus"), TextBox).Text = ""
        CType(.FindControl("F_PPAStatus"), TextBox).Text = ""
        CType(.FindControl("F_LandAcquisitionStatus"), TextBox).Text = ""
        CType(.FindControl("F_StatutoryClearanceStatus"), TextBox).Text = ""
        CType(.FindControl("F_PreQualificationRequirement"), TextBox).Text = ""
        CType(.FindControl("F_ProposedRiskreviewdate"), TextBox).Text = ""
        CType(.FindControl("F_RiskReviewMeetingComments"), TextBox).Text = ""
        CType(.FindControl("F_RiskReviewApproval"), CheckBox).Checked = False
        CType(.FindControl("F_CreatedBy"), TextBox).Text = ""
        CType(.FindControl("F_CreatedOn"), TextBox).Text = ""
        CType(.FindControl("F_ModifiedBy"), TextBox).Text = ""
        CType(.FindControl("F_ModifiedOn"), TextBox).Text = ""
        CType(.FindControl("F_StatusID"), TextBox).Text = 0
        CType(.FindControl("F_EnquiryDate"), TextBox).Text = ""
        Catch ex As Exception
        End Try
      End With
      Return sender
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.MKT.mktEnquiry) As SIS.MKT.mktEnquiryHistory
      Dim HistoryID As Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryHistoryInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo", SqlDbType.Int, 11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProspectNo", SqlDbType.NVarChar, 51, Record.ProspectNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktVericalID", SqlDbType.Int, 11, IIf(Record.MktVericalID = "", Convert.DBNull, Record.MktVericalID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerID", SqlDbType.NVarChar, 10, IIf(Record.CustomerID = "", Convert.DBNull, Record.CustomerID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerName", SqlDbType.NVarChar, 251, Record.CustomerName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktSiteID", SqlDbType.Int, 11, IIf(Record.MktSiteID = "", Convert.DBNull, Record.MktSiteID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktRegionID", SqlDbType.Int, 11, IIf(Record.MktRegionID = "", Convert.DBNull, Record.MktRegionID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@IndianStateID", SqlDbType.NVarChar, 3, IIf(Record.IndianStateID = "", Convert.DBNull, Record.IndianStateID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SiteLocation", SqlDbType.NVarChar, 251, IIf(Record.SiteLocation = "", Convert.DBNull, Record.SiteLocation))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SalesPersonList", SqlDbType.NVarChar, 251, IIf(Record.SalesPersonList = "", Convert.DBNull, Record.SalesPersonList))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ResponsibleSalsePerson", SqlDbType.NVarChar, 9, Record.ResponsibleSalsePerson)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectID", SqlDbType.NVarChar, 7, IIf(Record.ProjectID = "", Convert.DBNull, Record.ProjectID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectName", SqlDbType.NVarChar, 251, Record.ProjectName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectConsultant", SqlDbType.NVarChar, 251, IIf(Record.ProjectConsultant = "", Convert.DBNull, Record.ProjectConsultant))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidApprovalRequired", SqlDbType.Bit, 3, Record.BidApprovalRequired)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectBaseID", SqlDbType.Int, 11, IIf(Record.ProjectBaseID = "", Convert.DBNull, Record.ProjectBaseID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerKeyOfficials", SqlDbType.NVarChar, 251, IIf(Record.CustomerKeyOfficials = "", Convert.DBNull, Record.CustomerKeyOfficials))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidSubmissionDate", SqlDbType.DateTime, 21, IIf(Record.BidSubmissionDate = "", Convert.DBNull, Record.BidSubmissionDate))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderFinalizationYear", SqlDbType.Int, 11, IIf(Record.OrderFinalizationYear = "", Convert.DBNull, Record.OrderFinalizationYear))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderFinalizationMonth", SqlDbType.Int, 11, IIf(Record.OrderFinalizationMonth = "", Convert.DBNull, Record.OrderFinalizationMonth))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproxProjectValue", SqlDbType.NVarChar, 251, IIf(Record.ApproxProjectValue = "", Convert.DBNull, Record.ApproxProjectValue))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EnquiryTypeID", SqlDbType.Int, 11, IIf(Record.EnquiryTypeID = "", Convert.DBNull, Record.EnquiryTypeID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Competitors", SqlDbType.NVarChar, 251, IIf(Record.Competitors = "", Convert.DBNull, Record.Competitors))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectFunding", SqlDbType.NVarChar, 251, IIf(Record.ProjectFunding = "", Convert.DBNull, Record.ProjectFunding))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidderTypeID", SqlDbType.Int, 11, IIf(Record.BidderTypeID = "", Convert.DBNull, Record.BidderTypeID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BriefScope", SqlDbType.NVarChar, 1001, IIf(Record.BriefScope = "", Convert.DBNull, Record.BriefScope))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectStatus", SqlDbType.NVarChar, 251, IIf(Record.ProjectStatus = "", Convert.DBNull, Record.ProjectStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@PPAStatus", SqlDbType.NVarChar, 251, IIf(Record.PPAStatus = "", Convert.DBNull, Record.PPAStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LandAcquisitionStatus", SqlDbType.NVarChar, 251, IIf(Record.LandAcquisitionStatus = "", Convert.DBNull, Record.LandAcquisitionStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatutoryClearanceStatus", SqlDbType.NVarChar, 251, IIf(Record.StatutoryClearanceStatus = "", Convert.DBNull, Record.StatutoryClearanceStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@PreQualificationRequirement", SqlDbType.NVarChar, 251, IIf(Record.PreQualificationRequirement = "", Convert.DBNull, Record.PreQualificationRequirement))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProposedRiskreviewdate", SqlDbType.DateTime, 21, IIf(Record.ProposedRiskreviewdate = "", Convert.DBNull, Record.ProposedRiskreviewdate))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RiskReviewMeetingComments", SqlDbType.NVarChar, 1001, IIf(Record.RiskReviewMeetingComments = "", Convert.DBNull, Record.RiskReviewMeetingComments))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RiskReviewApproval", SqlDbType.Bit, 3, Record.RiskReviewApproval)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedBy", SqlDbType.NVarChar, 9, IIf(Record.CreatedBy = "", Convert.DBNull, Record.CreatedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedOn", SqlDbType.DateTime, 21, IIf(Record.CreatedOn = "", Convert.DBNull, Record.CreatedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedBy", SqlDbType.NVarChar, 9, IIf(Record.ModifiedBy = "", Convert.DBNull, Record.ModifiedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedOn", SqlDbType.DateTime, 21, IIf(Record.ModifiedOn = "", Convert.DBNull, Record.ModifiedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID", SqlDbType.Int, 11, IIf(Record.StatusID = "", Convert.DBNull, Record.StatusID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EnquiryDate", SqlDbType.DateTime, 21, Record.EnquiryDate)
          Cmd.Parameters.Add("@Return_HistoryID", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_HistoryID").Direction = ParameterDirection.Output
          Cmd.Parameters.Add("@Return_SerialNo", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_SerialNo").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          HistoryID = Cmd.Parameters("@Return_HistoryID").Value
          Record.SerialNo = Cmd.Parameters("@Return_SerialNo").Value
        End Using
      End Using
      Return SIS.MKT.mktEnquiryHistory.mktEnquiryHistoryGetByID(HistoryID, Record.SerialNo)
    End Function
  End Class
End Namespace

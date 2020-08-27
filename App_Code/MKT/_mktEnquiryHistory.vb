Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.MKT
  <DataObject()> _
  Partial Public Class mktEnquiryHistory
    Private Shared _RecordCount As Integer
    Public Property HistoryID As Int32 = 0
    Public Property SerialNo As Int32 = 0
    Public Property ProspectNo As String = ""
    Public Property MktVericalID As String = ""
    Public Property CustomerID As String = ""
    Public Property CustomerName As String = ""
    Public Property MktSiteID As String = ""
    Public Property MktRegionID As String = ""
    Public Property IndianStateID As String = ""
    Public Property SiteLocation As String = ""
    Public Property SalesPersonList As String = ""
    Public Property ResponsibleSalsePerson As String = ""
    Public Property ProjectID As String = ""
    Public Property ProjectName As String = ""
    Public Property ProjectConsultant As String = ""
    Public Property BidApprovalRequired As Boolean = False
    Public Property ProjectBaseID As String = ""
    Public Property CustomerKeyOfficials As String = ""
    Private _BidSubmissionDate As String = ""
    Public Property OrderFinalizationYear As String = ""
    Public Property OrderFinalizationMonth As String = ""
    Public Property ApproxProjectValue As String = ""
    Public Property EnquiryTypeID As String = ""
    Public Property Competitors As String = ""
    Public Property ProjectFunding As String = ""
    Public Property BidderTypeID As String = ""
    Public Property BriefScope As String = ""
    Public Property ProjectStatus As String = ""
    Public Property PPAStatus As String = ""
    Public Property LandAcquisitionStatus As String = ""
    Public Property StatutoryClearanceStatus As String = ""
    Public Property PreQualificationRequirement As String = ""
    Private _ProposedRiskreviewdate As String = ""
    Public Property RiskReviewMeetingComments As String = ""
    Public Property RiskReviewApproval As Boolean = False
    Public Property CreatedBy As String = ""
    Private _CreatedOn As String = ""
    Public Property ModifiedBy As String = ""
    Private _ModifiedOn As String = ""
    Public Property StatusID As String = ""
    Private _EnquiryDate As String = ""
    Public Property MKT_Enquiry1_ProspectNo As String = ""
    Private _FK_MKT_EnquiryHistory_SerialNo As SIS.MKT.mktEnquiry = Nothing
    Public ReadOnly Property ForeColor() As System.Drawing.Color
      Get
        Dim mRet As System.Drawing.Color = Drawing.Color.Blue
        Try
          mRet = GetColor()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Visible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Enable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public Property BidSubmissionDate() As String
      Get
        If Not _BidSubmissionDate = String.Empty Then
          Return Convert.ToDateTime(_BidSubmissionDate).ToString("dd/MM/yyyy")
        End If
        Return _BidSubmissionDate
      End Get
      Set(ByVal value As String)
         If Convert.IsDBNull(Value) Then
           _BidSubmissionDate = ""
         Else
           _BidSubmissionDate = value
         End If
      End Set
    End Property
    Public Property ProposedRiskreviewdate() As String
      Get
        If Not _ProposedRiskreviewdate = String.Empty Then
          Return Convert.ToDateTime(_ProposedRiskreviewdate).ToString("dd/MM/yyyy")
        End If
        Return _ProposedRiskreviewdate
      End Get
      Set(ByVal value As String)
         If Convert.IsDBNull(Value) Then
           _ProposedRiskreviewdate = ""
         Else
           _ProposedRiskreviewdate = value
         End If
      End Set
    End Property
    Public Property CreatedOn() As String
      Get
        If Not _CreatedOn = String.Empty Then
          Return Convert.ToDateTime(_CreatedOn).ToString("dd/MM/yyyy")
        End If
        Return _CreatedOn
      End Get
      Set(ByVal value As String)
         If Convert.IsDBNull(Value) Then
           _CreatedOn = ""
         Else
           _CreatedOn = value
         End If
      End Set
    End Property
    Public Property ModifiedOn() As String
      Get
        If Not _ModifiedOn = String.Empty Then
          Return Convert.ToDateTime(_ModifiedOn).ToString("dd/MM/yyyy")
        End If
        Return _ModifiedOn
      End Get
      Set(ByVal value As String)
         If Convert.IsDBNull(Value) Then
           _ModifiedOn = ""
         Else
           _ModifiedOn = value
         End If
      End Set
    End Property
    Public Property EnquiryDate() As String
      Get
        If Not _EnquiryDate = String.Empty Then
          Return Convert.ToDateTime(_EnquiryDate).ToString("dd/MM/yyyy")
        End If
        Return _EnquiryDate
      End Get
      Set(ByVal value As String)
         _EnquiryDate = value
      End Set
    End Property
    Public Readonly Property DisplayField() As String
      Get
        Return ""
      End Get
    End Property
    Public Readonly Property PrimaryKey() As String
      Get
        Return _HistoryID & "|" & _SerialNo
      End Get
    End Property
    Public Shared Property RecordCount() As Integer
      Get
        Return _RecordCount
      End Get
      Set(ByVal value As Integer)
        _RecordCount = value
      End Set
    End Property
    Public Class PKmktEnquiryHistory
      Private _HistoryID As Int32 = 0
      Private _SerialNo As Int32 = 0
      Public Property HistoryID() As Int32
        Get
          Return _HistoryID
        End Get
        Set(ByVal value As Int32)
          _HistoryID = value
        End Set
      End Property
      Public Property SerialNo() As Int32
        Get
          Return _SerialNo
        End Get
        Set(ByVal value As Int32)
          _SerialNo = value
        End Set
      End Property
    End Class
    Public ReadOnly Property FK_MKT_EnquiryHistory_SerialNo() As SIS.MKT.mktEnquiry
      Get
        If _FK_MKT_EnquiryHistory_SerialNo Is Nothing Then
          _FK_MKT_EnquiryHistory_SerialNo = SIS.MKT.mktEnquiry.mktEnquiryGetByID(_SerialNo)
        End If
        Return _FK_MKT_EnquiryHistory_SerialNo
      End Get
    End Property
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquiryHistoryGetNewRecord() As SIS.MKT.mktEnquiryHistory
      Return New SIS.MKT.mktEnquiryHistory()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquiryHistoryGetByID(ByVal HistoryID As Int32, ByVal SerialNo As Int32) As SIS.MKT.mktEnquiryHistory
      Dim Results As SIS.MKT.mktEnquiryHistory = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryHistorySelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@HistoryID",SqlDbType.Int,HistoryID.ToString.Length, HistoryID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo",SqlDbType.Int,SerialNo.ToString.Length, SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Reader.Read() Then
            Results = New SIS.MKT.mktEnquiryHistory(Reader)
          End If
          Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquiryHistorySelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal SerialNo As Int32) As List(Of SIS.MKT.mktEnquiryHistory)
      Dim Results As List(Of SIS.MKT.mktEnquiryHistory) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "spmktEnquiryHistorySelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "spmktEnquiryHistorySelectListFilteres"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_SerialNo",SqlDbType.Int,10, IIf(SerialNo = Nothing, 0,SerialNo))
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.MKT.mktEnquiryHistory)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.MKT.mktEnquiryHistory(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function mktEnquiryHistorySelectCount(ByVal SearchState As Boolean, ByVal SearchText As String, ByVal SerialNo As Int32) As Integer
      Return _RecordCount
    End Function
      'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquiryHistoryGetByID(ByVal HistoryID As Int32, ByVal SerialNo As Int32, ByVal Filter_SerialNo As Int32) As SIS.MKT.mktEnquiryHistory
      Return mktEnquiryHistoryGetByID(HistoryID, SerialNo)
    End Function
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function mktEnquiryHistoryInsert(ByVal Record As SIS.MKT.mktEnquiryHistory) As SIS.MKT.mktEnquiryHistory
      Dim _Rec As SIS.MKT.mktEnquiryHistory = SIS.MKT.mktEnquiryHistory.mktEnquiryHistoryGetNewRecord()
      With _Rec
        .SerialNo = Record.SerialNo
        .ProspectNo = Record.ProspectNo
        .MktVericalID = Record.MktVericalID
        .CustomerID = Record.CustomerID
        .CustomerName = Record.CustomerName
        .MktSiteID = Record.MktSiteID
        .MktRegionID = Record.MktRegionID
        .IndianStateID = Record.IndianStateID
        .SiteLocation = Record.SiteLocation
        .SalesPersonList = Record.SalesPersonList
        .ResponsibleSalsePerson = Record.ResponsibleSalsePerson
        .ProjectID = Record.ProjectID
        .ProjectName = Record.ProjectName
        .ProjectConsultant = Record.ProjectConsultant
        .BidApprovalRequired = Record.BidApprovalRequired
        .ProjectBaseID = Record.ProjectBaseID
        .CustomerKeyOfficials = Record.CustomerKeyOfficials
        .BidSubmissionDate = Record.BidSubmissionDate
        .OrderFinalizationYear = Record.OrderFinalizationYear
        .OrderFinalizationMonth = Record.OrderFinalizationMonth
        .ApproxProjectValue = Record.ApproxProjectValue
        .EnquiryTypeID = Record.EnquiryTypeID
        .Competitors = Record.Competitors
        .ProjectFunding = Record.ProjectFunding
        .BidderTypeID = Record.BidderTypeID
        .BriefScope = Record.BriefScope
        .ProjectStatus = Record.ProjectStatus
        .PPAStatus = Record.PPAStatus
        .LandAcquisitionStatus = Record.LandAcquisitionStatus
        .StatutoryClearanceStatus = Record.StatutoryClearanceStatus
        .PreQualificationRequirement = Record.PreQualificationRequirement
        .ProposedRiskreviewdate = Record.ProposedRiskreviewdate
        .RiskReviewMeetingComments = Record.RiskReviewMeetingComments
        .RiskReviewApproval = Record.RiskReviewApproval
        .CreatedBy = Record.CreatedBy
        .CreatedOn = Record.CreatedOn
        .ModifiedBy = Record.ModifiedBy
        .ModifiedOn = Record.ModifiedOn
        .StatusID = Record.StatusID
        .EnquiryDate = Record.EnquiryDate
      End With
      Return SIS.MKT.mktEnquiryHistory.InsertData(_Rec)
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.MKT.mktEnquiryHistory) As SIS.MKT.mktEnquiryHistory
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryHistoryInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo",SqlDbType.Int,11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProspectNo",SqlDbType.NVarChar,51, Record.ProspectNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktVericalID",SqlDbType.Int,11, Iif(Record.MktVericalID= "" ,Convert.DBNull, Record.MktVericalID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerID",SqlDbType.NVarChar,10, Iif(Record.CustomerID= "" ,Convert.DBNull, Record.CustomerID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerName",SqlDbType.NVarChar,251, Record.CustomerName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktSiteID",SqlDbType.Int,11, Iif(Record.MktSiteID= "" ,Convert.DBNull, Record.MktSiteID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktRegionID",SqlDbType.Int,11, Iif(Record.MktRegionID= "" ,Convert.DBNull, Record.MktRegionID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@IndianStateID",SqlDbType.NVarChar,3, Iif(Record.IndianStateID= "" ,Convert.DBNull, Record.IndianStateID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SiteLocation",SqlDbType.NVarChar,251, Iif(Record.SiteLocation= "" ,Convert.DBNull, Record.SiteLocation))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SalesPersonList",SqlDbType.NVarChar,251, Iif(Record.SalesPersonList= "" ,Convert.DBNull, Record.SalesPersonList))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ResponsibleSalsePerson",SqlDbType.NVarChar,9, Record.ResponsibleSalsePerson)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectID",SqlDbType.NVarChar,7, Iif(Record.ProjectID= "" ,Convert.DBNull, Record.ProjectID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectName",SqlDbType.NVarChar,251, Record.ProjectName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectConsultant",SqlDbType.NVarChar,251, Iif(Record.ProjectConsultant= "" ,Convert.DBNull, Record.ProjectConsultant))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidApprovalRequired",SqlDbType.Bit,3, Record.BidApprovalRequired)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectBaseID",SqlDbType.Int,11, Iif(Record.ProjectBaseID= "" ,Convert.DBNull, Record.ProjectBaseID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerKeyOfficials",SqlDbType.NVarChar,251, Iif(Record.CustomerKeyOfficials= "" ,Convert.DBNull, Record.CustomerKeyOfficials))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidSubmissionDate",SqlDbType.DateTime,21, Iif(Record.BidSubmissionDate= "" ,Convert.DBNull, Record.BidSubmissionDate))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderFinalizationYear",SqlDbType.Int,11, Iif(Record.OrderFinalizationYear= "" ,Convert.DBNull, Record.OrderFinalizationYear))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderFinalizationMonth",SqlDbType.Int,11, Iif(Record.OrderFinalizationMonth= "" ,Convert.DBNull, Record.OrderFinalizationMonth))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproxProjectValue",SqlDbType.NVarChar,251, Iif(Record.ApproxProjectValue= "" ,Convert.DBNull, Record.ApproxProjectValue))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EnquiryTypeID",SqlDbType.Int,11, Iif(Record.EnquiryTypeID= "" ,Convert.DBNull, Record.EnquiryTypeID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Competitors",SqlDbType.NVarChar,251, Iif(Record.Competitors= "" ,Convert.DBNull, Record.Competitors))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectFunding",SqlDbType.NVarChar,251, Iif(Record.ProjectFunding= "" ,Convert.DBNull, Record.ProjectFunding))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidderTypeID",SqlDbType.Int,11, Iif(Record.BidderTypeID= "" ,Convert.DBNull, Record.BidderTypeID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BriefScope",SqlDbType.NVarChar,1001, Iif(Record.BriefScope= "" ,Convert.DBNull, Record.BriefScope))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectStatus",SqlDbType.NVarChar,251, Iif(Record.ProjectStatus= "" ,Convert.DBNull, Record.ProjectStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@PPAStatus",SqlDbType.NVarChar,251, Iif(Record.PPAStatus= "" ,Convert.DBNull, Record.PPAStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LandAcquisitionStatus",SqlDbType.NVarChar,251, Iif(Record.LandAcquisitionStatus= "" ,Convert.DBNull, Record.LandAcquisitionStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatutoryClearanceStatus",SqlDbType.NVarChar,251, Iif(Record.StatutoryClearanceStatus= "" ,Convert.DBNull, Record.StatutoryClearanceStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@PreQualificationRequirement",SqlDbType.NVarChar,251, Iif(Record.PreQualificationRequirement= "" ,Convert.DBNull, Record.PreQualificationRequirement))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProposedRiskreviewdate",SqlDbType.DateTime,21, Iif(Record.ProposedRiskreviewdate= "" ,Convert.DBNull, Record.ProposedRiskreviewdate))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RiskReviewMeetingComments",SqlDbType.NVarChar,1001, Iif(Record.RiskReviewMeetingComments= "" ,Convert.DBNull, Record.RiskReviewMeetingComments))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RiskReviewApproval",SqlDbType.Bit,3, Record.RiskReviewApproval)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedBy",SqlDbType.NVarChar,9, Iif(Record.CreatedBy= "" ,Convert.DBNull, Record.CreatedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedOn",SqlDbType.DateTime,21, Iif(Record.CreatedOn= "" ,Convert.DBNull, Record.CreatedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedBy",SqlDbType.NVarChar,9, Iif(Record.ModifiedBy= "" ,Convert.DBNull, Record.ModifiedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedOn",SqlDbType.DateTime,21, Iif(Record.ModifiedOn= "" ,Convert.DBNull, Record.ModifiedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,11, Iif(Record.StatusID= "" ,Convert.DBNull, Record.StatusID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EnquiryDate",SqlDbType.DateTime,21, Record.EnquiryDate)
          Cmd.Parameters.Add("@Return_HistoryID", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_HistoryID").Direction = ParameterDirection.Output
          Cmd.Parameters.Add("@Return_SerialNo", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_SerialNo").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          Record.HistoryID = Cmd.Parameters("@Return_HistoryID").Value
          Record.SerialNo = Cmd.Parameters("@Return_SerialNo").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function mktEnquiryHistoryUpdate(ByVal Record As SIS.MKT.mktEnquiryHistory) As SIS.MKT.mktEnquiryHistory
      Dim _Rec As SIS.MKT.mktEnquiryHistory = SIS.MKT.mktEnquiryHistory.mktEnquiryHistoryGetByID(Record.HistoryID, Record.SerialNo)
      With _Rec
        .ProspectNo = Record.ProspectNo
        .MktVericalID = Record.MktVericalID
        .CustomerID = Record.CustomerID
        .CustomerName = Record.CustomerName
        .MktSiteID = Record.MktSiteID
        .MktRegionID = Record.MktRegionID
        .IndianStateID = Record.IndianStateID
        .SiteLocation = Record.SiteLocation
        .SalesPersonList = Record.SalesPersonList
        .ResponsibleSalsePerson = Record.ResponsibleSalsePerson
        .ProjectID = Record.ProjectID
        .ProjectName = Record.ProjectName
        .ProjectConsultant = Record.ProjectConsultant
        .BidApprovalRequired = Record.BidApprovalRequired
        .ProjectBaseID = Record.ProjectBaseID
        .CustomerKeyOfficials = Record.CustomerKeyOfficials
        .BidSubmissionDate = Record.BidSubmissionDate
        .OrderFinalizationYear = Record.OrderFinalizationYear
        .OrderFinalizationMonth = Record.OrderFinalizationMonth
        .ApproxProjectValue = Record.ApproxProjectValue
        .EnquiryTypeID = Record.EnquiryTypeID
        .Competitors = Record.Competitors
        .ProjectFunding = Record.ProjectFunding
        .BidderTypeID = Record.BidderTypeID
        .BriefScope = Record.BriefScope
        .ProjectStatus = Record.ProjectStatus
        .PPAStatus = Record.PPAStatus
        .LandAcquisitionStatus = Record.LandAcquisitionStatus
        .StatutoryClearanceStatus = Record.StatutoryClearanceStatus
        .PreQualificationRequirement = Record.PreQualificationRequirement
        .ProposedRiskreviewdate = Record.ProposedRiskreviewdate
        .RiskReviewMeetingComments = Record.RiskReviewMeetingComments
        .RiskReviewApproval = Record.RiskReviewApproval
        .CreatedBy = Record.CreatedBy
        .CreatedOn = Record.CreatedOn
        .ModifiedBy = Record.ModifiedBy
        .ModifiedOn = Record.ModifiedOn
        .StatusID = Record.StatusID
        .EnquiryDate = Record.EnquiryDate
      End With
      Return SIS.MKT.mktEnquiryHistory.UpdateData(_Rec)
    End Function
    Public Shared Function UpdateData(ByVal Record As SIS.MKT.mktEnquiryHistory) As SIS.MKT.mktEnquiryHistory
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryHistoryUpdate"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_HistoryID",SqlDbType.Int,11, Record.HistoryID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SerialNo",SqlDbType.Int,11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo",SqlDbType.Int,11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProspectNo",SqlDbType.NVarChar,51, Record.ProspectNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktVericalID",SqlDbType.Int,11, Iif(Record.MktVericalID= "" ,Convert.DBNull, Record.MktVericalID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerID",SqlDbType.NVarChar,10, Iif(Record.CustomerID= "" ,Convert.DBNull, Record.CustomerID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerName",SqlDbType.NVarChar,251, Record.CustomerName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktSiteID",SqlDbType.Int,11, Iif(Record.MktSiteID= "" ,Convert.DBNull, Record.MktSiteID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktRegionID",SqlDbType.Int,11, Iif(Record.MktRegionID= "" ,Convert.DBNull, Record.MktRegionID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@IndianStateID",SqlDbType.NVarChar,3, Iif(Record.IndianStateID= "" ,Convert.DBNull, Record.IndianStateID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SiteLocation",SqlDbType.NVarChar,251, Iif(Record.SiteLocation= "" ,Convert.DBNull, Record.SiteLocation))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SalesPersonList",SqlDbType.NVarChar,251, Iif(Record.SalesPersonList= "" ,Convert.DBNull, Record.SalesPersonList))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ResponsibleSalsePerson",SqlDbType.NVarChar,9, Record.ResponsibleSalsePerson)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectID",SqlDbType.NVarChar,7, Iif(Record.ProjectID= "" ,Convert.DBNull, Record.ProjectID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectName",SqlDbType.NVarChar,251, Record.ProjectName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectConsultant",SqlDbType.NVarChar,251, Iif(Record.ProjectConsultant= "" ,Convert.DBNull, Record.ProjectConsultant))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidApprovalRequired",SqlDbType.Bit,3, Record.BidApprovalRequired)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectBaseID",SqlDbType.Int,11, Iif(Record.ProjectBaseID= "" ,Convert.DBNull, Record.ProjectBaseID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerKeyOfficials",SqlDbType.NVarChar,251, Iif(Record.CustomerKeyOfficials= "" ,Convert.DBNull, Record.CustomerKeyOfficials))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidSubmissionDate",SqlDbType.DateTime,21, Iif(Record.BidSubmissionDate= "" ,Convert.DBNull, Record.BidSubmissionDate))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderFinalizationYear",SqlDbType.Int,11, Iif(Record.OrderFinalizationYear= "" ,Convert.DBNull, Record.OrderFinalizationYear))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderFinalizationMonth",SqlDbType.Int,11, Iif(Record.OrderFinalizationMonth= "" ,Convert.DBNull, Record.OrderFinalizationMonth))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproxProjectValue",SqlDbType.NVarChar,251, Iif(Record.ApproxProjectValue= "" ,Convert.DBNull, Record.ApproxProjectValue))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EnquiryTypeID",SqlDbType.Int,11, Iif(Record.EnquiryTypeID= "" ,Convert.DBNull, Record.EnquiryTypeID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Competitors",SqlDbType.NVarChar,251, Iif(Record.Competitors= "" ,Convert.DBNull, Record.Competitors))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectFunding",SqlDbType.NVarChar,251, Iif(Record.ProjectFunding= "" ,Convert.DBNull, Record.ProjectFunding))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BidderTypeID",SqlDbType.Int,11, Iif(Record.BidderTypeID= "" ,Convert.DBNull, Record.BidderTypeID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@BriefScope",SqlDbType.NVarChar,1001, Iif(Record.BriefScope= "" ,Convert.DBNull, Record.BriefScope))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectStatus",SqlDbType.NVarChar,251, Iif(Record.ProjectStatus= "" ,Convert.DBNull, Record.ProjectStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@PPAStatus",SqlDbType.NVarChar,251, Iif(Record.PPAStatus= "" ,Convert.DBNull, Record.PPAStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LandAcquisitionStatus",SqlDbType.NVarChar,251, Iif(Record.LandAcquisitionStatus= "" ,Convert.DBNull, Record.LandAcquisitionStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatutoryClearanceStatus",SqlDbType.NVarChar,251, Iif(Record.StatutoryClearanceStatus= "" ,Convert.DBNull, Record.StatutoryClearanceStatus))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@PreQualificationRequirement",SqlDbType.NVarChar,251, Iif(Record.PreQualificationRequirement= "" ,Convert.DBNull, Record.PreQualificationRequirement))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProposedRiskreviewdate",SqlDbType.DateTime,21, Iif(Record.ProposedRiskreviewdate= "" ,Convert.DBNull, Record.ProposedRiskreviewdate))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RiskReviewMeetingComments",SqlDbType.NVarChar,1001, Iif(Record.RiskReviewMeetingComments= "" ,Convert.DBNull, Record.RiskReviewMeetingComments))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RiskReviewApproval",SqlDbType.Bit,3, Record.RiskReviewApproval)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedBy",SqlDbType.NVarChar,9, Iif(Record.CreatedBy= "" ,Convert.DBNull, Record.CreatedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedOn",SqlDbType.DateTime,21, Iif(Record.CreatedOn= "" ,Convert.DBNull, Record.CreatedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedBy",SqlDbType.NVarChar,9, Iif(Record.ModifiedBy= "" ,Convert.DBNull, Record.ModifiedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedOn",SqlDbType.DateTime,21, Iif(Record.ModifiedOn= "" ,Convert.DBNull, Record.ModifiedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,11, Iif(Record.StatusID= "" ,Convert.DBNull, Record.StatusID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EnquiryDate",SqlDbType.DateTime,21, Record.EnquiryDate)
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Delete, True)> _
    Public Shared Function mktEnquiryHistoryDelete(ByVal Record As SIS.MKT.mktEnquiryHistory) As Int32
      Dim _Result as Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryHistoryDelete"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_HistoryID",SqlDbType.Int,Record.HistoryID.ToString.Length, Record.HistoryID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SerialNo",SqlDbType.Int,Record.SerialNo.ToString.Length, Record.SerialNo)
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return _RecordCount
    End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      SIS.SYS.SQLDatabase.DBCommon.NewObj(Me, Reader)
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace

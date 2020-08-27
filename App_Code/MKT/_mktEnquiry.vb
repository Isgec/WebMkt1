Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.MKT
  <DataObject()> _
  Partial Public Class mktEnquiry
    Private Shared _RecordCount As Integer
    Public Property SerialNo As Int32 = 0
    Public Property ProspectNo As String = ""
    Private _EnquiryDate As String = ""
    Public Property MktVericalID As String = ""
    Public Property CustomerName As String = ""
    Public Property CustomerID As String = ""
    Public Property MktSiteID As String = ""
    Public Property MktRegionID As String = ""
    Public Property IndianStateID As String = ""
    Public Property SiteLocation As String = ""
    Public Property ResponsibleSalsePerson As String = ""
    Public Property ProjectName As String = ""
    Public Property ProjectID As String = ""
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
    Public Property ModifiedBy As String = ""
    Public Property StatusID As String = ""
    Private _CreatedOn As String = ""
    Private _ModifiedOn As String = ""
    Public Property CreatedBy As String = ""
    Public Property SalesPersonList As String = ""
    Public Property aspnet_Users1_UserFullName As String = ""
    Public Property aspnet_Users2_UserFullName As String = ""
    Public Property aspnet_Users3_UserFullName As String = ""
    Public Property IDM_Projects4_Description As String = ""
    Public Property MKT_BidderTypes5_BidderName As String = ""
    Public Property MKT_EnquiryStatus6_StatusName As String = ""
    Public Property MKT_EnquiryTypes7_EnquiryTypeName As String = ""
    Public Property MKT_Months8_MonthName As String = ""
    Public Property MKT_ProjectBases9_BaseName As String = ""
    Public Property MKT_Regions10_RegionName As String = ""
    Public Property MKT_Sites11_SiteName As String = ""
    Public Property MKT_Verticals12_VerticalName As String = ""
    Public Property MKT_Years13_YearName As String = ""
    Public Property SPMT_ERPStates14_Description As String = ""
    Public Property VR_BusinessPartner15_BPName As String = ""
    Private _FK_MKT_Enquiry_SalesPerson As SIS.QCM.qcmUsers = Nothing
    Private _FK_MKT_Enquiry_CreatedBy As SIS.QCM.qcmUsers = Nothing
    Private _FK_MKT_Enquiry_ModifiedBy As SIS.QCM.qcmUsers = Nothing
    Private _FK_MKT_Enquiry_ProjectID As SIS.QCM.qcmProjects = Nothing
    Private _FK_MKT_Enquiry_BidderTypeID As SIS.MKT.mktBidderTypes = Nothing
    Private _FK_MKT_Enquiry_StatusID As SIS.MKT.mktEnquiryStatus = Nothing
    Private _FK_MKT_Enquiry_EnquiryTypeID As SIS.MKT.mktEnquiryTypes = Nothing
    Private _FK_MKT_Enquiry_OrderMonth As SIS.MKT.mktMonths = Nothing
    Private _FK_MKT_Enquiry_ProjectBaseID As SIS.MKT.mktProjectBases = Nothing
    Private _FK_MKT_Enquiry_MktRegionID As SIS.MKT.mktRegions = Nothing
    Private _FK_MKT_Enquiry_MktSiteID As SIS.MKT.mktSites = Nothing
    Private _FK_MKT_Enquiry_MktVerticalID As SIS.MKT.mktVerticals = Nothing
    Private _FK_MKT_Enquiry_OrderYear As SIS.MKT.mktYears = Nothing
    Private _FK_MKT_Enquiry_IndianStateID As SIS.SPMT.spmtERPStates = Nothing
    Private _FK_MKT_Enquiry_CustomerID As SIS.VR.vrBusinessPartner = Nothing
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
    Public Readonly Property DisplayField() As String
      Get
        Return "" & _ProspectNo.ToString.PadRight(50, " ")
      End Get
    End Property
    Public Readonly Property PrimaryKey() As String
      Get
        Return _SerialNo
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
    Public Class PKmktEnquiry
      Private _SerialNo As Int32 = 0
      Public Property SerialNo() As Int32
        Get
          Return _SerialNo
        End Get
        Set(ByVal value As Int32)
          _SerialNo = value
        End Set
      End Property
    End Class
    Public ReadOnly Property FK_MKT_Enquiry_SalesPerson() As SIS.QCM.qcmUsers
      Get
        If _FK_MKT_Enquiry_SalesPerson Is Nothing Then
          _FK_MKT_Enquiry_SalesPerson = SIS.QCM.qcmUsers.qcmUsersGetByID(_ResponsibleSalsePerson)
        End If
        Return _FK_MKT_Enquiry_SalesPerson
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_CreatedBy() As SIS.QCM.qcmUsers
      Get
        If _FK_MKT_Enquiry_CreatedBy Is Nothing Then
          _FK_MKT_Enquiry_CreatedBy = SIS.QCM.qcmUsers.qcmUsersGetByID(_CreatedBy)
        End If
        Return _FK_MKT_Enquiry_CreatedBy
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_ModifiedBy() As SIS.QCM.qcmUsers
      Get
        If _FK_MKT_Enquiry_ModifiedBy Is Nothing Then
          _FK_MKT_Enquiry_ModifiedBy = SIS.QCM.qcmUsers.qcmUsersGetByID(_ModifiedBy)
        End If
        Return _FK_MKT_Enquiry_ModifiedBy
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_ProjectID() As SIS.QCM.qcmProjects
      Get
        If _FK_MKT_Enquiry_ProjectID Is Nothing Then
          _FK_MKT_Enquiry_ProjectID = SIS.QCM.qcmProjects.qcmProjectsGetByID(_ProjectID)
        End If
        Return _FK_MKT_Enquiry_ProjectID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_BidderTypeID() As SIS.MKT.mktBidderTypes
      Get
        If _FK_MKT_Enquiry_BidderTypeID Is Nothing Then
          _FK_MKT_Enquiry_BidderTypeID = SIS.MKT.mktBidderTypes.mktBidderTypesGetByID(_BidderTypeID)
        End If
        Return _FK_MKT_Enquiry_BidderTypeID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_StatusID() As SIS.MKT.mktEnquiryStatus
      Get
        If _FK_MKT_Enquiry_StatusID Is Nothing Then
          _FK_MKT_Enquiry_StatusID = SIS.MKT.mktEnquiryStatus.mktEnquiryStatusGetByID(_StatusID)
        End If
        Return _FK_MKT_Enquiry_StatusID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_EnquiryTypeID() As SIS.MKT.mktEnquiryTypes
      Get
        If _FK_MKT_Enquiry_EnquiryTypeID Is Nothing Then
          _FK_MKT_Enquiry_EnquiryTypeID = SIS.MKT.mktEnquiryTypes.mktEnquiryTypesGetByID(_EnquiryTypeID)
        End If
        Return _FK_MKT_Enquiry_EnquiryTypeID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_OrderMonth() As SIS.MKT.mktMonths
      Get
        If _FK_MKT_Enquiry_OrderMonth Is Nothing Then
          _FK_MKT_Enquiry_OrderMonth = SIS.MKT.mktMonths.mktMonthsGetByID(_OrderFinalizationMonth)
        End If
        Return _FK_MKT_Enquiry_OrderMonth
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_ProjectBaseID() As SIS.MKT.mktProjectBases
      Get
        If _FK_MKT_Enquiry_ProjectBaseID Is Nothing Then
          _FK_MKT_Enquiry_ProjectBaseID = SIS.MKT.mktProjectBases.mktProjectBasesGetByID(_ProjectBaseID)
        End If
        Return _FK_MKT_Enquiry_ProjectBaseID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_MktRegionID() As SIS.MKT.mktRegions
      Get
        If _FK_MKT_Enquiry_MktRegionID Is Nothing Then
          _FK_MKT_Enquiry_MktRegionID = SIS.MKT.mktRegions.mktRegionsGetByID(_MktRegionID)
        End If
        Return _FK_MKT_Enquiry_MktRegionID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_MktSiteID() As SIS.MKT.mktSites
      Get
        If _FK_MKT_Enquiry_MktSiteID Is Nothing Then
          _FK_MKT_Enquiry_MktSiteID = SIS.MKT.mktSites.mktSitesGetByID(_MktSiteID)
        End If
        Return _FK_MKT_Enquiry_MktSiteID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_MktVerticalID() As SIS.MKT.mktVerticals
      Get
        If _FK_MKT_Enquiry_MktVerticalID Is Nothing Then
          _FK_MKT_Enquiry_MktVerticalID = SIS.MKT.mktVerticals.mktVerticalsGetByID(_MktVericalID)
        End If
        Return _FK_MKT_Enquiry_MktVerticalID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_OrderYear() As SIS.MKT.mktYears
      Get
        If _FK_MKT_Enquiry_OrderYear Is Nothing Then
          _FK_MKT_Enquiry_OrderYear = SIS.MKT.mktYears.mktYearsGetByID(_OrderFinalizationYear)
        End If
        Return _FK_MKT_Enquiry_OrderYear
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_IndianStateID() As SIS.SPMT.spmtERPStates
      Get
        If _FK_MKT_Enquiry_IndianStateID Is Nothing Then
          _FK_MKT_Enquiry_IndianStateID = SIS.SPMT.spmtERPStates.spmtERPStatesGetByID(_IndianStateID)
        End If
        Return _FK_MKT_Enquiry_IndianStateID
      End Get
    End Property
    Public ReadOnly Property FK_MKT_Enquiry_CustomerID() As SIS.VR.vrBusinessPartner
      Get
        If _FK_MKT_Enquiry_CustomerID Is Nothing Then
          _FK_MKT_Enquiry_CustomerID = SIS.VR.vrBusinessPartner.vrBusinessPartnerGetByID(_CustomerID)
        End If
        Return _FK_MKT_Enquiry_CustomerID
      End Get
    End Property
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquirySelectList(ByVal OrderBy As String) As List(Of SIS.MKT.mktEnquiry)
      Dim Results As List(Of SIS.MKT.mktEnquiry) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "SerialNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquirySelectList"
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquiryGetNewRecord() As SIS.MKT.mktEnquiry
      Return New SIS.MKT.mktEnquiry()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquiryGetByID(ByVal SerialNo As Int32) As SIS.MKT.mktEnquiry
      Dim Results As SIS.MKT.mktEnquiry = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquirySelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo",SqlDbType.Int,SerialNo.ToString.Length, SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Reader.Read() Then
            Results = New SIS.MKT.mktEnquiry(Reader)
          End If
          Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquirySelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal MktVericalID As Int32, ByVal MktSiteID As Int32, ByVal IndianStateID As String, ByVal EnquiryTypeID As Int32) As List(Of SIS.MKT.mktEnquiry)
      Dim Results As List(Of SIS.MKT.mktEnquiry) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "SerialNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "spmktEnquirySelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
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
    Public Shared Function mktEnquirySelectCount(ByVal SearchState As Boolean, ByVal SearchText As String, ByVal MktVericalID As Int32, ByVal MktSiteID As Int32, ByVal IndianStateID As String, ByVal EnquiryTypeID As Int32) As Integer
      Return _RecordCount
    End Function
      'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktEnquiryGetByID(ByVal SerialNo As Int32, ByVal Filter_MktVericalID As Int32, ByVal Filter_MktSiteID As Int32, ByVal Filter_IndianStateID As String, ByVal Filter_EnquiryTypeID As Int32) As SIS.MKT.mktEnquiry
      Return mktEnquiryGetByID(SerialNo)
    End Function
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function mktEnquiryInsert(ByVal Record As SIS.MKT.mktEnquiry) As SIS.MKT.mktEnquiry
      Dim _Rec As SIS.MKT.mktEnquiry = SIS.MKT.mktEnquiry.mktEnquiryGetNewRecord()
      With _Rec
        .ProspectNo = Record.ProspectNo
        .EnquiryDate = Record.EnquiryDate
        .MktVericalID = Record.MktVericalID
        .CustomerName = Record.CustomerName
        .CustomerID = Record.CustomerID
        .MktSiteID = Record.MktSiteID
        .MktRegionID = Record.MktRegionID
        .IndianStateID = Record.IndianStateID
        .SiteLocation = Record.SiteLocation
        .ResponsibleSalsePerson = Record.ResponsibleSalsePerson
        .ProjectName = Record.ProjectName
        .ProjectID = Record.ProjectID
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
        .ModifiedBy =  Global.System.Web.HttpContext.Current.Session("LoginID")
        .StatusID = 1
        .CreatedOn = Now
        .ModifiedOn = Now
        .CreatedBy =  Global.System.Web.HttpContext.Current.Session("LoginID")
        .SalesPersonList = Record.SalesPersonList
      End With
      Return SIS.MKT.mktEnquiry.InsertData(_Rec)
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.MKT.mktEnquiry) As SIS.MKT.mktEnquiry
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProspectNo",SqlDbType.NVarChar,51, Record.ProspectNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EnquiryDate",SqlDbType.DateTime,21, Record.EnquiryDate)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktVericalID",SqlDbType.Int,11, Iif(Record.MktVericalID= "" ,Convert.DBNull, Record.MktVericalID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerName",SqlDbType.NVarChar,251, Record.CustomerName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerID",SqlDbType.NVarChar,10, Iif(Record.CustomerID= "" ,Convert.DBNull, Record.CustomerID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktSiteID",SqlDbType.Int,11, Iif(Record.MktSiteID= "" ,Convert.DBNull, Record.MktSiteID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktRegionID",SqlDbType.Int,11, Iif(Record.MktRegionID= "" ,Convert.DBNull, Record.MktRegionID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@IndianStateID",SqlDbType.NVarChar,3, Iif(Record.IndianStateID= "" ,Convert.DBNull, Record.IndianStateID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SiteLocation",SqlDbType.NVarChar,251, Iif(Record.SiteLocation= "" ,Convert.DBNull, Record.SiteLocation))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ResponsibleSalsePerson",SqlDbType.NVarChar,9, Record.ResponsibleSalsePerson)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectName",SqlDbType.NVarChar,251, Record.ProjectName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectID",SqlDbType.NVarChar,7, Iif(Record.ProjectID= "" ,Convert.DBNull, Record.ProjectID))
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
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedBy",SqlDbType.NVarChar,9, Iif(Record.ModifiedBy= "" ,Convert.DBNull, Record.ModifiedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,11, Iif(Record.StatusID= "" ,Convert.DBNull, Record.StatusID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedOn",SqlDbType.DateTime,21, Iif(Record.CreatedOn= "" ,Convert.DBNull, Record.CreatedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedOn",SqlDbType.DateTime,21, Iif(Record.ModifiedOn= "" ,Convert.DBNull, Record.ModifiedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedBy",SqlDbType.NVarChar,9, Iif(Record.CreatedBy= "" ,Convert.DBNull, Record.CreatedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SalesPersonList",SqlDbType.NVarChar,251, Iif(Record.SalesPersonList= "" ,Convert.DBNull, Record.SalesPersonList))
          Cmd.Parameters.Add("@Return_SerialNo", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_SerialNo").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          Record.SerialNo = Cmd.Parameters("@Return_SerialNo").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function mktEnquiryUpdate(ByVal Record As SIS.MKT.mktEnquiry) As SIS.MKT.mktEnquiry
      Dim _Rec As SIS.MKT.mktEnquiry = SIS.MKT.mktEnquiry.mktEnquiryGetByID(Record.SerialNo)
      With _Rec
        .ProspectNo = Record.ProspectNo
        .EnquiryDate = Record.EnquiryDate
        .MktVericalID = Record.MktVericalID
        .CustomerName = Record.CustomerName
        .CustomerID = Record.CustomerID
        .MktSiteID = Record.MktSiteID
        .MktRegionID = Record.MktRegionID
        .IndianStateID = Record.IndianStateID
        .SiteLocation = Record.SiteLocation
        .ResponsibleSalsePerson = Record.ResponsibleSalsePerson
        .ProjectName = Record.ProjectName
        .ProjectID = Record.ProjectID
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
        .ModifiedBy = Global.System.Web.HttpContext.Current.Session("LoginID")
        .StatusID = Record.StatusID
        .CreatedOn = Record.CreatedOn
        .ModifiedOn = Now
        .CreatedBy = Global.System.Web.HttpContext.Current.Session("Record.CreatedBy")
        .SalesPersonList = Record.SalesPersonList
      End With
      Return SIS.MKT.mktEnquiry.UpdateData(_Rec)
    End Function
    Public Shared Function UpdateData(ByVal Record As SIS.MKT.mktEnquiry) As SIS.MKT.mktEnquiry
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryUpdate"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SerialNo",SqlDbType.Int,11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProspectNo",SqlDbType.NVarChar,51, Record.ProspectNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EnquiryDate",SqlDbType.DateTime,21, Record.EnquiryDate)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktVericalID",SqlDbType.Int,11, Iif(Record.MktVericalID= "" ,Convert.DBNull, Record.MktVericalID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerName",SqlDbType.NVarChar,251, Record.CustomerName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CustomerID",SqlDbType.NVarChar,10, Iif(Record.CustomerID= "" ,Convert.DBNull, Record.CustomerID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktSiteID",SqlDbType.Int,11, Iif(Record.MktSiteID= "" ,Convert.DBNull, Record.MktSiteID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MktRegionID",SqlDbType.Int,11, Iif(Record.MktRegionID= "" ,Convert.DBNull, Record.MktRegionID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@IndianStateID",SqlDbType.NVarChar,3, Iif(Record.IndianStateID= "" ,Convert.DBNull, Record.IndianStateID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SiteLocation",SqlDbType.NVarChar,251, Iif(Record.SiteLocation= "" ,Convert.DBNull, Record.SiteLocation))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ResponsibleSalsePerson",SqlDbType.NVarChar,9, Record.ResponsibleSalsePerson)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectName",SqlDbType.NVarChar,251, Record.ProjectName)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectID",SqlDbType.NVarChar,7, Iif(Record.ProjectID= "" ,Convert.DBNull, Record.ProjectID))
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
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedBy",SqlDbType.NVarChar,9, Iif(Record.ModifiedBy= "" ,Convert.DBNull, Record.ModifiedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,11, Iif(Record.StatusID= "" ,Convert.DBNull, Record.StatusID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedOn",SqlDbType.DateTime,21, Iif(Record.CreatedOn= "" ,Convert.DBNull, Record.CreatedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModifiedOn",SqlDbType.DateTime,21, Iif(Record.ModifiedOn= "" ,Convert.DBNull, Record.ModifiedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedBy",SqlDbType.NVarChar,9, Iif(Record.CreatedBy= "" ,Convert.DBNull, Record.CreatedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SalesPersonList",SqlDbType.NVarChar,251, Iif(Record.SalesPersonList= "" ,Convert.DBNull, Record.SalesPersonList))
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
    Public Shared Function mktEnquiryDelete(ByVal Record As SIS.MKT.mktEnquiry) As Int32
      Dim _Result as Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryDelete"
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
'    Autocomplete Method
    Public Shared Function SelectmktEnquiryAutoCompleteList(ByVal Prefix As String, ByVal count As Integer, ByVal contextKey As String) As String()
      Dim Results As List(Of String) = Nothing
      Dim aVal() As String = contextKey.Split("|".ToCharArray)
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktEnquiryAutoCompleteList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@prefix", SqlDbType.NVarChar, 50, Prefix)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@records", SqlDbType.Int, -1, count)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@bycode", SqlDbType.Int, 1, IIf(IsNumeric(Prefix), 0, 1))
          Results = New List(Of String)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Not Reader.HasRows Then
            Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem("---Select Value---".PadRight(50, " "),""))
          End If
          While (Reader.Read())
            Dim Tmp As SIS.MKT.mktEnquiry = New SIS.MKT.mktEnquiry(Reader)
            Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Tmp.DisplayField, Tmp.PrimaryKey))
          End While
          Reader.Close()
        End Using
      End Using
      Return Results.ToArray
    End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      SIS.SYS.SQLDatabase.DBCommon.NewObj(Me, Reader)
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace

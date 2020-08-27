SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquirySelectList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquirySelectList]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquirySelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [MKT_Enquiry].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [IDM_Projects4].[Description] AS IDM_Projects4_Description,
    [MKT_BidderTypes5].[BidderName] AS MKT_BidderTypes5_BidderName,
    [MKT_EnquiryStatus6].[StatusName] AS MKT_EnquiryStatus6_StatusName,
    [MKT_EnquiryTypes7].[EnquiryTypeName] AS MKT_EnquiryTypes7_EnquiryTypeName,
    [MKT_Months8].[MonthName] AS MKT_Months8_MonthName,
    [MKT_ProjectBases9].[BaseName] AS MKT_ProjectBases9_BaseName,
    [MKT_Regions10].[RegionName] AS MKT_Regions10_RegionName,
    [MKT_Sites11].[SiteName] AS MKT_Sites11_SiteName,
    [MKT_Verticals12].[VerticalName] AS MKT_Verticals12_VerticalName,
    [MKT_Years13].[YearName] AS MKT_Years13_YearName,
    [SPMT_ERPStates14].[Description] AS SPMT_ERPStates14_Description,
    [VR_BusinessPartner15].[BPName] AS VR_BusinessPartner15_BPName 
  FROM [MKT_Enquiry] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_Enquiry].[ResponsibleSalsePerson] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [MKT_Enquiry].[CreatedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [MKT_Enquiry].[ModifiedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [MKT_Enquiry].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [MKT_BidderTypes] AS [MKT_BidderTypes5]
    ON [MKT_Enquiry].[BidderTypeID] = [MKT_BidderTypes5].[BidderTypeID]
  LEFT OUTER JOIN [MKT_EnquiryStatus] AS [MKT_EnquiryStatus6]
    ON [MKT_Enquiry].[StatusID] = [MKT_EnquiryStatus6].[StatusID]
  LEFT OUTER JOIN [MKT_EnquiryTypes] AS [MKT_EnquiryTypes7]
    ON [MKT_Enquiry].[EnquiryTypeID] = [MKT_EnquiryTypes7].[EnquiryTypeID]
  LEFT OUTER JOIN [MKT_Months] AS [MKT_Months8]
    ON [MKT_Enquiry].[OrderFinalizationMonth] = [MKT_Months8].[MktMonthID]
  LEFT OUTER JOIN [MKT_ProjectBases] AS [MKT_ProjectBases9]
    ON [MKT_Enquiry].[ProjectBaseID] = [MKT_ProjectBases9].[ProjectBaseID]
  LEFT OUTER JOIN [MKT_Regions] AS [MKT_Regions10]
    ON [MKT_Enquiry].[MktRegionID] = [MKT_Regions10].[MktRegionID]
  LEFT OUTER JOIN [MKT_Sites] AS [MKT_Sites11]
    ON [MKT_Enquiry].[MktSiteID] = [MKT_Sites11].[MktSiteID]
  LEFT OUTER JOIN [MKT_Verticals] AS [MKT_Verticals12]
    ON [MKT_Enquiry].[MktVericalID] = [MKT_Verticals12].[MktVericalID]
  LEFT OUTER JOIN [MKT_Years] AS [MKT_Years13]
    ON [MKT_Enquiry].[OrderFinalizationYear] = [MKT_Years13].[MktYearID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates14]
    ON [MKT_Enquiry].[IndianStateID] = [SPMT_ERPStates14].[StateID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]
    ON [MKT_Enquiry].[CustomerID] = [VR_BusinessPartner15].[BPID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [MKT_Enquiry].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [MKT_Enquiry].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ProspectNo' THEN [MKT_Enquiry].[ProspectNo] END,
     CASE @OrderBy WHEN 'ProspectNo DESC' THEN [MKT_Enquiry].[ProspectNo] END DESC,
     CASE @OrderBy WHEN 'EnquiryDate' THEN [MKT_Enquiry].[EnquiryDate] END,
     CASE @OrderBy WHEN 'EnquiryDate DESC' THEN [MKT_Enquiry].[EnquiryDate] END DESC,
     CASE @OrderBy WHEN 'MktVericalID' THEN [MKT_Enquiry].[MktVericalID] END,
     CASE @OrderBy WHEN 'MktVericalID DESC' THEN [MKT_Enquiry].[MktVericalID] END DESC,
     CASE @OrderBy WHEN 'CustomerName' THEN [MKT_Enquiry].[CustomerName] END,
     CASE @OrderBy WHEN 'CustomerName DESC' THEN [MKT_Enquiry].[CustomerName] END DESC,
     CASE @OrderBy WHEN 'CustomerID' THEN [MKT_Enquiry].[CustomerID] END,
     CASE @OrderBy WHEN 'CustomerID DESC' THEN [MKT_Enquiry].[CustomerID] END DESC,
     CASE @OrderBy WHEN 'MktSiteID' THEN [MKT_Enquiry].[MktSiteID] END,
     CASE @OrderBy WHEN 'MktSiteID DESC' THEN [MKT_Enquiry].[MktSiteID] END DESC,
     CASE @OrderBy WHEN 'MktRegionID' THEN [MKT_Enquiry].[MktRegionID] END,
     CASE @OrderBy WHEN 'MktRegionID DESC' THEN [MKT_Enquiry].[MktRegionID] END DESC,
     CASE @OrderBy WHEN 'IndianStateID' THEN [MKT_Enquiry].[IndianStateID] END,
     CASE @OrderBy WHEN 'IndianStateID DESC' THEN [MKT_Enquiry].[IndianStateID] END DESC,
     CASE @OrderBy WHEN 'SiteLocation' THEN [MKT_Enquiry].[SiteLocation] END,
     CASE @OrderBy WHEN 'SiteLocation DESC' THEN [MKT_Enquiry].[SiteLocation] END DESC,
     CASE @OrderBy WHEN 'ResponsibleSalsePerson' THEN [MKT_Enquiry].[ResponsibleSalsePerson] END,
     CASE @OrderBy WHEN 'ResponsibleSalsePerson DESC' THEN [MKT_Enquiry].[ResponsibleSalsePerson] END DESC,
     CASE @OrderBy WHEN 'ProjectName' THEN [MKT_Enquiry].[ProjectName] END,
     CASE @OrderBy WHEN 'ProjectName DESC' THEN [MKT_Enquiry].[ProjectName] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [MKT_Enquiry].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [MKT_Enquiry].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProjectConsultant' THEN [MKT_Enquiry].[ProjectConsultant] END,
     CASE @OrderBy WHEN 'ProjectConsultant DESC' THEN [MKT_Enquiry].[ProjectConsultant] END DESC,
     CASE @OrderBy WHEN 'BidApprovalRequired' THEN [MKT_Enquiry].[BidApprovalRequired] END,
     CASE @OrderBy WHEN 'BidApprovalRequired DESC' THEN [MKT_Enquiry].[BidApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'ProjectBaseID' THEN [MKT_Enquiry].[ProjectBaseID] END,
     CASE @OrderBy WHEN 'ProjectBaseID DESC' THEN [MKT_Enquiry].[ProjectBaseID] END DESC,
     CASE @OrderBy WHEN 'CustomerKeyOfficials' THEN [MKT_Enquiry].[CustomerKeyOfficials] END,
     CASE @OrderBy WHEN 'CustomerKeyOfficials DESC' THEN [MKT_Enquiry].[CustomerKeyOfficials] END DESC,
     CASE @OrderBy WHEN 'BidSubmissionDate' THEN [MKT_Enquiry].[BidSubmissionDate] END,
     CASE @OrderBy WHEN 'BidSubmissionDate DESC' THEN [MKT_Enquiry].[BidSubmissionDate] END DESC,
     CASE @OrderBy WHEN 'OrderFinalizationYear' THEN [MKT_Enquiry].[OrderFinalizationYear] END,
     CASE @OrderBy WHEN 'OrderFinalizationYear DESC' THEN [MKT_Enquiry].[OrderFinalizationYear] END DESC,
     CASE @OrderBy WHEN 'OrderFinalizationMonth' THEN [MKT_Enquiry].[OrderFinalizationMonth] END,
     CASE @OrderBy WHEN 'OrderFinalizationMonth DESC' THEN [MKT_Enquiry].[OrderFinalizationMonth] END DESC,
     CASE @OrderBy WHEN 'ApproxProjectValue' THEN [MKT_Enquiry].[ApproxProjectValue] END,
     CASE @OrderBy WHEN 'ApproxProjectValue DESC' THEN [MKT_Enquiry].[ApproxProjectValue] END DESC,
     CASE @OrderBy WHEN 'EnquiryTypeID' THEN [MKT_Enquiry].[EnquiryTypeID] END,
     CASE @OrderBy WHEN 'EnquiryTypeID DESC' THEN [MKT_Enquiry].[EnquiryTypeID] END DESC,
     CASE @OrderBy WHEN 'Competitors' THEN [MKT_Enquiry].[Competitors] END,
     CASE @OrderBy WHEN 'Competitors DESC' THEN [MKT_Enquiry].[Competitors] END DESC,
     CASE @OrderBy WHEN 'ProjectFunding' THEN [MKT_Enquiry].[ProjectFunding] END,
     CASE @OrderBy WHEN 'ProjectFunding DESC' THEN [MKT_Enquiry].[ProjectFunding] END DESC,
     CASE @OrderBy WHEN 'BidderTypeID' THEN [MKT_Enquiry].[BidderTypeID] END,
     CASE @OrderBy WHEN 'BidderTypeID DESC' THEN [MKT_Enquiry].[BidderTypeID] END DESC,
     CASE @OrderBy WHEN 'BriefScope' THEN [MKT_Enquiry].[BriefScope] END,
     CASE @OrderBy WHEN 'BriefScope DESC' THEN [MKT_Enquiry].[BriefScope] END DESC,
     CASE @OrderBy WHEN 'ProjectStatus' THEN [MKT_Enquiry].[ProjectStatus] END,
     CASE @OrderBy WHEN 'ProjectStatus DESC' THEN [MKT_Enquiry].[ProjectStatus] END DESC,
     CASE @OrderBy WHEN 'PPAStatus' THEN [MKT_Enquiry].[PPAStatus] END,
     CASE @OrderBy WHEN 'PPAStatus DESC' THEN [MKT_Enquiry].[PPAStatus] END DESC,
     CASE @OrderBy WHEN 'LandAcquisitionStatus' THEN [MKT_Enquiry].[LandAcquisitionStatus] END,
     CASE @OrderBy WHEN 'LandAcquisitionStatus DESC' THEN [MKT_Enquiry].[LandAcquisitionStatus] END DESC,
     CASE @OrderBy WHEN 'StatutoryClearanceStatus' THEN [MKT_Enquiry].[StatutoryClearanceStatus] END,
     CASE @OrderBy WHEN 'StatutoryClearanceStatus DESC' THEN [MKT_Enquiry].[StatutoryClearanceStatus] END DESC,
     CASE @OrderBy WHEN 'PreQualificationRequirement' THEN [MKT_Enquiry].[PreQualificationRequirement] END,
     CASE @OrderBy WHEN 'PreQualificationRequirement DESC' THEN [MKT_Enquiry].[PreQualificationRequirement] END DESC,
     CASE @OrderBy WHEN 'ProposedRiskreviewdate' THEN [MKT_Enquiry].[ProposedRiskreviewdate] END,
     CASE @OrderBy WHEN 'ProposedRiskreviewdate DESC' THEN [MKT_Enquiry].[ProposedRiskreviewdate] END DESC,
     CASE @OrderBy WHEN 'RiskReviewMeetingComments' THEN [MKT_Enquiry].[RiskReviewMeetingComments] END,
     CASE @OrderBy WHEN 'RiskReviewMeetingComments DESC' THEN [MKT_Enquiry].[RiskReviewMeetingComments] END DESC,
     CASE @OrderBy WHEN 'RiskReviewApproval' THEN [MKT_Enquiry].[RiskReviewApproval] END,
     CASE @OrderBy WHEN 'RiskReviewApproval DESC' THEN [MKT_Enquiry].[RiskReviewApproval] END DESC,
     CASE @OrderBy WHEN 'ModifiedBy' THEN [MKT_Enquiry].[ModifiedBy] END,
     CASE @OrderBy WHEN 'ModifiedBy DESC' THEN [MKT_Enquiry].[ModifiedBy] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [MKT_Enquiry].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [MKT_Enquiry].[StatusID] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [MKT_Enquiry].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [MKT_Enquiry].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'ModifiedOn' THEN [MKT_Enquiry].[ModifiedOn] END,
     CASE @OrderBy WHEN 'ModifiedOn DESC' THEN [MKT_Enquiry].[ModifiedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [MKT_Enquiry].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [MKT_Enquiry].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'SalesPersonList' THEN [MKT_Enquiry].[SalesPersonList] END,
     CASE @OrderBy WHEN 'SalesPersonList DESC' THEN [MKT_Enquiry].[SalesPersonList] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects4_Description' THEN [IDM_Projects4].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects4_Description DESC' THEN [IDM_Projects4].[Description] END DESC,
     CASE @OrderBy WHEN 'MKT_BidderTypes5_BidderName' THEN [MKT_BidderTypes5].[BidderName] END,
     CASE @OrderBy WHEN 'MKT_BidderTypes5_BidderName DESC' THEN [MKT_BidderTypes5].[BidderName] END DESC,
     CASE @OrderBy WHEN 'MKT_EnquiryStatus6_StatusName' THEN [MKT_EnquiryStatus6].[StatusName] END,
     CASE @OrderBy WHEN 'MKT_EnquiryStatus6_StatusName DESC' THEN [MKT_EnquiryStatus6].[StatusName] END DESC,
     CASE @OrderBy WHEN 'MKT_EnquiryTypes7_EnquiryTypeName' THEN [MKT_EnquiryTypes7].[EnquiryTypeName] END,
     CASE @OrderBy WHEN 'MKT_EnquiryTypes7_EnquiryTypeName DESC' THEN [MKT_EnquiryTypes7].[EnquiryTypeName] END DESC,
     CASE @OrderBy WHEN 'MKT_Months8_MonthName' THEN [MKT_Months8].[MonthName] END,
     CASE @OrderBy WHEN 'MKT_Months8_MonthName DESC' THEN [MKT_Months8].[MonthName] END DESC,
     CASE @OrderBy WHEN 'MKT_ProjectBases9_BaseName' THEN [MKT_ProjectBases9].[BaseName] END,
     CASE @OrderBy WHEN 'MKT_ProjectBases9_BaseName DESC' THEN [MKT_ProjectBases9].[BaseName] END DESC,
     CASE @OrderBy WHEN 'MKT_Regions10_RegionName' THEN [MKT_Regions10].[RegionName] END,
     CASE @OrderBy WHEN 'MKT_Regions10_RegionName DESC' THEN [MKT_Regions10].[RegionName] END DESC,
     CASE @OrderBy WHEN 'MKT_Sites11_SiteName' THEN [MKT_Sites11].[SiteName] END,
     CASE @OrderBy WHEN 'MKT_Sites11_SiteName DESC' THEN [MKT_Sites11].[SiteName] END DESC,
     CASE @OrderBy WHEN 'MKT_Verticals12_VerticalName' THEN [MKT_Verticals12].[VerticalName] END,
     CASE @OrderBy WHEN 'MKT_Verticals12_VerticalName DESC' THEN [MKT_Verticals12].[VerticalName] END DESC,
     CASE @OrderBy WHEN 'MKT_Years13_YearName' THEN [MKT_Years13].[YearName] END,
     CASE @OrderBy WHEN 'MKT_Years13_YearName DESC' THEN [MKT_Years13].[YearName] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates14_Description' THEN [SPMT_ERPStates14].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates14_Description DESC' THEN [SPMT_ERPStates14].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner15_BPName' THEN [VR_BusinessPartner15].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner15_BPName DESC' THEN [VR_BusinessPartner15].[BPName] END DESC 
  SET @RecordCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryAutoCompleteList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryAutoCompleteList]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryAutoCompleteList]
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [MKT_Enquiry].[ProspectNo]' 
  SET @LGSQL = @LGSQL + ',[MKT_Enquiry].[SerialNo]' 
  SET @LGSQL = @LGSQL + ' FROM [MKT_Enquiry] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([MKT_Enquiry].[SerialNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([MKT_Enquiry].[ProspectNo],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END 
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquirySelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquirySelectByID]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquirySelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
    [MKT_Enquiry].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [IDM_Projects4].[Description] AS IDM_Projects4_Description,
    [MKT_BidderTypes5].[BidderName] AS MKT_BidderTypes5_BidderName,
    [MKT_EnquiryStatus6].[StatusName] AS MKT_EnquiryStatus6_StatusName,
    [MKT_EnquiryTypes7].[EnquiryTypeName] AS MKT_EnquiryTypes7_EnquiryTypeName,
    [MKT_Months8].[MonthName] AS MKT_Months8_MonthName,
    [MKT_ProjectBases9].[BaseName] AS MKT_ProjectBases9_BaseName,
    [MKT_Regions10].[RegionName] AS MKT_Regions10_RegionName,
    [MKT_Sites11].[SiteName] AS MKT_Sites11_SiteName,
    [MKT_Verticals12].[VerticalName] AS MKT_Verticals12_VerticalName,
    [MKT_Years13].[YearName] AS MKT_Years13_YearName,
    [SPMT_ERPStates14].[Description] AS SPMT_ERPStates14_Description,
    [VR_BusinessPartner15].[BPName] AS VR_BusinessPartner15_BPName 
  FROM [MKT_Enquiry] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_Enquiry].[ResponsibleSalsePerson] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [MKT_Enquiry].[CreatedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [MKT_Enquiry].[ModifiedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [MKT_Enquiry].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [MKT_BidderTypes] AS [MKT_BidderTypes5]
    ON [MKT_Enquiry].[BidderTypeID] = [MKT_BidderTypes5].[BidderTypeID]
  LEFT OUTER JOIN [MKT_EnquiryStatus] AS [MKT_EnquiryStatus6]
    ON [MKT_Enquiry].[StatusID] = [MKT_EnquiryStatus6].[StatusID]
  LEFT OUTER JOIN [MKT_EnquiryTypes] AS [MKT_EnquiryTypes7]
    ON [MKT_Enquiry].[EnquiryTypeID] = [MKT_EnquiryTypes7].[EnquiryTypeID]
  LEFT OUTER JOIN [MKT_Months] AS [MKT_Months8]
    ON [MKT_Enquiry].[OrderFinalizationMonth] = [MKT_Months8].[MktMonthID]
  LEFT OUTER JOIN [MKT_ProjectBases] AS [MKT_ProjectBases9]
    ON [MKT_Enquiry].[ProjectBaseID] = [MKT_ProjectBases9].[ProjectBaseID]
  LEFT OUTER JOIN [MKT_Regions] AS [MKT_Regions10]
    ON [MKT_Enquiry].[MktRegionID] = [MKT_Regions10].[MktRegionID]
  LEFT OUTER JOIN [MKT_Sites] AS [MKT_Sites11]
    ON [MKT_Enquiry].[MktSiteID] = [MKT_Sites11].[MktSiteID]
  LEFT OUTER JOIN [MKT_Verticals] AS [MKT_Verticals12]
    ON [MKT_Enquiry].[MktVericalID] = [MKT_Verticals12].[MktVericalID]
  LEFT OUTER JOIN [MKT_Years] AS [MKT_Years13]
    ON [MKT_Enquiry].[OrderFinalizationYear] = [MKT_Years13].[MktYearID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates14]
    ON [MKT_Enquiry].[IndianStateID] = [SPMT_ERPStates14].[StateID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]
    ON [MKT_Enquiry].[CustomerID] = [VR_BusinessPartner15].[BPID]
  WHERE
  [MKT_Enquiry].[SerialNo] = @SerialNo
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquirySelectListSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquirySelectListSearch]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquirySelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [MKT_Enquiry].[SerialNo] FROM [MKT_Enquiry]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_Enquiry].[ResponsibleSalsePerson] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [MKT_Enquiry].[CreatedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [MKT_Enquiry].[ModifiedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [MKT_Enquiry].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [MKT_BidderTypes] AS [MKT_BidderTypes5]
    ON [MKT_Enquiry].[BidderTypeID] = [MKT_BidderTypes5].[BidderTypeID]
  LEFT OUTER JOIN [MKT_EnquiryStatus] AS [MKT_EnquiryStatus6]
    ON [MKT_Enquiry].[StatusID] = [MKT_EnquiryStatus6].[StatusID]
  LEFT OUTER JOIN [MKT_EnquiryTypes] AS [MKT_EnquiryTypes7]
    ON [MKT_Enquiry].[EnquiryTypeID] = [MKT_EnquiryTypes7].[EnquiryTypeID]
  LEFT OUTER JOIN [MKT_Months] AS [MKT_Months8]
    ON [MKT_Enquiry].[OrderFinalizationMonth] = [MKT_Months8].[MktMonthID]
  LEFT OUTER JOIN [MKT_ProjectBases] AS [MKT_ProjectBases9]
    ON [MKT_Enquiry].[ProjectBaseID] = [MKT_ProjectBases9].[ProjectBaseID]
  LEFT OUTER JOIN [MKT_Regions] AS [MKT_Regions10]
    ON [MKT_Enquiry].[MktRegionID] = [MKT_Regions10].[MktRegionID]
  LEFT OUTER JOIN [MKT_Sites] AS [MKT_Sites11]
    ON [MKT_Enquiry].[MktSiteID] = [MKT_Sites11].[MktSiteID]
  LEFT OUTER JOIN [MKT_Verticals] AS [MKT_Verticals12]
    ON [MKT_Enquiry].[MktVericalID] = [MKT_Verticals12].[MktVericalID]
  LEFT OUTER JOIN [MKT_Years] AS [MKT_Years13]
    ON [MKT_Enquiry].[OrderFinalizationYear] = [MKT_Years13].[MktYearID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates14]
    ON [MKT_Enquiry].[IndianStateID] = [SPMT_ERPStates14].[StateID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]
    ON [MKT_Enquiry].[CustomerID] = [VR_BusinessPartner15].[BPID]
 WHERE  
   ( 
         STR(ISNULL([MKT_Enquiry].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ProspectNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[MktVericalID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[CustomerName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[CustomerID],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[MktSiteID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[MktRegionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[IndianStateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[SiteLocation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ResponsibleSalsePerson],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ProjectName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ProjectConsultant],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[ProjectBaseID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[CustomerKeyOfficials],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[OrderFinalizationYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[OrderFinalizationMonth], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ApproxProjectValue],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[EnquiryTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[Competitors],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ProjectFunding],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[BidderTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[BriefScope],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ProjectStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[PPAStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[LandAcquisitionStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[StatutoryClearanceStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[PreQualificationRequirement],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[RiskReviewMeetingComments],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[ModifiedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_Enquiry].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_Enquiry].[SalesPersonList],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [MKT_Enquiry].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [MKT_Enquiry].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ProspectNo' THEN [MKT_Enquiry].[ProspectNo] END,
     CASE @OrderBy WHEN 'ProspectNo DESC' THEN [MKT_Enquiry].[ProspectNo] END DESC,
     CASE @OrderBy WHEN 'EnquiryDate' THEN [MKT_Enquiry].[EnquiryDate] END,
     CASE @OrderBy WHEN 'EnquiryDate DESC' THEN [MKT_Enquiry].[EnquiryDate] END DESC,
     CASE @OrderBy WHEN 'MktVericalID' THEN [MKT_Enquiry].[MktVericalID] END,
     CASE @OrderBy WHEN 'MktVericalID DESC' THEN [MKT_Enquiry].[MktVericalID] END DESC,
     CASE @OrderBy WHEN 'CustomerName' THEN [MKT_Enquiry].[CustomerName] END,
     CASE @OrderBy WHEN 'CustomerName DESC' THEN [MKT_Enquiry].[CustomerName] END DESC,
     CASE @OrderBy WHEN 'CustomerID' THEN [MKT_Enquiry].[CustomerID] END,
     CASE @OrderBy WHEN 'CustomerID DESC' THEN [MKT_Enquiry].[CustomerID] END DESC,
     CASE @OrderBy WHEN 'MktSiteID' THEN [MKT_Enquiry].[MktSiteID] END,
     CASE @OrderBy WHEN 'MktSiteID DESC' THEN [MKT_Enquiry].[MktSiteID] END DESC,
     CASE @OrderBy WHEN 'MktRegionID' THEN [MKT_Enquiry].[MktRegionID] END,
     CASE @OrderBy WHEN 'MktRegionID DESC' THEN [MKT_Enquiry].[MktRegionID] END DESC,
     CASE @OrderBy WHEN 'IndianStateID' THEN [MKT_Enquiry].[IndianStateID] END,
     CASE @OrderBy WHEN 'IndianStateID DESC' THEN [MKT_Enquiry].[IndianStateID] END DESC,
     CASE @OrderBy WHEN 'SiteLocation' THEN [MKT_Enquiry].[SiteLocation] END,
     CASE @OrderBy WHEN 'SiteLocation DESC' THEN [MKT_Enquiry].[SiteLocation] END DESC,
     CASE @OrderBy WHEN 'ResponsibleSalsePerson' THEN [MKT_Enquiry].[ResponsibleSalsePerson] END,
     CASE @OrderBy WHEN 'ResponsibleSalsePerson DESC' THEN [MKT_Enquiry].[ResponsibleSalsePerson] END DESC,
     CASE @OrderBy WHEN 'ProjectName' THEN [MKT_Enquiry].[ProjectName] END,
     CASE @OrderBy WHEN 'ProjectName DESC' THEN [MKT_Enquiry].[ProjectName] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [MKT_Enquiry].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [MKT_Enquiry].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProjectConsultant' THEN [MKT_Enquiry].[ProjectConsultant] END,
     CASE @OrderBy WHEN 'ProjectConsultant DESC' THEN [MKT_Enquiry].[ProjectConsultant] END DESC,
     CASE @OrderBy WHEN 'BidApprovalRequired' THEN [MKT_Enquiry].[BidApprovalRequired] END,
     CASE @OrderBy WHEN 'BidApprovalRequired DESC' THEN [MKT_Enquiry].[BidApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'ProjectBaseID' THEN [MKT_Enquiry].[ProjectBaseID] END,
     CASE @OrderBy WHEN 'ProjectBaseID DESC' THEN [MKT_Enquiry].[ProjectBaseID] END DESC,
     CASE @OrderBy WHEN 'CustomerKeyOfficials' THEN [MKT_Enquiry].[CustomerKeyOfficials] END,
     CASE @OrderBy WHEN 'CustomerKeyOfficials DESC' THEN [MKT_Enquiry].[CustomerKeyOfficials] END DESC,
     CASE @OrderBy WHEN 'BidSubmissionDate' THEN [MKT_Enquiry].[BidSubmissionDate] END,
     CASE @OrderBy WHEN 'BidSubmissionDate DESC' THEN [MKT_Enquiry].[BidSubmissionDate] END DESC,
     CASE @OrderBy WHEN 'OrderFinalizationYear' THEN [MKT_Enquiry].[OrderFinalizationYear] END,
     CASE @OrderBy WHEN 'OrderFinalizationYear DESC' THEN [MKT_Enquiry].[OrderFinalizationYear] END DESC,
     CASE @OrderBy WHEN 'OrderFinalizationMonth' THEN [MKT_Enquiry].[OrderFinalizationMonth] END,
     CASE @OrderBy WHEN 'OrderFinalizationMonth DESC' THEN [MKT_Enquiry].[OrderFinalizationMonth] END DESC,
     CASE @OrderBy WHEN 'ApproxProjectValue' THEN [MKT_Enquiry].[ApproxProjectValue] END,
     CASE @OrderBy WHEN 'ApproxProjectValue DESC' THEN [MKT_Enquiry].[ApproxProjectValue] END DESC,
     CASE @OrderBy WHEN 'EnquiryTypeID' THEN [MKT_Enquiry].[EnquiryTypeID] END,
     CASE @OrderBy WHEN 'EnquiryTypeID DESC' THEN [MKT_Enquiry].[EnquiryTypeID] END DESC,
     CASE @OrderBy WHEN 'Competitors' THEN [MKT_Enquiry].[Competitors] END,
     CASE @OrderBy WHEN 'Competitors DESC' THEN [MKT_Enquiry].[Competitors] END DESC,
     CASE @OrderBy WHEN 'ProjectFunding' THEN [MKT_Enquiry].[ProjectFunding] END,
     CASE @OrderBy WHEN 'ProjectFunding DESC' THEN [MKT_Enquiry].[ProjectFunding] END DESC,
     CASE @OrderBy WHEN 'BidderTypeID' THEN [MKT_Enquiry].[BidderTypeID] END,
     CASE @OrderBy WHEN 'BidderTypeID DESC' THEN [MKT_Enquiry].[BidderTypeID] END DESC,
     CASE @OrderBy WHEN 'BriefScope' THEN [MKT_Enquiry].[BriefScope] END,
     CASE @OrderBy WHEN 'BriefScope DESC' THEN [MKT_Enquiry].[BriefScope] END DESC,
     CASE @OrderBy WHEN 'ProjectStatus' THEN [MKT_Enquiry].[ProjectStatus] END,
     CASE @OrderBy WHEN 'ProjectStatus DESC' THEN [MKT_Enquiry].[ProjectStatus] END DESC,
     CASE @OrderBy WHEN 'PPAStatus' THEN [MKT_Enquiry].[PPAStatus] END,
     CASE @OrderBy WHEN 'PPAStatus DESC' THEN [MKT_Enquiry].[PPAStatus] END DESC,
     CASE @OrderBy WHEN 'LandAcquisitionStatus' THEN [MKT_Enquiry].[LandAcquisitionStatus] END,
     CASE @OrderBy WHEN 'LandAcquisitionStatus DESC' THEN [MKT_Enquiry].[LandAcquisitionStatus] END DESC,
     CASE @OrderBy WHEN 'StatutoryClearanceStatus' THEN [MKT_Enquiry].[StatutoryClearanceStatus] END,
     CASE @OrderBy WHEN 'StatutoryClearanceStatus DESC' THEN [MKT_Enquiry].[StatutoryClearanceStatus] END DESC,
     CASE @OrderBy WHEN 'PreQualificationRequirement' THEN [MKT_Enquiry].[PreQualificationRequirement] END,
     CASE @OrderBy WHEN 'PreQualificationRequirement DESC' THEN [MKT_Enquiry].[PreQualificationRequirement] END DESC,
     CASE @OrderBy WHEN 'ProposedRiskreviewdate' THEN [MKT_Enquiry].[ProposedRiskreviewdate] END,
     CASE @OrderBy WHEN 'ProposedRiskreviewdate DESC' THEN [MKT_Enquiry].[ProposedRiskreviewdate] END DESC,
     CASE @OrderBy WHEN 'RiskReviewMeetingComments' THEN [MKT_Enquiry].[RiskReviewMeetingComments] END,
     CASE @OrderBy WHEN 'RiskReviewMeetingComments DESC' THEN [MKT_Enquiry].[RiskReviewMeetingComments] END DESC,
     CASE @OrderBy WHEN 'RiskReviewApproval' THEN [MKT_Enquiry].[RiskReviewApproval] END,
     CASE @OrderBy WHEN 'RiskReviewApproval DESC' THEN [MKT_Enquiry].[RiskReviewApproval] END DESC,
     CASE @OrderBy WHEN 'ModifiedBy' THEN [MKT_Enquiry].[ModifiedBy] END,
     CASE @OrderBy WHEN 'ModifiedBy DESC' THEN [MKT_Enquiry].[ModifiedBy] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [MKT_Enquiry].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [MKT_Enquiry].[StatusID] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [MKT_Enquiry].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [MKT_Enquiry].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'ModifiedOn' THEN [MKT_Enquiry].[ModifiedOn] END,
     CASE @OrderBy WHEN 'ModifiedOn DESC' THEN [MKT_Enquiry].[ModifiedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [MKT_Enquiry].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [MKT_Enquiry].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'SalesPersonList' THEN [MKT_Enquiry].[SalesPersonList] END,
     CASE @OrderBy WHEN 'SalesPersonList DESC' THEN [MKT_Enquiry].[SalesPersonList] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects4_Description' THEN [IDM_Projects4].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects4_Description DESC' THEN [IDM_Projects4].[Description] END DESC,
     CASE @OrderBy WHEN 'MKT_BidderTypes5_BidderName' THEN [MKT_BidderTypes5].[BidderName] END,
     CASE @OrderBy WHEN 'MKT_BidderTypes5_BidderName DESC' THEN [MKT_BidderTypes5].[BidderName] END DESC,
     CASE @OrderBy WHEN 'MKT_EnquiryStatus6_StatusName' THEN [MKT_EnquiryStatus6].[StatusName] END,
     CASE @OrderBy WHEN 'MKT_EnquiryStatus6_StatusName DESC' THEN [MKT_EnquiryStatus6].[StatusName] END DESC,
     CASE @OrderBy WHEN 'MKT_EnquiryTypes7_EnquiryTypeName' THEN [MKT_EnquiryTypes7].[EnquiryTypeName] END,
     CASE @OrderBy WHEN 'MKT_EnquiryTypes7_EnquiryTypeName DESC' THEN [MKT_EnquiryTypes7].[EnquiryTypeName] END DESC,
     CASE @OrderBy WHEN 'MKT_Months8_MonthName' THEN [MKT_Months8].[MonthName] END,
     CASE @OrderBy WHEN 'MKT_Months8_MonthName DESC' THEN [MKT_Months8].[MonthName] END DESC,
     CASE @OrderBy WHEN 'MKT_ProjectBases9_BaseName' THEN [MKT_ProjectBases9].[BaseName] END,
     CASE @OrderBy WHEN 'MKT_ProjectBases9_BaseName DESC' THEN [MKT_ProjectBases9].[BaseName] END DESC,
     CASE @OrderBy WHEN 'MKT_Regions10_RegionName' THEN [MKT_Regions10].[RegionName] END,
     CASE @OrderBy WHEN 'MKT_Regions10_RegionName DESC' THEN [MKT_Regions10].[RegionName] END DESC,
     CASE @OrderBy WHEN 'MKT_Sites11_SiteName' THEN [MKT_Sites11].[SiteName] END,
     CASE @OrderBy WHEN 'MKT_Sites11_SiteName DESC' THEN [MKT_Sites11].[SiteName] END DESC,
     CASE @OrderBy WHEN 'MKT_Verticals12_VerticalName' THEN [MKT_Verticals12].[VerticalName] END,
     CASE @OrderBy WHEN 'MKT_Verticals12_VerticalName DESC' THEN [MKT_Verticals12].[VerticalName] END DESC,
     CASE @OrderBy WHEN 'MKT_Years13_YearName' THEN [MKT_Years13].[YearName] END,
     CASE @OrderBy WHEN 'MKT_Years13_YearName DESC' THEN [MKT_Years13].[YearName] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates14_Description' THEN [SPMT_ERPStates14].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates14_Description DESC' THEN [SPMT_ERPStates14].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner15_BPName' THEN [VR_BusinessPartner15].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner15_BPName DESC' THEN [VR_BusinessPartner15].[BPName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [MKT_Enquiry].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [IDM_Projects4].[Description] AS IDM_Projects4_Description,
    [MKT_BidderTypes5].[BidderName] AS MKT_BidderTypes5_BidderName,
    [MKT_EnquiryStatus6].[StatusName] AS MKT_EnquiryStatus6_StatusName,
    [MKT_EnquiryTypes7].[EnquiryTypeName] AS MKT_EnquiryTypes7_EnquiryTypeName,
    [MKT_Months8].[MonthName] AS MKT_Months8_MonthName,
    [MKT_ProjectBases9].[BaseName] AS MKT_ProjectBases9_BaseName,
    [MKT_Regions10].[RegionName] AS MKT_Regions10_RegionName,
    [MKT_Sites11].[SiteName] AS MKT_Sites11_SiteName,
    [MKT_Verticals12].[VerticalName] AS MKT_Verticals12_VerticalName,
    [MKT_Years13].[YearName] AS MKT_Years13_YearName,
    [SPMT_ERPStates14].[Description] AS SPMT_ERPStates14_Description,
    [VR_BusinessPartner15].[BPName] AS VR_BusinessPartner15_BPName 
  FROM [MKT_Enquiry] 
      INNER JOIN #PageIndex
          ON [MKT_Enquiry].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_Enquiry].[ResponsibleSalsePerson] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [MKT_Enquiry].[CreatedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [MKT_Enquiry].[ModifiedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [MKT_Enquiry].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [MKT_BidderTypes] AS [MKT_BidderTypes5]
    ON [MKT_Enquiry].[BidderTypeID] = [MKT_BidderTypes5].[BidderTypeID]
  LEFT OUTER JOIN [MKT_EnquiryStatus] AS [MKT_EnquiryStatus6]
    ON [MKT_Enquiry].[StatusID] = [MKT_EnquiryStatus6].[StatusID]
  LEFT OUTER JOIN [MKT_EnquiryTypes] AS [MKT_EnquiryTypes7]
    ON [MKT_Enquiry].[EnquiryTypeID] = [MKT_EnquiryTypes7].[EnquiryTypeID]
  LEFT OUTER JOIN [MKT_Months] AS [MKT_Months8]
    ON [MKT_Enquiry].[OrderFinalizationMonth] = [MKT_Months8].[MktMonthID]
  LEFT OUTER JOIN [MKT_ProjectBases] AS [MKT_ProjectBases9]
    ON [MKT_Enquiry].[ProjectBaseID] = [MKT_ProjectBases9].[ProjectBaseID]
  LEFT OUTER JOIN [MKT_Regions] AS [MKT_Regions10]
    ON [MKT_Enquiry].[MktRegionID] = [MKT_Regions10].[MktRegionID]
  LEFT OUTER JOIN [MKT_Sites] AS [MKT_Sites11]
    ON [MKT_Enquiry].[MktSiteID] = [MKT_Sites11].[MktSiteID]
  LEFT OUTER JOIN [MKT_Verticals] AS [MKT_Verticals12]
    ON [MKT_Enquiry].[MktVericalID] = [MKT_Verticals12].[MktVericalID]
  LEFT OUTER JOIN [MKT_Years] AS [MKT_Years13]
    ON [MKT_Enquiry].[OrderFinalizationYear] = [MKT_Years13].[MktYearID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates14]
    ON [MKT_Enquiry].[IndianStateID] = [SPMT_ERPStates14].[StateID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]
    ON [MKT_Enquiry].[CustomerID] = [VR_BusinessPartner15].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquirySelectListFilteres]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquirySelectListFilteres]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquirySelectListFilteres]
  @Filter_MktVericalID Int,
  @Filter_MktSiteID Int,
  @Filter_IndianStateID NVarChar(2),
  @Filter_EnquiryTypeID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[MKT_Enquiry].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [MKT_Enquiry] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[ResponsibleSalsePerson] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[CreatedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[ModifiedBy] = [aspnet_users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[ProjectID] = [IDM_Projects4].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_BidderTypes] AS [MKT_BidderTypes5]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[BidderTypeID] = [MKT_BidderTypes5].[BidderTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_EnquiryStatus] AS [MKT_EnquiryStatus6]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[StatusID] = [MKT_EnquiryStatus6].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_EnquiryTypes] AS [MKT_EnquiryTypes7]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[EnquiryTypeID] = [MKT_EnquiryTypes7].[EnquiryTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_Months] AS [MKT_Months8]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[OrderFinalizationMonth] = [MKT_Months8].[MktMonthID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_ProjectBases] AS [MKT_ProjectBases9]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[ProjectBaseID] = [MKT_ProjectBases9].[ProjectBaseID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_Regions] AS [MKT_Regions10]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[MktRegionID] = [MKT_Regions10].[MktRegionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_Sites] AS [MKT_Sites11]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[MktSiteID] = [MKT_Sites11].[MktSiteID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_Verticals] AS [MKT_Verticals12]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[MktVericalID] = [MKT_Verticals12].[MktVericalID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [MKT_Years] AS [MKT_Years13]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[OrderFinalizationYear] = [MKT_Years13].[MktYearID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates14]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[IndianStateID] = [SPMT_ERPStates14].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]'
  SET @LGSQL = @LGSQL + '    ON [MKT_Enquiry].[CustomerID] = [VR_BusinessPartner15].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_MktVericalID > 0) 
    SET @LGSQL = @LGSQL + ' AND [MKT_Enquiry].[MktVericalID] = ' + STR(@Filter_MktVericalID)
  IF (@Filter_MktSiteID > 0) 
    SET @LGSQL = @LGSQL + ' AND [MKT_Enquiry].[MktSiteID] = ' + STR(@Filter_MktSiteID)
  IF (@Filter_IndianStateID > '') 
    SET @LGSQL = @LGSQL + ' AND [MKT_Enquiry].[IndianStateID] = ''' + @Filter_IndianStateID + ''''
  IF (@Filter_EnquiryTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [MKT_Enquiry].[EnquiryTypeID] = ' + STR(@Filter_EnquiryTypeID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[MKT_Enquiry].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[MKT_Enquiry].[SerialNo] DESC'
                        WHEN 'ProspectNo' THEN '[MKT_Enquiry].[ProspectNo]'
                        WHEN 'ProspectNo DESC' THEN '[MKT_Enquiry].[ProspectNo] DESC'
                        WHEN 'EnquiryDate' THEN '[MKT_Enquiry].[EnquiryDate]'
                        WHEN 'EnquiryDate DESC' THEN '[MKT_Enquiry].[EnquiryDate] DESC'
                        WHEN 'MktVericalID' THEN '[MKT_Enquiry].[MktVericalID]'
                        WHEN 'MktVericalID DESC' THEN '[MKT_Enquiry].[MktVericalID] DESC'
                        WHEN 'CustomerName' THEN '[MKT_Enquiry].[CustomerName]'
                        WHEN 'CustomerName DESC' THEN '[MKT_Enquiry].[CustomerName] DESC'
                        WHEN 'CustomerID' THEN '[MKT_Enquiry].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[MKT_Enquiry].[CustomerID] DESC'
                        WHEN 'MktSiteID' THEN '[MKT_Enquiry].[MktSiteID]'
                        WHEN 'MktSiteID DESC' THEN '[MKT_Enquiry].[MktSiteID] DESC'
                        WHEN 'MktRegionID' THEN '[MKT_Enquiry].[MktRegionID]'
                        WHEN 'MktRegionID DESC' THEN '[MKT_Enquiry].[MktRegionID] DESC'
                        WHEN 'IndianStateID' THEN '[MKT_Enquiry].[IndianStateID]'
                        WHEN 'IndianStateID DESC' THEN '[MKT_Enquiry].[IndianStateID] DESC'
                        WHEN 'SiteLocation' THEN '[MKT_Enquiry].[SiteLocation]'
                        WHEN 'SiteLocation DESC' THEN '[MKT_Enquiry].[SiteLocation] DESC'
                        WHEN 'ResponsibleSalsePerson' THEN '[MKT_Enquiry].[ResponsibleSalsePerson]'
                        WHEN 'ResponsibleSalsePerson DESC' THEN '[MKT_Enquiry].[ResponsibleSalsePerson] DESC'
                        WHEN 'ProjectName' THEN '[MKT_Enquiry].[ProjectName]'
                        WHEN 'ProjectName DESC' THEN '[MKT_Enquiry].[ProjectName] DESC'
                        WHEN 'ProjectID' THEN '[MKT_Enquiry].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[MKT_Enquiry].[ProjectID] DESC'
                        WHEN 'ProjectConsultant' THEN '[MKT_Enquiry].[ProjectConsultant]'
                        WHEN 'ProjectConsultant DESC' THEN '[MKT_Enquiry].[ProjectConsultant] DESC'
                        WHEN 'BidApprovalRequired' THEN '[MKT_Enquiry].[BidApprovalRequired]'
                        WHEN 'BidApprovalRequired DESC' THEN '[MKT_Enquiry].[BidApprovalRequired] DESC'
                        WHEN 'ProjectBaseID' THEN '[MKT_Enquiry].[ProjectBaseID]'
                        WHEN 'ProjectBaseID DESC' THEN '[MKT_Enquiry].[ProjectBaseID] DESC'
                        WHEN 'CustomerKeyOfficials' THEN '[MKT_Enquiry].[CustomerKeyOfficials]'
                        WHEN 'CustomerKeyOfficials DESC' THEN '[MKT_Enquiry].[CustomerKeyOfficials] DESC'
                        WHEN 'BidSubmissionDate' THEN '[MKT_Enquiry].[BidSubmissionDate]'
                        WHEN 'BidSubmissionDate DESC' THEN '[MKT_Enquiry].[BidSubmissionDate] DESC'
                        WHEN 'OrderFinalizationYear' THEN '[MKT_Enquiry].[OrderFinalizationYear]'
                        WHEN 'OrderFinalizationYear DESC' THEN '[MKT_Enquiry].[OrderFinalizationYear] DESC'
                        WHEN 'OrderFinalizationMonth' THEN '[MKT_Enquiry].[OrderFinalizationMonth]'
                        WHEN 'OrderFinalizationMonth DESC' THEN '[MKT_Enquiry].[OrderFinalizationMonth] DESC'
                        WHEN 'ApproxProjectValue' THEN '[MKT_Enquiry].[ApproxProjectValue]'
                        WHEN 'ApproxProjectValue DESC' THEN '[MKT_Enquiry].[ApproxProjectValue] DESC'
                        WHEN 'EnquiryTypeID' THEN '[MKT_Enquiry].[EnquiryTypeID]'
                        WHEN 'EnquiryTypeID DESC' THEN '[MKT_Enquiry].[EnquiryTypeID] DESC'
                        WHEN 'Competitors' THEN '[MKT_Enquiry].[Competitors]'
                        WHEN 'Competitors DESC' THEN '[MKT_Enquiry].[Competitors] DESC'
                        WHEN 'ProjectFunding' THEN '[MKT_Enquiry].[ProjectFunding]'
                        WHEN 'ProjectFunding DESC' THEN '[MKT_Enquiry].[ProjectFunding] DESC'
                        WHEN 'BidderTypeID' THEN '[MKT_Enquiry].[BidderTypeID]'
                        WHEN 'BidderTypeID DESC' THEN '[MKT_Enquiry].[BidderTypeID] DESC'
                        WHEN 'BriefScope' THEN '[MKT_Enquiry].[BriefScope]'
                        WHEN 'BriefScope DESC' THEN '[MKT_Enquiry].[BriefScope] DESC'
                        WHEN 'ProjectStatus' THEN '[MKT_Enquiry].[ProjectStatus]'
                        WHEN 'ProjectStatus DESC' THEN '[MKT_Enquiry].[ProjectStatus] DESC'
                        WHEN 'PPAStatus' THEN '[MKT_Enquiry].[PPAStatus]'
                        WHEN 'PPAStatus DESC' THEN '[MKT_Enquiry].[PPAStatus] DESC'
                        WHEN 'LandAcquisitionStatus' THEN '[MKT_Enquiry].[LandAcquisitionStatus]'
                        WHEN 'LandAcquisitionStatus DESC' THEN '[MKT_Enquiry].[LandAcquisitionStatus] DESC'
                        WHEN 'StatutoryClearanceStatus' THEN '[MKT_Enquiry].[StatutoryClearanceStatus]'
                        WHEN 'StatutoryClearanceStatus DESC' THEN '[MKT_Enquiry].[StatutoryClearanceStatus] DESC'
                        WHEN 'PreQualificationRequirement' THEN '[MKT_Enquiry].[PreQualificationRequirement]'
                        WHEN 'PreQualificationRequirement DESC' THEN '[MKT_Enquiry].[PreQualificationRequirement] DESC'
                        WHEN 'ProposedRiskreviewdate' THEN '[MKT_Enquiry].[ProposedRiskreviewdate]'
                        WHEN 'ProposedRiskreviewdate DESC' THEN '[MKT_Enquiry].[ProposedRiskreviewdate] DESC'
                        WHEN 'RiskReviewMeetingComments' THEN '[MKT_Enquiry].[RiskReviewMeetingComments]'
                        WHEN 'RiskReviewMeetingComments DESC' THEN '[MKT_Enquiry].[RiskReviewMeetingComments] DESC'
                        WHEN 'RiskReviewApproval' THEN '[MKT_Enquiry].[RiskReviewApproval]'
                        WHEN 'RiskReviewApproval DESC' THEN '[MKT_Enquiry].[RiskReviewApproval] DESC'
                        WHEN 'ModifiedBy' THEN '[MKT_Enquiry].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[MKT_Enquiry].[ModifiedBy] DESC'
                        WHEN 'StatusID' THEN '[MKT_Enquiry].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[MKT_Enquiry].[StatusID] DESC'
                        WHEN 'CreatedOn' THEN '[MKT_Enquiry].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[MKT_Enquiry].[CreatedOn] DESC'
                        WHEN 'ModifiedOn' THEN '[MKT_Enquiry].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[MKT_Enquiry].[ModifiedOn] DESC'
                        WHEN 'CreatedBy' THEN '[MKT_Enquiry].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[MKT_Enquiry].[CreatedBy] DESC'
                        WHEN 'SalesPersonList' THEN '[MKT_Enquiry].[SalesPersonList]'
                        WHEN 'SalesPersonList DESC' THEN '[MKT_Enquiry].[SalesPersonList] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'IDM_Projects4_Description' THEN '[IDM_Projects4].[Description]'
                        WHEN 'IDM_Projects4_Description DESC' THEN '[IDM_Projects4].[Description] DESC'
                        WHEN 'MKT_BidderTypes5_BidderName' THEN '[MKT_BidderTypes5].[BidderName]'
                        WHEN 'MKT_BidderTypes5_BidderName DESC' THEN '[MKT_BidderTypes5].[BidderName] DESC'
                        WHEN 'MKT_EnquiryStatus6_StatusName' THEN '[MKT_EnquiryStatus6].[StatusName]'
                        WHEN 'MKT_EnquiryStatus6_StatusName DESC' THEN '[MKT_EnquiryStatus6].[StatusName] DESC'
                        WHEN 'MKT_EnquiryTypes7_EnquiryTypeName' THEN '[MKT_EnquiryTypes7].[EnquiryTypeName]'
                        WHEN 'MKT_EnquiryTypes7_EnquiryTypeName DESC' THEN '[MKT_EnquiryTypes7].[EnquiryTypeName] DESC'
                        WHEN 'MKT_Months8_MonthName' THEN '[MKT_Months8].[MonthName]'
                        WHEN 'MKT_Months8_MonthName DESC' THEN '[MKT_Months8].[MonthName] DESC'
                        WHEN 'MKT_ProjectBases9_BaseName' THEN '[MKT_ProjectBases9].[BaseName]'
                        WHEN 'MKT_ProjectBases9_BaseName DESC' THEN '[MKT_ProjectBases9].[BaseName] DESC'
                        WHEN 'MKT_Regions10_RegionName' THEN '[MKT_Regions10].[RegionName]'
                        WHEN 'MKT_Regions10_RegionName DESC' THEN '[MKT_Regions10].[RegionName] DESC'
                        WHEN 'MKT_Sites11_SiteName' THEN '[MKT_Sites11].[SiteName]'
                        WHEN 'MKT_Sites11_SiteName DESC' THEN '[MKT_Sites11].[SiteName] DESC'
                        WHEN 'MKT_Verticals12_VerticalName' THEN '[MKT_Verticals12].[VerticalName]'
                        WHEN 'MKT_Verticals12_VerticalName DESC' THEN '[MKT_Verticals12].[VerticalName] DESC'
                        WHEN 'MKT_Years13_YearName' THEN '[MKT_Years13].[YearName]'
                        WHEN 'MKT_Years13_YearName DESC' THEN '[MKT_Years13].[YearName] DESC'
                        WHEN 'SPMT_ERPStates14_Description' THEN '[SPMT_ERPStates14].[Description]'
                        WHEN 'SPMT_ERPStates14_Description DESC' THEN '[SPMT_ERPStates14].[Description] DESC'
                        WHEN 'VR_BusinessPartner15_BPName' THEN '[VR_BusinessPartner15].[BPName]'
                        WHEN 'VR_BusinessPartner15_BPName DESC' THEN '[VR_BusinessPartner15].[BPName] DESC'
                        ELSE '[MKT_Enquiry].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [MKT_Enquiry].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [IDM_Projects4].[Description] AS IDM_Projects4_Description,
    [MKT_BidderTypes5].[BidderName] AS MKT_BidderTypes5_BidderName,
    [MKT_EnquiryStatus6].[StatusName] AS MKT_EnquiryStatus6_StatusName,
    [MKT_EnquiryTypes7].[EnquiryTypeName] AS MKT_EnquiryTypes7_EnquiryTypeName,
    [MKT_Months8].[MonthName] AS MKT_Months8_MonthName,
    [MKT_ProjectBases9].[BaseName] AS MKT_ProjectBases9_BaseName,
    [MKT_Regions10].[RegionName] AS MKT_Regions10_RegionName,
    [MKT_Sites11].[SiteName] AS MKT_Sites11_SiteName,
    [MKT_Verticals12].[VerticalName] AS MKT_Verticals12_VerticalName,
    [MKT_Years13].[YearName] AS MKT_Years13_YearName,
    [SPMT_ERPStates14].[Description] AS SPMT_ERPStates14_Description,
    [VR_BusinessPartner15].[BPName] AS VR_BusinessPartner15_BPName 
  FROM [MKT_Enquiry] 
      INNER JOIN #PageIndex
          ON [MKT_Enquiry].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_Enquiry].[ResponsibleSalsePerson] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [MKT_Enquiry].[CreatedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [MKT_Enquiry].[ModifiedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [MKT_Enquiry].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [MKT_BidderTypes] AS [MKT_BidderTypes5]
    ON [MKT_Enquiry].[BidderTypeID] = [MKT_BidderTypes5].[BidderTypeID]
  LEFT OUTER JOIN [MKT_EnquiryStatus] AS [MKT_EnquiryStatus6]
    ON [MKT_Enquiry].[StatusID] = [MKT_EnquiryStatus6].[StatusID]
  LEFT OUTER JOIN [MKT_EnquiryTypes] AS [MKT_EnquiryTypes7]
    ON [MKT_Enquiry].[EnquiryTypeID] = [MKT_EnquiryTypes7].[EnquiryTypeID]
  LEFT OUTER JOIN [MKT_Months] AS [MKT_Months8]
    ON [MKT_Enquiry].[OrderFinalizationMonth] = [MKT_Months8].[MktMonthID]
  LEFT OUTER JOIN [MKT_ProjectBases] AS [MKT_ProjectBases9]
    ON [MKT_Enquiry].[ProjectBaseID] = [MKT_ProjectBases9].[ProjectBaseID]
  LEFT OUTER JOIN [MKT_Regions] AS [MKT_Regions10]
    ON [MKT_Enquiry].[MktRegionID] = [MKT_Regions10].[MktRegionID]
  LEFT OUTER JOIN [MKT_Sites] AS [MKT_Sites11]
    ON [MKT_Enquiry].[MktSiteID] = [MKT_Sites11].[MktSiteID]
  LEFT OUTER JOIN [MKT_Verticals] AS [MKT_Verticals12]
    ON [MKT_Enquiry].[MktVericalID] = [MKT_Verticals12].[MktVericalID]
  LEFT OUTER JOIN [MKT_Years] AS [MKT_Years13]
    ON [MKT_Enquiry].[OrderFinalizationYear] = [MKT_Years13].[MktYearID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates14]
    ON [MKT_Enquiry].[IndianStateID] = [SPMT_ERPStates14].[StateID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]
    ON [MKT_Enquiry].[CustomerID] = [VR_BusinessPartner15].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryInsert]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryInsert]
  @ProspectNo NVarChar(50),
  @EnquiryDate DateTime,
  @MktVericalID Int,
  @CustomerName NVarChar(250),
  @CustomerID NVarChar(9),
  @MktSiteID Int,
  @MktRegionID Int,
  @IndianStateID NVarChar(2),
  @SiteLocation NVarChar(250),
  @ResponsibleSalsePerson NVarChar(8),
  @ProjectName NVarChar(250),
  @ProjectID NVarChar(6),
  @ProjectConsultant NVarChar(250),
  @BidApprovalRequired Bit,
  @ProjectBaseID Int,
  @CustomerKeyOfficials NVarChar(250),
  @BidSubmissionDate DateTime,
  @OrderFinalizationYear Int,
  @OrderFinalizationMonth Int,
  @ApproxProjectValue NVarChar(250),
  @EnquiryTypeID Int,
  @Competitors NVarChar(250),
  @ProjectFunding NVarChar(250),
  @BidderTypeID Int,
  @BriefScope NVarChar(1000),
  @ProjectStatus NVarChar(250),
  @PPAStatus NVarChar(250),
  @LandAcquisitionStatus NVarChar(250),
  @StatutoryClearanceStatus NVarChar(250),
  @PreQualificationRequirement NVarChar(250),
  @ProposedRiskreviewdate DateTime,
  @RiskReviewMeetingComments NVarChar(1000),
  @RiskReviewApproval Bit,
  @ModifiedBy NVarChar(8),
  @StatusID Int,
  @CreatedOn DateTime,
  @ModifiedOn DateTime,
  @CreatedBy NVarChar(8),
  @SalesPersonList NVarChar(250),
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [MKT_Enquiry]
  (
   [ProspectNo]
  ,[EnquiryDate]
  ,[MktVericalID]
  ,[CustomerName]
  ,[CustomerID]
  ,[MktSiteID]
  ,[MktRegionID]
  ,[IndianStateID]
  ,[SiteLocation]
  ,[ResponsibleSalsePerson]
  ,[ProjectName]
  ,[ProjectID]
  ,[ProjectConsultant]
  ,[BidApprovalRequired]
  ,[ProjectBaseID]
  ,[CustomerKeyOfficials]
  ,[BidSubmissionDate]
  ,[OrderFinalizationYear]
  ,[OrderFinalizationMonth]
  ,[ApproxProjectValue]
  ,[EnquiryTypeID]
  ,[Competitors]
  ,[ProjectFunding]
  ,[BidderTypeID]
  ,[BriefScope]
  ,[ProjectStatus]
  ,[PPAStatus]
  ,[LandAcquisitionStatus]
  ,[StatutoryClearanceStatus]
  ,[PreQualificationRequirement]
  ,[ProposedRiskreviewdate]
  ,[RiskReviewMeetingComments]
  ,[RiskReviewApproval]
  ,[ModifiedBy]
  ,[StatusID]
  ,[CreatedOn]
  ,[ModifiedOn]
  ,[CreatedBy]
  ,[SalesPersonList]
  )
  VALUES
  (
   @ProspectNo
  ,@EnquiryDate
  ,@MktVericalID
  ,@CustomerName
  ,@CustomerID
  ,@MktSiteID
  ,@MktRegionID
  ,@IndianStateID
  ,@SiteLocation
  ,@ResponsibleSalsePerson
  ,@ProjectName
  ,@ProjectID
  ,@ProjectConsultant
  ,@BidApprovalRequired
  ,@ProjectBaseID
  ,@CustomerKeyOfficials
  ,@BidSubmissionDate
  ,@OrderFinalizationYear
  ,@OrderFinalizationMonth
  ,@ApproxProjectValue
  ,@EnquiryTypeID
  ,@Competitors
  ,@ProjectFunding
  ,@BidderTypeID
  ,@BriefScope
  ,@ProjectStatus
  ,@PPAStatus
  ,@LandAcquisitionStatus
  ,@StatutoryClearanceStatus
  ,@PreQualificationRequirement
  ,@ProposedRiskreviewdate
  ,@RiskReviewMeetingComments
  ,@RiskReviewApproval
  ,@ModifiedBy
  ,@StatusID
  ,@CreatedOn
  ,@ModifiedOn
  ,@CreatedBy
  ,@SalesPersonList
  )
  SET @Return_SerialNo = Scope_Identity()
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryUpdate]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryUpdate]
  @Original_SerialNo Int, 
  @ProspectNo NVarChar(50),
  @EnquiryDate DateTime,
  @MktVericalID Int,
  @CustomerName NVarChar(250),
  @CustomerID NVarChar(9),
  @MktSiteID Int,
  @MktRegionID Int,
  @IndianStateID NVarChar(2),
  @SiteLocation NVarChar(250),
  @ResponsibleSalsePerson NVarChar(8),
  @ProjectName NVarChar(250),
  @ProjectID NVarChar(6),
  @ProjectConsultant NVarChar(250),
  @BidApprovalRequired Bit,
  @ProjectBaseID Int,
  @CustomerKeyOfficials NVarChar(250),
  @BidSubmissionDate DateTime,
  @OrderFinalizationYear Int,
  @OrderFinalizationMonth Int,
  @ApproxProjectValue NVarChar(250),
  @EnquiryTypeID Int,
  @Competitors NVarChar(250),
  @ProjectFunding NVarChar(250),
  @BidderTypeID Int,
  @BriefScope NVarChar(1000),
  @ProjectStatus NVarChar(250),
  @PPAStatus NVarChar(250),
  @LandAcquisitionStatus NVarChar(250),
  @StatutoryClearanceStatus NVarChar(250),
  @PreQualificationRequirement NVarChar(250),
  @ProposedRiskreviewdate DateTime,
  @RiskReviewMeetingComments NVarChar(1000),
  @RiskReviewApproval Bit,
  @ModifiedBy NVarChar(8),
  @StatusID Int,
  @CreatedOn DateTime,
  @ModifiedOn DateTime,
  @CreatedBy NVarChar(8),
  @SalesPersonList NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [MKT_Enquiry] SET 
   [ProspectNo] = @ProspectNo
  ,[EnquiryDate] = @EnquiryDate
  ,[MktVericalID] = @MktVericalID
  ,[CustomerName] = @CustomerName
  ,[CustomerID] = @CustomerID
  ,[MktSiteID] = @MktSiteID
  ,[MktRegionID] = @MktRegionID
  ,[IndianStateID] = @IndianStateID
  ,[SiteLocation] = @SiteLocation
  ,[ResponsibleSalsePerson] = @ResponsibleSalsePerson
  ,[ProjectName] = @ProjectName
  ,[ProjectID] = @ProjectID
  ,[ProjectConsultant] = @ProjectConsultant
  ,[BidApprovalRequired] = @BidApprovalRequired
  ,[ProjectBaseID] = @ProjectBaseID
  ,[CustomerKeyOfficials] = @CustomerKeyOfficials
  ,[BidSubmissionDate] = @BidSubmissionDate
  ,[OrderFinalizationYear] = @OrderFinalizationYear
  ,[OrderFinalizationMonth] = @OrderFinalizationMonth
  ,[ApproxProjectValue] = @ApproxProjectValue
  ,[EnquiryTypeID] = @EnquiryTypeID
  ,[Competitors] = @Competitors
  ,[ProjectFunding] = @ProjectFunding
  ,[BidderTypeID] = @BidderTypeID
  ,[BriefScope] = @BriefScope
  ,[ProjectStatus] = @ProjectStatus
  ,[PPAStatus] = @PPAStatus
  ,[LandAcquisitionStatus] = @LandAcquisitionStatus
  ,[StatutoryClearanceStatus] = @StatutoryClearanceStatus
  ,[PreQualificationRequirement] = @PreQualificationRequirement
  ,[ProposedRiskreviewdate] = @ProposedRiskreviewdate
  ,[RiskReviewMeetingComments] = @RiskReviewMeetingComments
  ,[RiskReviewApproval] = @RiskReviewApproval
  ,[ModifiedBy] = @ModifiedBy
  ,[StatusID] = @StatusID
  ,[CreatedOn] = @CreatedOn
  ,[ModifiedOn] = @ModifiedOn
  ,[CreatedBy] = @CreatedBy
  ,[SalesPersonList] = @SalesPersonList
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryDelete]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [MKT_Enquiry]
  WHERE
  [MKT_Enquiry].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktSalesPersonsSelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktSalesPersonsSelectByID]
GO
 
CREATE PROCEDURE [dbo].[spmktSalesPersonsSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @SalesPerson NVarChar(8) 
  AS
  SELECT
    [MKT_SalesPersons].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [MKT_Enquiry2].[ProspectNo] AS MKT_Enquiry2_ProspectNo 
  FROM [MKT_SalesPersons] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_SalesPersons].[SalesPerson] = [aspnet_users1].[LoginID]
  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry2]
    ON [MKT_SalesPersons].[SerialNo] = [MKT_Enquiry2].[SerialNo]
  WHERE
  [MKT_SalesPersons].[SerialNo] = @SerialNo
  AND [MKT_SalesPersons].[SalesPerson] = @SalesPerson
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktSalesPersonsSelectListSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktSalesPersonsSelectListSearch]
GO
 
CREATE PROCEDURE [dbo].[spmktSalesPersonsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
 ,SalesPerson NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo, SalesPerson)
  SELECT [MKT_SalesPersons].[SerialNo], [MKT_SalesPersons].[SalesPerson] FROM [MKT_SalesPersons]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_SalesPersons].[SalesPerson] = [aspnet_users1].[LoginID]
  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry2]
    ON [MKT_SalesPersons].[SerialNo] = [MKT_Enquiry2].[SerialNo]
 WHERE  
   ( 
         STR(ISNULL([MKT_SalesPersons].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_SalesPersons].[SalesPerson],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [MKT_SalesPersons].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [MKT_SalesPersons].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'SalesPerson' THEN [MKT_SalesPersons].[SalesPerson] END,
     CASE @OrderBy WHEN 'SalesPerson DESC' THEN [MKT_SalesPersons].[SalesPerson] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'MKT_Enquiry2_ProspectNo' THEN [MKT_Enquiry2].[ProspectNo] END,
     CASE @OrderBy WHEN 'MKT_Enquiry2_ProspectNo DESC' THEN [MKT_Enquiry2].[ProspectNo] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [MKT_SalesPersons].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [MKT_Enquiry2].[ProspectNo] AS MKT_Enquiry2_ProspectNo 
  FROM [MKT_SalesPersons] 
      INNER JOIN #PageIndex
          ON [MKT_SalesPersons].[SerialNo] = #PageIndex.SerialNo
          AND [MKT_SalesPersons].[SalesPerson] = #PageIndex.SalesPerson
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_SalesPersons].[SalesPerson] = [aspnet_users1].[LoginID]
  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry2]
    ON [MKT_SalesPersons].[SerialNo] = [MKT_Enquiry2].[SerialNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktSalesPersonsSelectListFilteres]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktSalesPersonsSelectListFilteres]
GO
 
CREATE PROCEDURE [dbo].[spmktSalesPersonsSelectListFilteres]
  @Filter_SerialNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
 ,SalesPerson NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', SalesPerson'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[MKT_SalesPersons].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [MKT_SalesPersons].[SalesPerson]'
  SET @LGSQL = @LGSQL + ' FROM [MKT_SalesPersons] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [MKT_SalesPersons].[SalesPerson] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry2]'
  SET @LGSQL = @LGSQL + '    ON [MKT_SalesPersons].[SerialNo] = [MKT_Enquiry2].[SerialNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [MKT_SalesPersons].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[MKT_SalesPersons].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[MKT_SalesPersons].[SerialNo] DESC'
                        WHEN 'SalesPerson' THEN '[MKT_SalesPersons].[SalesPerson]'
                        WHEN 'SalesPerson DESC' THEN '[MKT_SalesPersons].[SalesPerson] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'MKT_Enquiry2_ProspectNo' THEN '[MKT_Enquiry2].[ProspectNo]'
                        WHEN 'MKT_Enquiry2_ProspectNo DESC' THEN '[MKT_Enquiry2].[ProspectNo] DESC'
                        ELSE '[MKT_SalesPersons].[SerialNo],[MKT_SalesPersons].[SalesPerson]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [MKT_SalesPersons].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [MKT_Enquiry2].[ProspectNo] AS MKT_Enquiry2_ProspectNo 
  FROM [MKT_SalesPersons] 
      INNER JOIN #PageIndex
          ON [MKT_SalesPersons].[SerialNo] = #PageIndex.SerialNo
          AND [MKT_SalesPersons].[SalesPerson] = #PageIndex.SalesPerson
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MKT_SalesPersons].[SalesPerson] = [aspnet_users1].[LoginID]
  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry2]
    ON [MKT_SalesPersons].[SerialNo] = [MKT_Enquiry2].[SerialNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktSalesPersonsInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktSalesPersonsInsert]
GO
 
CREATE PROCEDURE [dbo].[spmktSalesPersonsInsert]
  @SerialNo Int,
  @SalesPerson NVarChar(8),
  @Return_SerialNo Int = null OUTPUT, 
  @Return_SalesPerson NVarChar(8) = null OUTPUT 
  AS
  INSERT [MKT_SalesPersons]
  (
   [SerialNo]
  ,[SalesPerson]
  )
  VALUES
  (
   @SerialNo
  ,UPPER(@SalesPerson)
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_SalesPerson = @SalesPerson
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktSalesPersonsUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktSalesPersonsUpdate]
GO
 
CREATE PROCEDURE [dbo].[spmktSalesPersonsUpdate]
  @Original_SerialNo Int, 
  @Original_SalesPerson NVarChar(8), 
  @SerialNo Int,
  @SalesPerson NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [MKT_SalesPersons] SET 
   [SerialNo] = @SerialNo
  ,[SalesPerson] = @SalesPerson
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [SalesPerson] = @Original_SalesPerson
  SET @RowCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktSalesPersonsDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktSalesPersonsDelete]
GO
 
CREATE PROCEDURE [dbo].[spmktSalesPersonsDelete]
  @Original_SerialNo Int,
  @Original_SalesPerson NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [MKT_SalesPersons]
  WHERE
  [MKT_SalesPersons].[SerialNo] = @Original_SerialNo
  AND [MKT_SalesPersons].[SalesPerson] = @Original_SalesPerson
  SET @RowCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryHistorySelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryHistorySelectByID]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryHistorySelectByID]
  @LoginID NVarChar(8),
  @HistoryID Int,
  @SerialNo Int 
  AS
  SELECT
    [MKT_EnquiryHistory].* ,
    [MKT_Enquiry1].[ProspectNo] AS MKT_Enquiry1_ProspectNo 
  FROM [MKT_EnquiryHistory] 
  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry1]
    ON [MKT_EnquiryHistory].[SerialNo] = [MKT_Enquiry1].[SerialNo]
  WHERE
  [MKT_EnquiryHistory].[HistoryID] = @HistoryID
  AND [MKT_EnquiryHistory].[SerialNo] = @SerialNo
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryHistorySelectListSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryHistorySelectListSearch]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryHistorySelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,HistoryID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (HistoryID, SerialNo)
  SELECT [MKT_EnquiryHistory].[HistoryID], [MKT_EnquiryHistory].[SerialNo] FROM [MKT_EnquiryHistory]
  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry1]
    ON [MKT_EnquiryHistory].[SerialNo] = [MKT_Enquiry1].[SerialNo]
 WHERE  
   ( 
         STR(ISNULL([MKT_EnquiryHistory].[HistoryID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ProspectNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[MktVericalID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[CustomerName],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[MktSiteID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[MktRegionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[IndianStateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[SiteLocation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[SalesPersonList],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ResponsibleSalsePerson],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ProjectName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ProjectConsultant],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[ProjectBaseID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[CustomerKeyOfficials],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[OrderFinalizationYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[OrderFinalizationMonth], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ApproxProjectValue],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[EnquiryTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[Competitors],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ProjectFunding],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[BidderTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[BriefScope],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ProjectStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[PPAStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[LandAcquisitionStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[StatutoryClearanceStatus],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[PreQualificationRequirement],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[RiskReviewMeetingComments],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MKT_EnquiryHistory].[ModifiedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([MKT_EnquiryHistory].[StatusID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'HistoryID' THEN [MKT_EnquiryHistory].[HistoryID] END,
     CASE @OrderBy WHEN 'HistoryID DESC' THEN [MKT_EnquiryHistory].[HistoryID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [MKT_EnquiryHistory].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [MKT_EnquiryHistory].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ProspectNo' THEN [MKT_EnquiryHistory].[ProspectNo] END,
     CASE @OrderBy WHEN 'ProspectNo DESC' THEN [MKT_EnquiryHistory].[ProspectNo] END DESC,
     CASE @OrderBy WHEN 'MktVericalID' THEN [MKT_EnquiryHistory].[MktVericalID] END,
     CASE @OrderBy WHEN 'MktVericalID DESC' THEN [MKT_EnquiryHistory].[MktVericalID] END DESC,
     CASE @OrderBy WHEN 'CustomerID' THEN [MKT_EnquiryHistory].[CustomerID] END,
     CASE @OrderBy WHEN 'CustomerID DESC' THEN [MKT_EnquiryHistory].[CustomerID] END DESC,
     CASE @OrderBy WHEN 'CustomerName' THEN [MKT_EnquiryHistory].[CustomerName] END,
     CASE @OrderBy WHEN 'CustomerName DESC' THEN [MKT_EnquiryHistory].[CustomerName] END DESC,
     CASE @OrderBy WHEN 'MktSiteID' THEN [MKT_EnquiryHistory].[MktSiteID] END,
     CASE @OrderBy WHEN 'MktSiteID DESC' THEN [MKT_EnquiryHistory].[MktSiteID] END DESC,
     CASE @OrderBy WHEN 'MktRegionID' THEN [MKT_EnquiryHistory].[MktRegionID] END,
     CASE @OrderBy WHEN 'MktRegionID DESC' THEN [MKT_EnquiryHistory].[MktRegionID] END DESC,
     CASE @OrderBy WHEN 'IndianStateID' THEN [MKT_EnquiryHistory].[IndianStateID] END,
     CASE @OrderBy WHEN 'IndianStateID DESC' THEN [MKT_EnquiryHistory].[IndianStateID] END DESC,
     CASE @OrderBy WHEN 'SiteLocation' THEN [MKT_EnquiryHistory].[SiteLocation] END,
     CASE @OrderBy WHEN 'SiteLocation DESC' THEN [MKT_EnquiryHistory].[SiteLocation] END DESC,
     CASE @OrderBy WHEN 'SalesPersonList' THEN [MKT_EnquiryHistory].[SalesPersonList] END,
     CASE @OrderBy WHEN 'SalesPersonList DESC' THEN [MKT_EnquiryHistory].[SalesPersonList] END DESC,
     CASE @OrderBy WHEN 'ResponsibleSalsePerson' THEN [MKT_EnquiryHistory].[ResponsibleSalsePerson] END,
     CASE @OrderBy WHEN 'ResponsibleSalsePerson DESC' THEN [MKT_EnquiryHistory].[ResponsibleSalsePerson] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [MKT_EnquiryHistory].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [MKT_EnquiryHistory].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProjectName' THEN [MKT_EnquiryHistory].[ProjectName] END,
     CASE @OrderBy WHEN 'ProjectName DESC' THEN [MKT_EnquiryHistory].[ProjectName] END DESC,
     CASE @OrderBy WHEN 'ProjectConsultant' THEN [MKT_EnquiryHistory].[ProjectConsultant] END,
     CASE @OrderBy WHEN 'ProjectConsultant DESC' THEN [MKT_EnquiryHistory].[ProjectConsultant] END DESC,
     CASE @OrderBy WHEN 'BidApprovalRequired' THEN [MKT_EnquiryHistory].[BidApprovalRequired] END,
     CASE @OrderBy WHEN 'BidApprovalRequired DESC' THEN [MKT_EnquiryHistory].[BidApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'ProjectBaseID' THEN [MKT_EnquiryHistory].[ProjectBaseID] END,
     CASE @OrderBy WHEN 'ProjectBaseID DESC' THEN [MKT_EnquiryHistory].[ProjectBaseID] END DESC,
     CASE @OrderBy WHEN 'CustomerKeyOfficials' THEN [MKT_EnquiryHistory].[CustomerKeyOfficials] END,
     CASE @OrderBy WHEN 'CustomerKeyOfficials DESC' THEN [MKT_EnquiryHistory].[CustomerKeyOfficials] END DESC,
     CASE @OrderBy WHEN 'BidSubmissionDate' THEN [MKT_EnquiryHistory].[BidSubmissionDate] END,
     CASE @OrderBy WHEN 'BidSubmissionDate DESC' THEN [MKT_EnquiryHistory].[BidSubmissionDate] END DESC,
     CASE @OrderBy WHEN 'OrderFinalizationYear' THEN [MKT_EnquiryHistory].[OrderFinalizationYear] END,
     CASE @OrderBy WHEN 'OrderFinalizationYear DESC' THEN [MKT_EnquiryHistory].[OrderFinalizationYear] END DESC,
     CASE @OrderBy WHEN 'OrderFinalizationMonth' THEN [MKT_EnquiryHistory].[OrderFinalizationMonth] END,
     CASE @OrderBy WHEN 'OrderFinalizationMonth DESC' THEN [MKT_EnquiryHistory].[OrderFinalizationMonth] END DESC,
     CASE @OrderBy WHEN 'ApproxProjectValue' THEN [MKT_EnquiryHistory].[ApproxProjectValue] END,
     CASE @OrderBy WHEN 'ApproxProjectValue DESC' THEN [MKT_EnquiryHistory].[ApproxProjectValue] END DESC,
     CASE @OrderBy WHEN 'EnquiryTypeID' THEN [MKT_EnquiryHistory].[EnquiryTypeID] END,
     CASE @OrderBy WHEN 'EnquiryTypeID DESC' THEN [MKT_EnquiryHistory].[EnquiryTypeID] END DESC,
     CASE @OrderBy WHEN 'Competitors' THEN [MKT_EnquiryHistory].[Competitors] END,
     CASE @OrderBy WHEN 'Competitors DESC' THEN [MKT_EnquiryHistory].[Competitors] END DESC,
     CASE @OrderBy WHEN 'ProjectFunding' THEN [MKT_EnquiryHistory].[ProjectFunding] END,
     CASE @OrderBy WHEN 'ProjectFunding DESC' THEN [MKT_EnquiryHistory].[ProjectFunding] END DESC,
     CASE @OrderBy WHEN 'BidderTypeID' THEN [MKT_EnquiryHistory].[BidderTypeID] END,
     CASE @OrderBy WHEN 'BidderTypeID DESC' THEN [MKT_EnquiryHistory].[BidderTypeID] END DESC,
     CASE @OrderBy WHEN 'BriefScope' THEN [MKT_EnquiryHistory].[BriefScope] END,
     CASE @OrderBy WHEN 'BriefScope DESC' THEN [MKT_EnquiryHistory].[BriefScope] END DESC,
     CASE @OrderBy WHEN 'ProjectStatus' THEN [MKT_EnquiryHistory].[ProjectStatus] END,
     CASE @OrderBy WHEN 'ProjectStatus DESC' THEN [MKT_EnquiryHistory].[ProjectStatus] END DESC,
     CASE @OrderBy WHEN 'PPAStatus' THEN [MKT_EnquiryHistory].[PPAStatus] END,
     CASE @OrderBy WHEN 'PPAStatus DESC' THEN [MKT_EnquiryHistory].[PPAStatus] END DESC,
     CASE @OrderBy WHEN 'LandAcquisitionStatus' THEN [MKT_EnquiryHistory].[LandAcquisitionStatus] END,
     CASE @OrderBy WHEN 'LandAcquisitionStatus DESC' THEN [MKT_EnquiryHistory].[LandAcquisitionStatus] END DESC,
     CASE @OrderBy WHEN 'StatutoryClearanceStatus' THEN [MKT_EnquiryHistory].[StatutoryClearanceStatus] END,
     CASE @OrderBy WHEN 'StatutoryClearanceStatus DESC' THEN [MKT_EnquiryHistory].[StatutoryClearanceStatus] END DESC,
     CASE @OrderBy WHEN 'PreQualificationRequirement' THEN [MKT_EnquiryHistory].[PreQualificationRequirement] END,
     CASE @OrderBy WHEN 'PreQualificationRequirement DESC' THEN [MKT_EnquiryHistory].[PreQualificationRequirement] END DESC,
     CASE @OrderBy WHEN 'ProposedRiskreviewdate' THEN [MKT_EnquiryHistory].[ProposedRiskreviewdate] END,
     CASE @OrderBy WHEN 'ProposedRiskreviewdate DESC' THEN [MKT_EnquiryHistory].[ProposedRiskreviewdate] END DESC,
     CASE @OrderBy WHEN 'RiskReviewMeetingComments' THEN [MKT_EnquiryHistory].[RiskReviewMeetingComments] END,
     CASE @OrderBy WHEN 'RiskReviewMeetingComments DESC' THEN [MKT_EnquiryHistory].[RiskReviewMeetingComments] END DESC,
     CASE @OrderBy WHEN 'RiskReviewApproval' THEN [MKT_EnquiryHistory].[RiskReviewApproval] END,
     CASE @OrderBy WHEN 'RiskReviewApproval DESC' THEN [MKT_EnquiryHistory].[RiskReviewApproval] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [MKT_EnquiryHistory].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [MKT_EnquiryHistory].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [MKT_EnquiryHistory].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [MKT_EnquiryHistory].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'ModifiedBy' THEN [MKT_EnquiryHistory].[ModifiedBy] END,
     CASE @OrderBy WHEN 'ModifiedBy DESC' THEN [MKT_EnquiryHistory].[ModifiedBy] END DESC,
     CASE @OrderBy WHEN 'ModifiedOn' THEN [MKT_EnquiryHistory].[ModifiedOn] END,
     CASE @OrderBy WHEN 'ModifiedOn DESC' THEN [MKT_EnquiryHistory].[ModifiedOn] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [MKT_EnquiryHistory].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [MKT_EnquiryHistory].[StatusID] END DESC,
     CASE @OrderBy WHEN 'EnquiryDate' THEN [MKT_EnquiryHistory].[EnquiryDate] END,
     CASE @OrderBy WHEN 'EnquiryDate DESC' THEN [MKT_EnquiryHistory].[EnquiryDate] END DESC,
     CASE @OrderBy WHEN 'MKT_Enquiry1_ProspectNo' THEN [MKT_Enquiry1].[ProspectNo] END,
     CASE @OrderBy WHEN 'MKT_Enquiry1_ProspectNo DESC' THEN [MKT_Enquiry1].[ProspectNo] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [MKT_EnquiryHistory].* ,
    [MKT_Enquiry1].[ProspectNo] AS MKT_Enquiry1_ProspectNo 
  FROM [MKT_EnquiryHistory] 
      INNER JOIN #PageIndex
          ON [MKT_EnquiryHistory].[HistoryID] = #PageIndex.HistoryID
          AND [MKT_EnquiryHistory].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry1]
    ON [MKT_EnquiryHistory].[SerialNo] = [MKT_Enquiry1].[SerialNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryHistorySelectListFilteres]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryHistorySelectListFilteres]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryHistorySelectListFilteres]
  @Filter_SerialNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,HistoryID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'HistoryID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[MKT_EnquiryHistory].[HistoryID]'
  SET @LGSQL = @LGSQL + ', [MKT_EnquiryHistory].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [MKT_EnquiryHistory] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry1]'
  SET @LGSQL = @LGSQL + '    ON [MKT_EnquiryHistory].[SerialNo] = [MKT_Enquiry1].[SerialNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [MKT_EnquiryHistory].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'HistoryID' THEN '[MKT_EnquiryHistory].[HistoryID]'
                        WHEN 'HistoryID DESC' THEN '[MKT_EnquiryHistory].[HistoryID] DESC'
                        WHEN 'SerialNo' THEN '[MKT_EnquiryHistory].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[MKT_EnquiryHistory].[SerialNo] DESC'
                        WHEN 'ProspectNo' THEN '[MKT_EnquiryHistory].[ProspectNo]'
                        WHEN 'ProspectNo DESC' THEN '[MKT_EnquiryHistory].[ProspectNo] DESC'
                        WHEN 'MktVericalID' THEN '[MKT_EnquiryHistory].[MktVericalID]'
                        WHEN 'MktVericalID DESC' THEN '[MKT_EnquiryHistory].[MktVericalID] DESC'
                        WHEN 'CustomerID' THEN '[MKT_EnquiryHistory].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[MKT_EnquiryHistory].[CustomerID] DESC'
                        WHEN 'CustomerName' THEN '[MKT_EnquiryHistory].[CustomerName]'
                        WHEN 'CustomerName DESC' THEN '[MKT_EnquiryHistory].[CustomerName] DESC'
                        WHEN 'MktSiteID' THEN '[MKT_EnquiryHistory].[MktSiteID]'
                        WHEN 'MktSiteID DESC' THEN '[MKT_EnquiryHistory].[MktSiteID] DESC'
                        WHEN 'MktRegionID' THEN '[MKT_EnquiryHistory].[MktRegionID]'
                        WHEN 'MktRegionID DESC' THEN '[MKT_EnquiryHistory].[MktRegionID] DESC'
                        WHEN 'IndianStateID' THEN '[MKT_EnquiryHistory].[IndianStateID]'
                        WHEN 'IndianStateID DESC' THEN '[MKT_EnquiryHistory].[IndianStateID] DESC'
                        WHEN 'SiteLocation' THEN '[MKT_EnquiryHistory].[SiteLocation]'
                        WHEN 'SiteLocation DESC' THEN '[MKT_EnquiryHistory].[SiteLocation] DESC'
                        WHEN 'SalesPersonList' THEN '[MKT_EnquiryHistory].[SalesPersonList]'
                        WHEN 'SalesPersonList DESC' THEN '[MKT_EnquiryHistory].[SalesPersonList] DESC'
                        WHEN 'ResponsibleSalsePerson' THEN '[MKT_EnquiryHistory].[ResponsibleSalsePerson]'
                        WHEN 'ResponsibleSalsePerson DESC' THEN '[MKT_EnquiryHistory].[ResponsibleSalsePerson] DESC'
                        WHEN 'ProjectID' THEN '[MKT_EnquiryHistory].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[MKT_EnquiryHistory].[ProjectID] DESC'
                        WHEN 'ProjectName' THEN '[MKT_EnquiryHistory].[ProjectName]'
                        WHEN 'ProjectName DESC' THEN '[MKT_EnquiryHistory].[ProjectName] DESC'
                        WHEN 'ProjectConsultant' THEN '[MKT_EnquiryHistory].[ProjectConsultant]'
                        WHEN 'ProjectConsultant DESC' THEN '[MKT_EnquiryHistory].[ProjectConsultant] DESC'
                        WHEN 'BidApprovalRequired' THEN '[MKT_EnquiryHistory].[BidApprovalRequired]'
                        WHEN 'BidApprovalRequired DESC' THEN '[MKT_EnquiryHistory].[BidApprovalRequired] DESC'
                        WHEN 'ProjectBaseID' THEN '[MKT_EnquiryHistory].[ProjectBaseID]'
                        WHEN 'ProjectBaseID DESC' THEN '[MKT_EnquiryHistory].[ProjectBaseID] DESC'
                        WHEN 'CustomerKeyOfficials' THEN '[MKT_EnquiryHistory].[CustomerKeyOfficials]'
                        WHEN 'CustomerKeyOfficials DESC' THEN '[MKT_EnquiryHistory].[CustomerKeyOfficials] DESC'
                        WHEN 'BidSubmissionDate' THEN '[MKT_EnquiryHistory].[BidSubmissionDate]'
                        WHEN 'BidSubmissionDate DESC' THEN '[MKT_EnquiryHistory].[BidSubmissionDate] DESC'
                        WHEN 'OrderFinalizationYear' THEN '[MKT_EnquiryHistory].[OrderFinalizationYear]'
                        WHEN 'OrderFinalizationYear DESC' THEN '[MKT_EnquiryHistory].[OrderFinalizationYear] DESC'
                        WHEN 'OrderFinalizationMonth' THEN '[MKT_EnquiryHistory].[OrderFinalizationMonth]'
                        WHEN 'OrderFinalizationMonth DESC' THEN '[MKT_EnquiryHistory].[OrderFinalizationMonth] DESC'
                        WHEN 'ApproxProjectValue' THEN '[MKT_EnquiryHistory].[ApproxProjectValue]'
                        WHEN 'ApproxProjectValue DESC' THEN '[MKT_EnquiryHistory].[ApproxProjectValue] DESC'
                        WHEN 'EnquiryTypeID' THEN '[MKT_EnquiryHistory].[EnquiryTypeID]'
                        WHEN 'EnquiryTypeID DESC' THEN '[MKT_EnquiryHistory].[EnquiryTypeID] DESC'
                        WHEN 'Competitors' THEN '[MKT_EnquiryHistory].[Competitors]'
                        WHEN 'Competitors DESC' THEN '[MKT_EnquiryHistory].[Competitors] DESC'
                        WHEN 'ProjectFunding' THEN '[MKT_EnquiryHistory].[ProjectFunding]'
                        WHEN 'ProjectFunding DESC' THEN '[MKT_EnquiryHistory].[ProjectFunding] DESC'
                        WHEN 'BidderTypeID' THEN '[MKT_EnquiryHistory].[BidderTypeID]'
                        WHEN 'BidderTypeID DESC' THEN '[MKT_EnquiryHistory].[BidderTypeID] DESC'
                        WHEN 'BriefScope' THEN '[MKT_EnquiryHistory].[BriefScope]'
                        WHEN 'BriefScope DESC' THEN '[MKT_EnquiryHistory].[BriefScope] DESC'
                        WHEN 'ProjectStatus' THEN '[MKT_EnquiryHistory].[ProjectStatus]'
                        WHEN 'ProjectStatus DESC' THEN '[MKT_EnquiryHistory].[ProjectStatus] DESC'
                        WHEN 'PPAStatus' THEN '[MKT_EnquiryHistory].[PPAStatus]'
                        WHEN 'PPAStatus DESC' THEN '[MKT_EnquiryHistory].[PPAStatus] DESC'
                        WHEN 'LandAcquisitionStatus' THEN '[MKT_EnquiryHistory].[LandAcquisitionStatus]'
                        WHEN 'LandAcquisitionStatus DESC' THEN '[MKT_EnquiryHistory].[LandAcquisitionStatus] DESC'
                        WHEN 'StatutoryClearanceStatus' THEN '[MKT_EnquiryHistory].[StatutoryClearanceStatus]'
                        WHEN 'StatutoryClearanceStatus DESC' THEN '[MKT_EnquiryHistory].[StatutoryClearanceStatus] DESC'
                        WHEN 'PreQualificationRequirement' THEN '[MKT_EnquiryHistory].[PreQualificationRequirement]'
                        WHEN 'PreQualificationRequirement DESC' THEN '[MKT_EnquiryHistory].[PreQualificationRequirement] DESC'
                        WHEN 'ProposedRiskreviewdate' THEN '[MKT_EnquiryHistory].[ProposedRiskreviewdate]'
                        WHEN 'ProposedRiskreviewdate DESC' THEN '[MKT_EnquiryHistory].[ProposedRiskreviewdate] DESC'
                        WHEN 'RiskReviewMeetingComments' THEN '[MKT_EnquiryHistory].[RiskReviewMeetingComments]'
                        WHEN 'RiskReviewMeetingComments DESC' THEN '[MKT_EnquiryHistory].[RiskReviewMeetingComments] DESC'
                        WHEN 'RiskReviewApproval' THEN '[MKT_EnquiryHistory].[RiskReviewApproval]'
                        WHEN 'RiskReviewApproval DESC' THEN '[MKT_EnquiryHistory].[RiskReviewApproval] DESC'
                        WHEN 'CreatedBy' THEN '[MKT_EnquiryHistory].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[MKT_EnquiryHistory].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[MKT_EnquiryHistory].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[MKT_EnquiryHistory].[CreatedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[MKT_EnquiryHistory].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[MKT_EnquiryHistory].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[MKT_EnquiryHistory].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[MKT_EnquiryHistory].[ModifiedOn] DESC'
                        WHEN 'StatusID' THEN '[MKT_EnquiryHistory].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[MKT_EnquiryHistory].[StatusID] DESC'
                        WHEN 'EnquiryDate' THEN '[MKT_EnquiryHistory].[EnquiryDate]'
                        WHEN 'EnquiryDate DESC' THEN '[MKT_EnquiryHistory].[EnquiryDate] DESC'
                        WHEN 'MKT_Enquiry1_ProspectNo' THEN '[MKT_Enquiry1].[ProspectNo]'
                        WHEN 'MKT_Enquiry1_ProspectNo DESC' THEN '[MKT_Enquiry1].[ProspectNo] DESC'
                        ELSE '[MKT_EnquiryHistory].[HistoryID],[MKT_EnquiryHistory].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [MKT_EnquiryHistory].* ,
    [MKT_Enquiry1].[ProspectNo] AS MKT_Enquiry1_ProspectNo 
  FROM [MKT_EnquiryHistory] 
      INNER JOIN #PageIndex
          ON [MKT_EnquiryHistory].[HistoryID] = #PageIndex.HistoryID
          AND [MKT_EnquiryHistory].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [MKT_Enquiry] AS [MKT_Enquiry1]
    ON [MKT_EnquiryHistory].[SerialNo] = [MKT_Enquiry1].[SerialNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryHistoryInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryHistoryInsert]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryHistoryInsert]
  @SerialNo Int,
  @ProspectNo NVarChar(50),
  @MktVericalID Int,
  @CustomerID NVarChar(9),
  @CustomerName NVarChar(250),
  @MktSiteID Int,
  @MktRegionID Int,
  @IndianStateID NVarChar(2),
  @SiteLocation NVarChar(250),
  @SalesPersonList NVarChar(250),
  @ResponsibleSalsePerson NVarChar(8),
  @ProjectID NVarChar(6),
  @ProjectName NVarChar(250),
  @ProjectConsultant NVarChar(250),
  @BidApprovalRequired Bit,
  @ProjectBaseID Int,
  @CustomerKeyOfficials NVarChar(250),
  @BidSubmissionDate DateTime,
  @OrderFinalizationYear Int,
  @OrderFinalizationMonth Int,
  @ApproxProjectValue NVarChar(250),
  @EnquiryTypeID Int,
  @Competitors NVarChar(250),
  @ProjectFunding NVarChar(250),
  @BidderTypeID Int,
  @BriefScope NVarChar(1000),
  @ProjectStatus NVarChar(250),
  @PPAStatus NVarChar(250),
  @LandAcquisitionStatus NVarChar(250),
  @StatutoryClearanceStatus NVarChar(250),
  @PreQualificationRequirement NVarChar(250),
  @ProposedRiskreviewdate DateTime,
  @RiskReviewMeetingComments NVarChar(1000),
  @RiskReviewApproval Bit,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @ModifiedBy NVarChar(8),
  @ModifiedOn DateTime,
  @StatusID Int,
  @EnquiryDate DateTime,
  @Return_HistoryID Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [MKT_EnquiryHistory]
  (
   [SerialNo]
  ,[ProspectNo]
  ,[MktVericalID]
  ,[CustomerID]
  ,[CustomerName]
  ,[MktSiteID]
  ,[MktRegionID]
  ,[IndianStateID]
  ,[SiteLocation]
  ,[SalesPersonList]
  ,[ResponsibleSalsePerson]
  ,[ProjectID]
  ,[ProjectName]
  ,[ProjectConsultant]
  ,[BidApprovalRequired]
  ,[ProjectBaseID]
  ,[CustomerKeyOfficials]
  ,[BidSubmissionDate]
  ,[OrderFinalizationYear]
  ,[OrderFinalizationMonth]
  ,[ApproxProjectValue]
  ,[EnquiryTypeID]
  ,[Competitors]
  ,[ProjectFunding]
  ,[BidderTypeID]
  ,[BriefScope]
  ,[ProjectStatus]
  ,[PPAStatus]
  ,[LandAcquisitionStatus]
  ,[StatutoryClearanceStatus]
  ,[PreQualificationRequirement]
  ,[ProposedRiskreviewdate]
  ,[RiskReviewMeetingComments]
  ,[RiskReviewApproval]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[ModifiedBy]
  ,[ModifiedOn]
  ,[StatusID]
  ,[EnquiryDate]
  )
  VALUES
  (
   @SerialNo
  ,@ProspectNo
  ,@MktVericalID
  ,@CustomerID
  ,@CustomerName
  ,@MktSiteID
  ,@MktRegionID
  ,@IndianStateID
  ,@SiteLocation
  ,@SalesPersonList
  ,@ResponsibleSalsePerson
  ,@ProjectID
  ,@ProjectName
  ,@ProjectConsultant
  ,@BidApprovalRequired
  ,@ProjectBaseID
  ,@CustomerKeyOfficials
  ,@BidSubmissionDate
  ,@OrderFinalizationYear
  ,@OrderFinalizationMonth
  ,@ApproxProjectValue
  ,@EnquiryTypeID
  ,@Competitors
  ,@ProjectFunding
  ,@BidderTypeID
  ,@BriefScope
  ,@ProjectStatus
  ,@PPAStatus
  ,@LandAcquisitionStatus
  ,@StatutoryClearanceStatus
  ,@PreQualificationRequirement
  ,@ProposedRiskreviewdate
  ,@RiskReviewMeetingComments
  ,@RiskReviewApproval
  ,@CreatedBy
  ,@CreatedOn
  ,@ModifiedBy
  ,@ModifiedOn
  ,@StatusID
  ,@EnquiryDate
  )
  SET @Return_HistoryID = Scope_Identity()
  SET @Return_SerialNo = @SerialNo
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryHistoryUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryHistoryUpdate]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryHistoryUpdate]
  @Original_HistoryID Int, 
  @Original_SerialNo Int, 
  @SerialNo Int,
  @ProspectNo NVarChar(50),
  @MktVericalID Int,
  @CustomerID NVarChar(9),
  @CustomerName NVarChar(250),
  @MktSiteID Int,
  @MktRegionID Int,
  @IndianStateID NVarChar(2),
  @SiteLocation NVarChar(250),
  @SalesPersonList NVarChar(250),
  @ResponsibleSalsePerson NVarChar(8),
  @ProjectID NVarChar(6),
  @ProjectName NVarChar(250),
  @ProjectConsultant NVarChar(250),
  @BidApprovalRequired Bit,
  @ProjectBaseID Int,
  @CustomerKeyOfficials NVarChar(250),
  @BidSubmissionDate DateTime,
  @OrderFinalizationYear Int,
  @OrderFinalizationMonth Int,
  @ApproxProjectValue NVarChar(250),
  @EnquiryTypeID Int,
  @Competitors NVarChar(250),
  @ProjectFunding NVarChar(250),
  @BidderTypeID Int,
  @BriefScope NVarChar(1000),
  @ProjectStatus NVarChar(250),
  @PPAStatus NVarChar(250),
  @LandAcquisitionStatus NVarChar(250),
  @StatutoryClearanceStatus NVarChar(250),
  @PreQualificationRequirement NVarChar(250),
  @ProposedRiskreviewdate DateTime,
  @RiskReviewMeetingComments NVarChar(1000),
  @RiskReviewApproval Bit,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @ModifiedBy NVarChar(8),
  @ModifiedOn DateTime,
  @StatusID Int,
  @EnquiryDate DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [MKT_EnquiryHistory] SET 
   [SerialNo] = @SerialNo
  ,[ProspectNo] = @ProspectNo
  ,[MktVericalID] = @MktVericalID
  ,[CustomerID] = @CustomerID
  ,[CustomerName] = @CustomerName
  ,[MktSiteID] = @MktSiteID
  ,[MktRegionID] = @MktRegionID
  ,[IndianStateID] = @IndianStateID
  ,[SiteLocation] = @SiteLocation
  ,[SalesPersonList] = @SalesPersonList
  ,[ResponsibleSalsePerson] = @ResponsibleSalsePerson
  ,[ProjectID] = @ProjectID
  ,[ProjectName] = @ProjectName
  ,[ProjectConsultant] = @ProjectConsultant
  ,[BidApprovalRequired] = @BidApprovalRequired
  ,[ProjectBaseID] = @ProjectBaseID
  ,[CustomerKeyOfficials] = @CustomerKeyOfficials
  ,[BidSubmissionDate] = @BidSubmissionDate
  ,[OrderFinalizationYear] = @OrderFinalizationYear
  ,[OrderFinalizationMonth] = @OrderFinalizationMonth
  ,[ApproxProjectValue] = @ApproxProjectValue
  ,[EnquiryTypeID] = @EnquiryTypeID
  ,[Competitors] = @Competitors
  ,[ProjectFunding] = @ProjectFunding
  ,[BidderTypeID] = @BidderTypeID
  ,[BriefScope] = @BriefScope
  ,[ProjectStatus] = @ProjectStatus
  ,[PPAStatus] = @PPAStatus
  ,[LandAcquisitionStatus] = @LandAcquisitionStatus
  ,[StatutoryClearanceStatus] = @StatutoryClearanceStatus
  ,[PreQualificationRequirement] = @PreQualificationRequirement
  ,[ProposedRiskreviewdate] = @ProposedRiskreviewdate
  ,[RiskReviewMeetingComments] = @RiskReviewMeetingComments
  ,[RiskReviewApproval] = @RiskReviewApproval
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  ,[StatusID] = @StatusID
  ,[EnquiryDate] = @EnquiryDate
  WHERE
  [HistoryID] = @Original_HistoryID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spmktEnquiryHistoryDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spmktEnquiryHistoryDelete]
GO
 
CREATE PROCEDURE [dbo].[spmktEnquiryHistoryDelete]
  @Original_HistoryID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [MKT_EnquiryHistory]
  WHERE
  [MKT_EnquiryHistory].[HistoryID] = @Original_HistoryID
  AND [MKT_EnquiryHistory].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
  GO

SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

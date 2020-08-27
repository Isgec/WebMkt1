Partial Class RP_mktEnquiry
  Inherits System.Web.UI.Page
  Private _InfoUrl As String = "~/MKT_Main/App_Display/DF_mktEnquiry.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?SerialNo=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim aVal() As String = Request.QueryString("pk").Split("|".ToCharArray)
    Dim SerialNo As Int32 = CType(aVal(0),Int32)
    Dim oVar As SIS.MKT.mktEnquiry = SIS.MKT.mktEnquiry.mktEnquiryGetByID(SerialNo)
    Dim oTblmktEnquiry As New Table
    oTblmktEnquiry.Width = 1000
    oTblmktEnquiry.GridLines = GridLines.Both
    oTblmktEnquiry.Style.Add("margin-top", "15px")
    oTblmktEnquiry.Style.Add("margin-left", "10px")
    Dim oColmktEnquiry As TableCell = Nothing
    Dim oRowmktEnquiry As TableRow = Nothing
    oRowmktEnquiry = New TableRow
    oColmktEnquiry = New TableCell
    oColmktEnquiry.Text = "Serial No"
    oColmktEnquiry.Font.Bold = True
    oRowmktEnquiry.Cells.Add(oColmktEnquiry)
    oColmktEnquiry = New TableCell
    oColmktEnquiry.Text = oVar.SerialNo
      oColmktEnquiry.Style.Add("text-align","right")
    oColmktEnquiry.ColumnSpan = "2"
    oRowmktEnquiry.Cells.Add(oColmktEnquiry)
    oColmktEnquiry = New TableCell
    oColmktEnquiry.Text = "Prospect No"
    oColmktEnquiry.Font.Bold = True
    oRowmktEnquiry.Cells.Add(oColmktEnquiry)
    oColmktEnquiry = New TableCell
    oColmktEnquiry.Text = oVar.ProspectNo
      oColmktEnquiry.Style.Add("text-align","left")
    oColmktEnquiry.ColumnSpan = "2"
    oRowmktEnquiry.Cells.Add(oColmktEnquiry)
    oTblmktEnquiry.Rows.Add(oRowmktEnquiry)
    form1.Controls.Add(oTblmktEnquiry)
      Dim oTblmktSalesPersons As Table = Nothing
      Dim oRowmktSalesPersons As TableRow = Nothing
      Dim oColmktSalesPersons As TableCell = Nothing
    Dim omktSalesPersonss As List(Of SIS.MKT.mktSalesPersons) = SIS.MKT.mktSalesPersons.mktSalesPersonsSelectList(0, 999, "", False, "", oVar.SerialNo)
    If omktSalesPersonss.Count > 0 Then
      Dim oTblhmktSalesPersons As Table = New Table
      oTblhmktSalesPersons.Width = 1000
      oTblhmktSalesPersons.Style.Add("margin-top", "15px")
      oTblhmktSalesPersons.Style.Add("margin-left", "10px")
      oTblhmktSalesPersons.Style.Add("margin-right", "10px")
      Dim oRowhmktSalesPersons As TableRow = New TableRow
      Dim oColhmktSalesPersons As TableCell = New TableCell
      oColhmktSalesPersons.Font.Bold = True
      oColhmktSalesPersons.Font.UnderLine = True
      oColhmktSalesPersons.Font.Size = 10
      oColhmktSalesPersons.CssClass = "grpHD"
      oColhmktSalesPersons.Text = "Sales Persons List"
      oRowhmktSalesPersons.Cells.Add(oColhmktSalesPersons)
      oTblhmktSalesPersons.Rows.Add(oRowhmktSalesPersons)
      form1.Controls.Add(oTblhmktSalesPersons)
      oTblmktSalesPersons = New Table
      oTblmktSalesPersons.Width = 1000
      oTblmktSalesPersons.GridLines = GridLines.Both
      oTblmktSalesPersons.Style.Add("margin-left", "10px")
      oTblmktSalesPersons.Style.Add("margin-right", "10px")
      oRowmktSalesPersons = New TableRow
      oColmktSalesPersons = New TableCell
      oColmktSalesPersons.Text = "Serial No"
      oColmktSalesPersons.Font.Bold = True
      oColmktSalesPersons.CssClass = "colHD"
      oColmktSalesPersons.Style.Add("text-align","right")
      oRowmktSalesPersons.Cells.Add(oColmktSalesPersons)
      oColmktSalesPersons = New TableCell
      oColmktSalesPersons.Text = "Sales Person"
      oColmktSalesPersons.Font.Bold = True
      oColmktSalesPersons.CssClass = "colHD"
      oColmktSalesPersons.Style.Add("text-align","left")
      oRowmktSalesPersons.Cells.Add(oColmktSalesPersons)
      oTblmktSalesPersons.Rows.Add(oRowmktSalesPersons)
      For Each omktSalesPersons As SIS.MKT.mktSalesPersons In omktSalesPersonss
        oRowmktSalesPersons = New TableRow
        oColmktSalesPersons = New TableCell
        oColmktSalesPersons.Text = omktSalesPersons.MKT_Enquiry2_ProspectNo
        oColmktSalesPersons.CssClass = "rowHD"
      oColmktSalesPersons.Style.Add("text-align","right")
        oRowmktSalesPersons.Cells.Add(oColmktSalesPersons)
        oColmktSalesPersons = New TableCell
        oColmktSalesPersons.Text = omktSalesPersons.aspnet_users1_UserFullName
        oColmktSalesPersons.CssClass = "rowHD"
      oColmktSalesPersons.Style.Add("text-align","left")
        oRowmktSalesPersons.Cells.Add(oColmktSalesPersons)
        oTblmktSalesPersons.Rows.Add(oRowmktSalesPersons)
      Next
      form1.Controls.Add(oTblmktSalesPersons)
    End If
      Dim oTblmktEnquiryHistory As Table = Nothing
      Dim oRowmktEnquiryHistory As TableRow = Nothing
      Dim oColmktEnquiryHistory As TableCell = Nothing
    Dim omktEnquiryHistorys As List(Of SIS.MKT.mktEnquiryHistory) = SIS.MKT.mktEnquiryHistory.mktEnquiryHistorySelectList(0, 999, "", False, "", oVar.SerialNo)
    If omktEnquiryHistorys.Count > 0 Then
      Dim oTblhmktEnquiryHistory As Table = New Table
      oTblhmktEnquiryHistory.Width = 1000
      oTblhmktEnquiryHistory.Style.Add("margin-top", "15px")
      oTblhmktEnquiryHistory.Style.Add("margin-left", "10px")
      oTblhmktEnquiryHistory.Style.Add("margin-right", "10px")
      Dim oRowhmktEnquiryHistory As TableRow = New TableRow
      Dim oColhmktEnquiryHistory As TableCell = New TableCell
      oColhmktEnquiryHistory.Font.Bold = True
      oColhmktEnquiryHistory.Font.UnderLine = True
      oColhmktEnquiryHistory.Font.Size = 10
      oColhmktEnquiryHistory.CssClass = "grpHD"
      oColhmktEnquiryHistory.Text = "Enquiry History"
      oRowhmktEnquiryHistory.Cells.Add(oColhmktEnquiryHistory)
      oTblhmktEnquiryHistory.Rows.Add(oRowhmktEnquiryHistory)
      form1.Controls.Add(oTblhmktEnquiryHistory)
      oTblmktEnquiryHistory = New Table
      oTblmktEnquiryHistory.Width = 1000
      oTblmktEnquiryHistory.GridLines = GridLines.Both
      oTblmktEnquiryHistory.Style.Add("margin-left", "10px")
      oTblmktEnquiryHistory.Style.Add("margin-right", "10px")
      oRowmktEnquiryHistory = New TableRow
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "History ID"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Serial No"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Prospect No"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Marketing Verical"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Customer ID"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Customer Name"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Site"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Region"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Indian State"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Site Location"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Sales Person List"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Responsible Salse Person"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Project ID"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Project Name"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Project Consultant"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Bid Approval Required"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","center")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Project Base"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Customer Key Officials"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Bid Submission Date"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","center")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Order Finalization Year"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Order Finalization Month"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Approx Project Value"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Enquiry Type"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Competitors"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Project Funding"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Bidder Type"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Brief Scope"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Project Status"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "PPA Status"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Land Acquisition Status"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Statutory Clearance Status"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Pre-Qualification Requirement"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Proposed Risk Review Date"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","center")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Risk Review Meeting Comments"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Risk Review Approval"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","center")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Created By"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Created On"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","center")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Modified By"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","left")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Modified On"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","center")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Status"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oColmktEnquiryHistory = New TableCell
      oColmktEnquiryHistory.Text = "Enquiry Date"
      oColmktEnquiryHistory.Font.Bold = True
      oColmktEnquiryHistory.CssClass = "colHD"
      oColmktEnquiryHistory.Style.Add("text-align","center")
      oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
      oTblmktEnquiryHistory.Rows.Add(oRowmktEnquiryHistory)
      For Each omktEnquiryHistory As SIS.MKT.mktEnquiryHistory In omktEnquiryHistorys
        oRowmktEnquiryHistory = New TableRow
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.HistoryID
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.Text = omktEnquiryHistory.MKT_Enquiry1_ProspectNo
        oColmktEnquiryHistory.CssClass = "rowHD"
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ProspectNo
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.MktVericalID
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.CustomerID
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.CustomerName
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.MktSiteID
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.MktRegionID
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.IndianStateID
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.SiteLocation
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.SalesPersonList
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ResponsibleSalsePerson
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ProjectID
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ProjectName
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ProjectConsultant
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = IIf(omktEnquiryHistory.BidApprovalRequired, "YES", "NO")
      oColmktEnquiryHistory.Style.Add("text-align","center")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ProjectBaseID
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.CustomerKeyOfficials
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.BidSubmissionDate
      oColmktEnquiryHistory.Style.Add("text-align","center")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.OrderFinalizationYear
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.OrderFinalizationMonth
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ApproxProjectValue
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.EnquiryTypeID
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.Competitors
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ProjectFunding
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.BidderTypeID
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.BriefScope
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ProjectStatus
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.PPAStatus
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.LandAcquisitionStatus
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.StatutoryClearanceStatus
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.PreQualificationRequirement
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ProposedRiskreviewdate
      oColmktEnquiryHistory.Style.Add("text-align","center")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.RiskReviewMeetingComments
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = IIf(omktEnquiryHistory.RiskReviewApproval, "YES", "NO")
      oColmktEnquiryHistory.Style.Add("text-align","center")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.CreatedBy
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.CreatedOn
      oColmktEnquiryHistory.Style.Add("text-align","center")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ModifiedBy
      oColmktEnquiryHistory.Style.Add("text-align","left")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.ModifiedOn
      oColmktEnquiryHistory.Style.Add("text-align","center")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.StatusID
      oColmktEnquiryHistory.Style.Add("text-align","right")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oColmktEnquiryHistory = New TableCell
        oColmktEnquiryHistory.CssClass = "rowHD"
        oColmktEnquiryHistory.Text = omktEnquiryHistory.EnquiryDate
      oColmktEnquiryHistory.Style.Add("text-align","center")
        oRowmktEnquiryHistory.Cells.Add(oColmktEnquiryHistory)
        oTblmktEnquiryHistory.Rows.Add(oRowmktEnquiryHistory)
      Next
      form1.Controls.Add(oTblmktEnquiryHistory)
    End If
  End Sub
End Class

Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.MKT
  <DataObject()> _
  Partial Public Class mktSalesPersons
    Private Shared _RecordCount As Integer
    Public Property SerialNo As Int32 = 0
    Public Property SalesPerson As String = ""
    Public Property aspnet_Users1_UserFullName As String = ""
    Public Property MKT_Enquiry2_ProspectNo As String = ""
    Private _FK_MKT_SalesPersons_SalesPerson As SIS.QCM.qcmUsers = Nothing
    Private _FK_MKT_SalesPersons_SerialNo As SIS.MKT.mktEnquiry = Nothing
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
    Public Readonly Property DisplayField() As String
      Get
        Return ""
      End Get
    End Property
    Public Readonly Property PrimaryKey() As String
      Get
        Return _SerialNo & "|" & _SalesPerson
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
    Public Class PKmktSalesPersons
      Private _SerialNo As Int32 = 0
      Private _SalesPerson As String = ""
      Public Property SerialNo() As Int32
        Get
          Return _SerialNo
        End Get
        Set(ByVal value As Int32)
          _SerialNo = value
        End Set
      End Property
      Public Property SalesPerson() As String
        Get
          Return _SalesPerson
        End Get
        Set(ByVal value As String)
          _SalesPerson = value
        End Set
      End Property
    End Class
    Public ReadOnly Property FK_MKT_SalesPersons_SalesPerson() As SIS.QCM.qcmUsers
      Get
        If _FK_MKT_SalesPersons_SalesPerson Is Nothing Then
          _FK_MKT_SalesPersons_SalesPerson = SIS.QCM.qcmUsers.qcmUsersGetByID(_SalesPerson)
        End If
        Return _FK_MKT_SalesPersons_SalesPerson
      End Get
    End Property
    Public ReadOnly Property FK_MKT_SalesPersons_SerialNo() As SIS.MKT.mktEnquiry
      Get
        If _FK_MKT_SalesPersons_SerialNo Is Nothing Then
          _FK_MKT_SalesPersons_SerialNo = SIS.MKT.mktEnquiry.mktEnquiryGetByID(_SerialNo)
        End If
        Return _FK_MKT_SalesPersons_SerialNo
      End Get
    End Property
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktSalesPersonsGetNewRecord() As SIS.MKT.mktSalesPersons
      Return New SIS.MKT.mktSalesPersons()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktSalesPersonsGetByID(ByVal SerialNo As Int32, ByVal SalesPerson As String) As SIS.MKT.mktSalesPersons
      Dim Results As SIS.MKT.mktSalesPersons = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktSalesPersonsSelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo",SqlDbType.Int,SerialNo.ToString.Length, SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SalesPerson",SqlDbType.NVarChar,SalesPerson.ToString.Length, SalesPerson)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Reader.Read() Then
            Results = New SIS.MKT.mktSalesPersons(Reader)
          End If
          Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktSalesPersonsSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal SerialNo As Int32) As List(Of SIS.MKT.mktSalesPersons)
      Dim Results As List(Of SIS.MKT.mktSalesPersons) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "spmktSalesPersonsSelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "spmktSalesPersonsSelectListFilteres"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_SerialNo",SqlDbType.Int,10, IIf(SerialNo = Nothing, 0,SerialNo))
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.MKT.mktSalesPersons)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.MKT.mktSalesPersons(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function mktSalesPersonsSelectCount(ByVal SearchState As Boolean, ByVal SearchText As String, ByVal SerialNo As Int32) As Integer
      Return _RecordCount
    End Function
      'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function mktSalesPersonsGetByID(ByVal SerialNo As Int32, ByVal SalesPerson As String, ByVal Filter_SerialNo As Int32) As SIS.MKT.mktSalesPersons
      Return mktSalesPersonsGetByID(SerialNo, SalesPerson)
    End Function
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function mktSalesPersonsInsert(ByVal Record As SIS.MKT.mktSalesPersons) As SIS.MKT.mktSalesPersons
      Dim _Rec As SIS.MKT.mktSalesPersons = SIS.MKT.mktSalesPersons.mktSalesPersonsGetNewRecord()
      With _Rec
        .SerialNo = Record.SerialNo
        .SalesPerson = Record.SalesPerson
      End With
      Return SIS.MKT.mktSalesPersons.InsertData(_Rec)
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.MKT.mktSalesPersons) As SIS.MKT.mktSalesPersons
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktSalesPersonsInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo",SqlDbType.Int,11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SalesPerson",SqlDbType.NVarChar,9, Record.SalesPerson)
          Cmd.Parameters.Add("@Return_SerialNo", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_SerialNo").Direction = ParameterDirection.Output
          Cmd.Parameters.Add("@Return_SalesPerson", SqlDbType.NVarChar, 9)
          Cmd.Parameters("@Return_SalesPerson").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          Record.SerialNo = Cmd.Parameters("@Return_SerialNo").Value
          Record.SalesPerson = Cmd.Parameters("@Return_SalesPerson").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function mktSalesPersonsUpdate(ByVal Record As SIS.MKT.mktSalesPersons) As SIS.MKT.mktSalesPersons
      Dim _Rec As SIS.MKT.mktSalesPersons = SIS.MKT.mktSalesPersons.mktSalesPersonsGetByID(Record.SerialNo, Record.SalesPerson)
      With _Rec
      End With
      Return SIS.MKT.mktSalesPersons.UpdateData(_Rec)
    End Function
    Public Shared Function UpdateData(ByVal Record As SIS.MKT.mktSalesPersons) As SIS.MKT.mktSalesPersons
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktSalesPersonsUpdate"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SerialNo",SqlDbType.Int,11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SalesPerson",SqlDbType.NVarChar,9, Record.SalesPerson)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo",SqlDbType.Int,11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SalesPerson",SqlDbType.NVarChar,9, Record.SalesPerson)
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
    Public Shared Function mktSalesPersonsDelete(ByVal Record As SIS.MKT.mktSalesPersons) As Int32
      Dim _Result as Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spmktSalesPersonsDelete"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SerialNo",SqlDbType.Int,Record.SerialNo.ToString.Length, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SalesPerson",SqlDbType.NVarChar,Record.SalesPerson.ToString.Length, Record.SalesPerson)
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

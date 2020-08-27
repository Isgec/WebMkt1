﻿Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.Script.Serialization
Imports Ionic
Imports Ionic.Zip
Imports ejiVault
Partial Class docdownload
  Inherits System.Web.UI.Page
  Private st As Long = HttpContext.Current.Server.ScriptTimeout
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    HttpContext.Current.Server.ScriptTimeout = Integer.MaxValue
    Dim Value As String = ""
    If Request.QueryString("doc") IsNot Nothing Then
      Value = Request.QueryString("doc")
      DownloadDoc(Value)
    End If
    If Request.QueryString("sdoc") IsNot Nothing Then
      Value = Request.QueryString("sdoc")
      DownloadSDoc(Value)
    End If
    'If Request.QueryString("stmtl") IsNot Nothing Then
    '  Value = Request.QueryString("stmtl")
    '  DownloadSAll(Value)
    'End If

  End Sub




  Private Sub DownloadDoc(ByVal pk As String)
    Dim docHndl As String = "TRANSMITTALLINES_200"
    Dim docIndx As String = pk.Replace("|", "_")
    Dim libPath As String = ""
    Dim filePath As String = ""
    Dim fileName As String = ""
    Response.Clear()
    Dim rDoc As EJI.ediAFile = EJI.ediAFile.GetFileByHandleIndex(docHndl, docIndx)
    If rDoc IsNot Nothing Then
      Dim rLib As EJI.ediALib = EJI.ediALib.GetLibraryByID(rDoc.t_lbcd)
      If rLib IsNot Nothing Then
        If Not EJI.DBCommon.IsLocalISGECVault Then
          EJI.ediALib.ConnectISGECVault(rLib)
        End If
        libPath = rLib.LibraryPath
        filePath = libPath & "\" & rDoc.t_dcid
        fileName = rDoc.t_fnam
        Response.AppendHeader("content-disposition", "attachment; filename=" & fileName)
        Response.ContentType = SIS.SYS.Utilities.ApplicationSpacific.ContentType(fileName)
        If IO.File.Exists(filePath) Then
          Response.WriteFile(filePath)
        End If
        If Not EJI.DBCommon.IsLocalISGECVault Then
          EJI.ediALib.DisconnectISGECVault()
        End If
        Response.End()
      End If
    End If
  End Sub

  Private Sub DownloadSDoc(ByVal pk As String)
    Dim docHndl As String = "TRANSMITTALLINES_200"
    Dim docIndx As String = pk.Replace("|", "_")
    Dim libPath As String = ""
    Dim filePath As String = ""
    Dim fileName As String = ""
    Response.Clear()
    Dim rDoc As EJI.ediAFile = EJI.ediAFile.GetFileByHandleIndex(docHndl, docIndx)
    If rDoc IsNot Nothing Then
      Dim rLib As EJI.ediALib = EJI.ediALib.GetLibraryByID(rDoc.t_lbcd)
      If rLib IsNot Nothing Then
        If Not EJI.DBCommon.IsLocalISGECVault Then
          EJI.ediALib.ConnectISGECVault(rLib)
        End If
        libPath = rLib.LibraryPath
        filePath = libPath & "\" & rDoc.t_dcid
        fileName = rDoc.t_fnam
        Response.AppendHeader("content-disposition", "attachment; filename=" & fileName)
        Response.ContentType = SIS.SYS.Utilities.ApplicationSpacific.ContentType(fileName)
        If IO.File.Exists(filePath) Then
          Response.WriteFile(filePath)
        End If
        If Not EJI.DBCommon.IsLocalISGECVault Then
          EJI.ediALib.DisconnectISGECVault()
        End If
        Response.End()
      End If
    End If
  End Sub
End Class

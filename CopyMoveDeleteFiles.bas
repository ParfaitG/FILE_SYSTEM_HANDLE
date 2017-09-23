Option Explicit

' EXCEL VBA

'''''''''''''''''''''''''''''''''''''
''''' FILE(S) SELECT MANAGEMENT
'''''''''''''''''''''''''''''''''''''
Function CopySelectFiles(strSrc As String, strDest As String, strPattern As String)
On Error GoTo ErrHandle
    Dim fso As Object
    Dim obj As Variant
    Dim regEx As Object, i As Integer
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set regEx = CreateObject("VBScript.RegExp")
    
    ' SET REGEX OBJECT
    With regEx
        .Global = True
        .MultiLine = True
        .IgnoreCase = False
        .Pattern = strPattern
    End With
       
    ' ITERATE THROUGH FOLDER
    If Len(Dir(strDest, vbDirectory)) = 0 Then
        MkDir strDest
    End If
    
    i = 10
    For Each obj In fso.GetFolder(strSrc).Files
        If regEx.test(obj.Name) Then
            fso.CopyFile strSrc & "\" & obj.Name, strDest & "\" & obj.Name, True
            Worksheets("MAIN").Range("E" & i).Value = strSrc & "\" & obj.Name & " copying..."
            
            i = i + 1
        End If
    Next obj
    
    MsgBox "Successfully completed!", vbInformation
    
ExitHandle:
    Set regEx = Nothing
    Set fso = Nothing
    Exit Function

ErrHandle:
    Call RunError(Err.Number, Err.Description)
    Resume ExitHandle
End Function

Function MoveSelectFiles(strSrc As String, strDest As String, strPattern As String)
On Error GoTo ErrHandle
    Dim fso As Object
    Dim obj As Variant
    Dim regEx As Object
    Dim currFile As String, i As Integer
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set regEx = CreateObject("VBScript.RegExp")
    
    ' SET REGEX OBJECT
    With regEx
        .Global = True
        .MultiLine = True
        .IgnoreCase = False
        .Pattern = strPattern
    End With
        
    ' ITERATE THROUGH FOLDER
    If Len(Dir(strDest, vbDirectory)) = 0 Then
        MkDir strDest
    End If
    
    i = 10
    For Each obj In fso.GetFolder(strSrc).Files
        currFile = obj.Name
        
        If regEx.test(obj.Name) Then
            If fso.FileExists(strDest & "\" & obj.Name) Then
                fso.DeleteFile strDest & "\" & obj.Name
            End If
            fso.MoveFile strSrc & "\" & obj.Name, strDest & "\" & obj.Name
            Worksheets("MAIN").Range("E" & i).Value = strSrc & "\" & currFile & " moving..."
            
            i = i + 1
        End If
    Next obj
    
    MsgBox "Successfully completed!", vbInformation
    
ExitHandle:
    Set regEx = Nothing
    Set fso = Nothing
    Exit Function

ErrHandle:
    Call RunError(Err.Number, Err.Description)
    Resume ExitHandle
End Function

Function DeleteSelectFiles(strSrc As String, strPattern As String)
On Error GoTo ErrHandle
    Dim fso As Object
    Dim obj As Variant
    Dim regEx As Object
    Dim currFile As String, i As Integer
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set regEx = CreateObject("VBScript.RegExp")
    
    ' SET REGEX OBJECT
    With regEx
        .Global = True
        .MultiLine = True
        .IgnoreCase = False
        .Pattern = strPattern
    End With
      
    ' ITERATE THROUGH FOLDER
    i = 10
    For Each obj In fso.GetFolder(strSrc).Files
        currFile = obj.Name
        
        If regEx.test(obj.Name) Then
            fso.DeleteFile strSrc & "\" & obj.Name
            Worksheets("MAIN").Range("E" & i).Value = strSrc & "\" & currFile & " deleting..."
            
            i = i + 1
        End If
    Next obj
    
    MsgBox "Successfully completed!", vbInformation
    
ExitHandle:
    Set regEx = Nothing
    Set fso = Nothing
    Exit Function

ErrHandle:
    Call RunError(Err.Number, Err.Description)
    Resume ExitHandle
End Function


'''''''''''''''''''''''''''''''''''''
''''' FILE(S) BULK MANAGEMENT
'''''''''''''''''''''''''''''''''''''
Function CopyBulkFiles(strSrc As String, strDest As String)
On Error GoTo ErrHandle
    Dim fso As Object
    Dim obj As Variant
    Dim i As Integer
    
    Set fso = CreateObject("Scripting.FileSystemObject")
      
    ' ITERATE THROUGH FOLDER
    If Len(Dir(strDest, vbDirectory)) = 0 Then
        MkDir strDest
    End If
    
    i = 10
    For Each obj In fso.GetFolder(strSrc).Files
        fso.CopyFile strSrc & "\" & obj.Name, strDest & "\" & obj.Name, True
        Worksheets("MAIN").Range("E" & i).Value = strSrc & "\" & obj.Name & " copying..."
        
        i = i + 1
    Next obj
    
    MsgBox "Successfully completed!", vbInformation
    
ExitHandle:
    Set fso = Nothing
    Exit Function

ErrHandle:
    Call RunError(Err.Number, Err.Description)
    Resume ExitHandle
End Function

Function MoveBulkFiles(strSrc As String, strDest As String)
On Error GoTo ErrHandle
    Dim fso As Object
    Dim obj As Variant
    Dim currFile As String, i As Integer
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    ' ITERATE THROUGH FOLDER
    If Len(Dir(strDest, vbDirectory)) = 0 Then
        MkDir strDest
    End If
    
    i = 10
    For Each obj In fso.GetFolder(strSrc).Files
        currFile = obj.Name
        If fso.FileExists(strDest & "\" & obj.Name) Then
            fso.DeleteFile strDest & "\" & obj.Name
        End If
        fso.MoveFile strSrc & "\" & obj.Name, strDest & "\" & obj.Name
        Worksheets("MAIN").Range("E" & i).Value = strSrc & "\" & currFile & " moving..."
        
        i = i + 1
    Next obj
    
    MsgBox "Successfully completed!", vbInformation
    
ExitHandle:
    Set fso = Nothing
    Exit Function

ErrHandle:
    Call RunError(Err.Number, Err.Description)
    Resume ExitHandle
End Function

Function DeleteBulkFiles(strSrc As String)
On Error GoTo ErrHandle
    Dim fso As Object
    Dim obj As Variant
    Dim currFile As String, i As Integer
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    ' ITERATE THROUGH FOLDER
    i = 10
    For Each obj In fso.GetFolder(strSrc).Files
        currFile = obj.Name
        
        fso.DeleteFile strSrc & "\" & obj.Name
        Worksheets("MAIN").Range("E" & i).Value = strSrc & "\" & currFile & " deleting..."
        
        i = i + 1
    Next obj
    
    MsgBox "Successfully completed!", vbInformation
    
ExitHandle:
    Set fso = Nothing
    Exit Function

ErrHandle:
    Call RunError(Err.Number, Err.Description)
    Resume ExitHandle
End Function


Public Sub RunFct()
On Error GoTo ErrHandle

    With Worksheets("MAIN")
        .Range("E10:E2000").ClearContents
        
        Select Case .Range("E3")
    
            Case "-cs", "cs"
            Call CopySelectFiles(.Range("E4"), .Range("E5"), .Range("E6"))
                        
            Case "-ms", "ms"
            Call MoveSelectFiles(.Range("E4"), .Range("E5"), .Range("E6"))
            
            Case "-ds", "ds"
            Call DeleteSelectFiles(.Range("E4"), .Range("E6"))
            
            Case "-cb", "cb"
            Call CopyBulkFiles(.Range("E4"), .Range("E5"))
                        
            Case "-mb", "mb"
            Call MoveBulkFiles(.Range("E4"), .Range("E5"))
            
            Case "-db", "db"
            Call DeleteBulkFiles(.Range("E4"))
            
            Case Else
            MsgBox "Unknown command. Please refer to list on right hand side and try again.", vbExclamation
            
        End Select
    End With
                  
ExitHandle:
    Exit Sub

ErrHandle:
    MsgBox Err.Number & " - " & Err.Description, vbCritical
    Resume ExitHandle
End Sub

Function RunError(errNumber As Integer, errDesc As String)

    Select Case errNumber
    
        Case 70
        If errNumber = 70 Then
            MsgBox "Please check arguments are properly filled." & vbNewLine & _
                   "If needed, refer to list on right hand side and try again.", vbExclamation
        Else
            MsgBox errNumber & " - " & errDesc, vbCritical
        End If

    End Select
    
End Function


B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=9
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Private fx As JFX
	
End Sub

Public Sub ArrToList(r As Int, c As Int, arr(,) As Int) As List
	Dim lst As List
	lst.Initialize
	For i = 0 To r - 1
		For j = 0 To c - 1
			lst.Add(arr(i, j))
		Next
	Next
	Return lst
End Sub

Public Sub ListToArr(r As Int, c As Int, lst As List)  
	Dim k As Int = 0
	For i = 0 To r - 1
		For j = 0 To c - 1
			Main.IndexFreePnl(i, j) = lst.Get(k)
			k = k + 1
		Next
	Next
End Sub

Public Sub IsRadioReg(Num As String) As Int ' Есть ли станция в списке
	For Each i As String In Main.NumsMap.Keys
		If Main.NumsMap.Get(i) = Num Then
			Return i
		End If
	Next
	Return -1
End Sub

Public Sub GetFreeIndex(Pnl As Int) As Int
	For i = 0 To 9
		If Main.IndexFreePnl(Pnl,i) = 0 Then
			Main.IndexFreePnl(Pnl,i) = 1
			Return i
		End If
	Next
	Return -1
End Sub

Public Sub RestoreRadio
	Dim cnt As Int = 0
	Dim IdxOnPnl(4) As Int
	
	For Each i As String In Main.RegMap.Keys
		Main.Radio1(cnt).Initialize(Me, "Radio" & cnt)
		Main.Radio1(cnt).AddToParent(Main.Shops(Main.RegMap.Get(i)), 5dip, 10dip + IdxOnPnl(Main.RegMap.Get(i)) * 46 , 290, 260)
		Main.Radio1(cnt).SetMembers(Main.NumsMap.Get(i) , Main.NamesMap.Get(i) )
		Main.Radio1(cnt).SetRegIndx(Main.RegMap.Get(i), IdxOnPnl(Main.RegMap.Get(i)))
		IdxOnPnl(Main.RegMap.Get(i)) = IdxOnPnl(Main.RegMap.Get(i)) + 1
		cnt = cnt + 1
	Next
	
End Sub

Public Sub ToUnsigned(b As Byte) As Int
	Return Bit.And(0xFF, b)
End Sub




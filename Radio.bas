B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.95
@EndOfDesignText@
'Custom View class
#Event: ExampleEvent (Value As Int)
#DesignerProperty: Key: BooleanExample, DisplayName: Boolean Example, FieldType: Boolean, DefaultValue: True, Description: Example of a boolean property.
#DesignerProperty: Key: IntExample, DisplayName: Int Example, FieldType: Int, DefaultValue: 10, MinRange: 0, MaxRange: 100, Description: Note that MinRange and MaxRange are optional.
#DesignerProperty: Key: StringWithListExample, DisplayName: String With List, FieldType: String, DefaultValue: Sunday, List: Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday
#DesignerProperty: Key: StringExample, DisplayName: String Example, FieldType: String, DefaultValue: Text
#DesignerProperty: Key: ColorExample, DisplayName: Color Example, FieldType: Color, DefaultValue: 0xFFCFDCDC, Description: You can use the built-in color picker to find the color values.
#DesignerProperty: Key: DefaultColorExample, DisplayName: Default Color Example, FieldType: Color, DefaultValue: Null, Description: Setting the default value to Null means that a nullable field will be displayed.
Sub Class_Globals
	Private fx As JFX
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Private mBase As Pane
	Private Radio1 As Radio
	Private Timer1, Timer2 As Timer
	Private ImageView1 As ImageView
	Private bmpUp1 As Image = fx.LoadImage(File.DirAssets,"radioUp1.png")
	Private bmpUp2 As Image = fx.LoadImage(File.DirAssets,"radioUp2.png")
	Private bmpDwn1 As Image = fx.LoadImage(File.DirAssets,"radioDwn1.png")
	Private bmpDwn2 As Image = fx.LoadImage(File.DirAssets,"radioDwn2.png")
	Private m_indexOnPane As Int
	Private lblName As Label
	Private lblNum As Label
	Private lblReg As Label
End Sub

Public Sub Initialize(Callback As Object, EventName As String)
	
	mEventName = EventName
	mCallBack = Callback
	
End Sub

Public Sub DesignerCreateView (Base As Pane, Lbl As Label, Props As Map)
	mBase = Base
	
End Sub

Private Sub Base_Resize (Width As Double, Height As Double)
	
End Sub

Public Sub GetBase As Pane
	Return mBase
End Sub

Public Sub SetMembers(Num As Int, Name As String)
	lblNum.Text =  Num
	lblName.Text = Name
End Sub

Public Sub SetRegIndx(Reg As Int, Index As Int)
	lblReg.Text =  Reg
	m_indexOnPane = Index
End Sub

Public Sub GetReg As Int
	Return lblReg.Text
End Sub

Public Sub GetIndex As Int
	Return m_indexOnPane
End Sub

Public Sub SetAlarm 
	ImageView1.SetImage(bmpDwn1)
	Timer1.Initialize("Timer1", 300)
	Timer1.Enabled = True
End Sub

Public Sub ResetAlarm 
	ImageView1.SetImage(bmpUp1)
	Timer1.Enabled = False
End Sub




Public Sub AddToParent(Parent As Pane, Left As Int, Top As Int, Width As Int,Height As Int)
	mBase.Initialize("mBase")
	mBase.LoadLayout("Radio1")
	Parent.AddNode(mBase, Left, Top, Width, Height)
	
End Sub

Private Sub Timer1_Tick
	If ImageView1.GetImage = bmpUp2 Then
		ImageView1.SetImage(bmpUp1)
	Else If ImageView1.GetImage = bmpUp1 Then
		ImageView1.SetImage(bmpUp2)
	End If
	
	If ImageView1.GetImage = bmpDwn2 Then
		ImageView1.SetImage(bmpDwn1)
	Else If ImageView1.GetImage = bmpDwn1 Then
		ImageView1.SetImage(bmpDwn2)
	End If
	'Log("timer")
	'Dim bmp As Image = fx.LoadImage(File.DirAssets, "radioUp2.png")
	
End Sub

Public Sub StartTimer
	Timer1.Initialize("Timer1", 300)
	Timer1.Enabled = True
	Timer2.Initialize("Timer2", 3000)
	Timer2.Enabled = True
End Sub

Private Sub Timer2_Tick
	Timer1.Enabled = False
	Timer2.Enabled = False 
	ImageView1.SetImage(bmpUp1)
End Sub





Private Sub ImageView1_MouseClicked (EventData As MouseEvent)
	Timer1.Enabled = False
	ImageView1.SetImage(bmpUp1)
End Sub
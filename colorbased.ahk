#NoEnv    
SendMode Input  
SetWorkingDir %A_ScriptDir%  
#SingleInstance, Force 
FirX := (A_ScreenWidth - A_ScreenWidth + 200) 
FirY := (A_ScreenHeight - A_ScreenHeight + 200)

MidX := A_ScreenWidth / 2 
MidY := A_ScreenHeight / 2 

;OPTIMIZATIONS START
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
;OPTIMIZATIONS END

CoordMode, Mouse, Screen 
CoordMode, Pixel, Screen 
MidX := A_ScreenWidth / 2 
MidY := A_ScreenHeight / 2 
;Triggerbot = 0 
;Sense = 3

aim := 0xE6E04B

;GUI===============================
Gui, Show, x%FirX% y%FirY% w100 h100, Runtime Broker
Gui, Color, aqua
Gui, -Caption
Gui, Add, Text, x2 y2, chocoKrunk!
Gui, Add, Text, x-1 y10, ----------------------------------------------------------------------------
Gui, Add, Checkbox, x25 y35 vAimSet gAimbot, Aimbot 
Gui, Add, Text, x2 y65, Aim Smoothness
Gui, Add, Text, x65 y65 vSen w100, 
Gui, Add, Slider, x-3 y80 w105 vSense gOui ToolTip Thick8 Range1-10 NoTicks, 3
Gui, Add, Button, x2 y100 w100 gCreds, CREDITS

MyColor = EEAA99  
Gui OSD:+LastFound +AlwaysOnTop -Caption +ToolWindow  
Gui, OSD:Color, %MyColor%
Gui, OSD:Font, s26  
WinSet, TransColor, %MyColor% 155
Gui, OSD:Show, x0 y0 NoActivate 
return 

Aimbot: 
Gui, Submit, NoHide 
~RButton::
{
	While GetKeyState("RButton"){
		PixelSearch, TargetX, TargetY, 900, 480, 1020, 600, aim, 7, Fast, RGB
		If ErrorLevel = 0 {
			Gui, Submit, NoHide 
			if (AimSet == 1) { 
				TargetX := TargetX + 42
				TargetY := TargetY + 30
				MoveX := ((TargetX - MidX) / Sense) 
				MoveY := ((TargetY - MidY) / Sense) 
				MouseMove, MoveX, %MoveY%,, R
				if (TriggerBot = 1) {
					Click, down
					sleep 30
					Click, up
				}
			}
		}
	}

Return

Oui:
	Gui, Submit, NoHide
Return

FovBox:
	Gui, Submit, NoHide
Return

Creds:
	MsgBox, chocochat on YT!

y::exitapp
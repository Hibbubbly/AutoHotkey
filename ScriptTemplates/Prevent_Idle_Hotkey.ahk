#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; --------------------
; INPUT
; --------------------

TargetWindow := "notepad.exe"		; .exe name of program
NonIdleKey := "m"					; key to send to prevent idling
IdleInterval := 10000				; interval between keystrokes in ms

; --------------------
; HOTKEY
; --------------------
; Will tab into target window and press target key

#MaxThreadsPerHotkey 2

^NumpadAdd::
SetKeyDelay, 50, 50
toggle := !toggle ; switch toggle between 0 and 1
SoundBeep
while toggle ; active when toggle is 1
{
	WinGetActiveTitle, actwintit
	Sleep 500
	WinActivate, ahk_exe %TargetWindow%
	Sleep 500
	Send %NonIdleKey%
	SoundBeep
	Sleep 500
	WinActivate, % actwintit
	Sleep %IdleInterval%
}
Return

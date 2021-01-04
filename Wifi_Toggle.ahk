#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^NumpadDiv::
run *runas %comspec% /c netsh interface set interface name="WiFi" admin=disabled,,hide
SoundBeep
return

^NumpadMult::
run *runas %comspec% /c netsh interface set interface name="WiFi" admin=enabled,,hide
SoundBeep
return


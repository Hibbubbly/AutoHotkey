#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 2

*$NumpadSub::
{
	toggle:=!toggle
	if (toggle)
		{
		send {LShift down}
		}
	else
		{
		send {LShift up}
		}
}
return

/* COMMENTS
currently uses NumpadSub to toggle holding LShift
$ allows script to be toggled by the same key it sends
* wildcard allows for toggle press regardless of modifier 
e.g. LShift+1 sends ! which will not toggle without this
*/

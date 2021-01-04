; -------------------------------------
; INITIALISE SCRIPT
; -------------------------------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; -------------------------------------
; INPUTS
; -------------------------------------
; Input desired folder paths here in quotation marks with no backslash at end

SaveFolderPath := "please insert path to save folder"
BackupFolderPath := "please insert path to desired backup location"

; -------------------------------------
; INI CONFIG
; -------------------------------------
; Sets up config file to persist file names across script instances
; Save backup number stored as variable "archiveindex"

IniFilePath := BackupFolderPath . "\archindex.ini"

ifExist, %IniFilePath%
{
	IniRead, archiveindex, %BackupFolderPath%\archindex.ini, section1, archindex
	; Msgbox % "Initial index is " . Format("{:03} ",archiveindex)
}
else
{
	IniWrite, 001, %BackupFolderPath%\archindex.ini, section1, archindex
	IniRead, archiveindex, %BackupFolderPath%\archindex.ini, section1, archindex
	; Msgbox % "Ini file created"
}
return

; -------------------------------------
; HOTKEY SCRIPT
; -------------------------------------
; Binds hotkey to file backup

^NumpadSub::

BackupName := BackupFolderPath . "\" Format("{:03} ",archiveindex)
run *runas %comspec% /c xcopy "%SaveFolderPath%" "%BackupName%" /E/H/I
archiveindex := Format("{:03} ",archiveindex + 1)
Iniwrite, %archiveindex%, %BackupFolderPath%\archindex.ini, section1, archindex
SoundBeep

return



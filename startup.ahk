; Project - Dota Scripts Loader
; File  - startup.ahk
; Description - Launch main script-code.
; Credits:
; BASS_DEVWARE
; vk.com/bass_devware
; github.com/MirchikAhtung

oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWhr.Open("GET", "https://raw.githubusercontent.com/MirchikAhtung/dotasl/master/source.ahk", false)
oWhr.Send()
source := oWhr.ResponseText
IfExist, %a_temp%\dotasl.ahk
	FileDelete, %a_temp%\dotasl.ahk
FileAppend, %source%, %a_temp%\dotasl.ahk
Run, % A_AhkPath " " a_temp "\dotasl.ahk",, UseErrorLevel, pid
sleep 100
if errorlevel
{
	MsgBox, 8208, Launch script, An error occurred while starting the script.`nERR0R #501
	return
}
FileDelete, %a_temp%\dotasl.ahk
ExitApp

; Project - Dota Scripts Loader
; File  - installer.ahk
; Description - Install all script files.
; Credits:
; BASS_DEVWARE
; vk.com/bass_devware
; github.com/MirchikAhtung

if A_AhkPath =
{
	MsgBox, 8244, Dota Scripts Loader | Installer, AutoHotkey.exe not found.`nPlease`, install AutoHotkey & try again.`n---`nYes - Open autohotkey.com`nNo - Close
	IfMsgBox, Yes
		run, https://www.autohotkey.com/
	ExitApp
}
Gui, Add, Progress, x12 y80 w500 h20 , 0
Gui, Add, Text, x12 y60 w300 h20 , Default dir %A_MyDocuments%\DotaSL
Gui, Font, S8 CDefault Bold, Verdana
Gui, Font, S10 CDefault Bold, Verdana
Gui, Font, S11 Cgreen Bold, Verdana
Gui, Add, Button, x442 y55 w70 h20 gstart, Start
Gui, Add, Button, x372 y55 w70 h20 gcancel, Cancel
Gui, Add, Button, x302 y55 w70 h20 gdir, Dir
Gui, Add, Text, x115 y20 w500 h20 , Установка необходимых файлов.
Gui, Add, GroupBox, x12 y0 w505 h50 ,
Gui, Show, w529 h109, Dota Scripts Loader | Installer
IfNotExist, %A_MyDocuments%\DotaSL
	FileCreateDir, %A_MyDocuments%\DotaSL
SetWorkingDir, %A_MyDocuments%\DotaSL
return

dir:
gui, +disabled
FileSelectFolder, dir, , 4
if dir !=
{
	FileDelete, config.txt
	sleep 10
	FileAppend,  %dir%, config.txt
	TrayTip, Selected DIR, %dir%, 3
}
gui, -disabled
return

start:
gui, +disabled
if dir !=
	SetWorkingDir, %dir%
oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWhr.Open("GET", "https://raw.githubusercontent.com/MirchikAhtung/dotasl/master/compiler.bat", false)
oWhr.Send()
html := oWhr.ResponseText
IfExist, compiler.bat
	FileDelete, compiler.bat
ahkfolder := A_AhkPath
StringReplace, ahkfolder, ahkfolder, AutoHotkey.exe, Compiler, All
StringReplace, html, html, &, %ahkfolder%\, All
FileAppend,  %html%, compiler.bat
guicontrol,, msctls_progress321, 20
guicontrol,, static1, github / compiler.bat

sleep 100
IfExist, uninstall.exe
	FileDelete, uninstall.exe
oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWhr.Open("GET", "https://raw.githubusercontent.com/MirchikAhtung/dotasl/master/uninstall.ahk", false)
oWhr.Send()
html := oWhr.ResponseText
IfExist, uninstall.ahk
	FileDelete, uninstall.ahk
FileAppend,  %html%, uninstall.ahk
guicontrol,, msctls_progress321, 40
guicontrol,, static1, github / uninstall.ahk

sleep 100

IfExist, startup.exe
	FileDelete, startup.exe
oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWhr.Open("GET", "https://raw.githubusercontent.com/MirchikAhtung/dotasl/master/startup.ahk", false)
oWhr.Send()
html := oWhr.ResponseText
IfExist, startup.ahk
	FileDelete, startup.ahk
FileAppend,  %html%, startup.ahk
guicontrol,, msctls_progress321, 60
guicontrol,, static1, github / startup.ahk
sleep 100
run, compiler.bat,, UseErrorLevel
if errorlevel
	MsgBox ошибка при запуске
sleep 2000 ; Чтобы файлы успели появиться.

oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWhr.Open("GET", "https://raw.githubusercontent.com/MirchikAhtung/dotasl/master/README.md", false)
oWhr.Send()
html := oWhr.ResponseText
IfExist, readme.txt
	FileDelete, readme.txt
FileAppend,  %html%, readme.txt
guicontrol,, msctls_progress321, 80
FileDelete, compiler.bat
FileDelete, uninstall.ahk
FileDelete, startup.ahk
;~ В будущих обновлениях добавлю возможность выбора: сохранят исходники для установки без сети или так же удалять.
guicontrol,, msctls_progress321, 100
guicontrol,, static1, completion...

IfNotExist, config.txt
	FileAppend,  , config.txt

MsgBox, 4160, Dota Scripts Loader | Installer, Процесс установки завершен.
run, Startup.exe,, UseErrorLevel
if errorlevel
	MsgBox ошибка при запуске Startup.exe

cancel:
ExitApp

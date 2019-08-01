; Project - Dota Scripts Loader
; File  - startup.ahk
; Description - Launch main script-code.
; Credits:
; BASS_DEVWARE
; vk.com/bass_devware
; github.com/MirchikAhtung

IfExist, %A_MyDocuments%\DotaSL\config.txt
	FileReadLine, dir2remove, %A_MyDocuments%\DotaSL\config.txt, 1

Gui, Add, Progress, x12 y80 w500 h20 , 0
Gui, Add, Text, x12 y60 w300 h20 , Uninstall..
Gui, Font, S8 CDefault Bold, Verdana
Gui, Font, S10 CDefault Bold, Verdana
Gui, Font, S11 Cgreen Bold, Verdana
Gui, Add, Button, x442 y55 w70 h20 gstart, Start
Gui, Add, Button, x372 y55 w70 h20 gcancel, Cancel
Gui, Add, Text, x175 y20 w500 h20 , Uninstall script files.
Gui, Add, GroupBox, x12 y0 w505 h50 ,
Gui, Show, w529 h109, Dota Scripts Loader | UnInstall
return

start:
if dir2remove =
	dir2remove = %A_WorkingDir%
IfExist, %dir2remove%\Startup.exe
{
	FileDelete, %dir2remove%\Startup.exe
	guicontrol,, msctls_progress321, 20
	guicontrol,, static1, remove / Startup.exe
}
sleep 100
IfExist, %dir2remove%\readme.txt
{
	FileDelete, %dir2remove%\readme.txt
	guicontrol,, msctls_progress321, 40
	guicontrol,, static1, remove / readme.txt
}
sleep 100
IfExist, %dir2remove%\installer.exe
{
	FileDelete, %dir2remove%\installer.exe
	guicontrol,, msctls_progress321, 40
	guicontrol,, static1, remove / readme.txt
}
sleep 100
IfExist, %dir2remove%\config.txt
{
	FileDelete, %dir2remove%\config.txt
	guicontrol,, msctls_progress321, 80
	guicontrol,, static1, remove / config.txt
}
sleep 100
IfExist, %A_Desktop%\Startup.exe
{
	FileDelete, %A_Desktop%\Startup.exe
	guicontrol,, msctls_progress321, 60
	guicontrol,, static1, remove / Startup.exe
}
sleep 100
;~ IfExist, %A_MyDocuments%\DotaSL\config.txt
;~ {
	;~ FileDelete, %A_MyDocuments%\DotaSL\config.txt
	;~ guicontrol,, msctls_progress321, 80
	;~ guicontrol,, static1, remove / config.txt
;~ }
;~ sleep 100
;~ IfExist, %A_MyDocuments%\DotaSL\logo.png
;~ {
	;~ FileDelete, %A_MyDocuments%\DotaSL\logo.png
	;~ guicontrol,, msctls_progress321, 90
	;~ guicontrol,, static1, remove / logo.png
	;~ Загрузка файла происходит в source.exe
;~ }
;~ sleep 100
IfExist, %A_MyDocuments%\DotaSL
{
	FileRemoveDir, %A_MyDocuments%\DotaSL, 1
	guicontrol,, msctls_progress321, 100
	guicontrol,, static1, remove / config.txt
}
MsgBox, 4160, Dota Scripts Loader | Installer, Процесс деинсталляции завершен.
IfMsgBox, OK
	run, https://github.com/MirchikAhtung/dotasl/tree/master

cancel:
ExitApp

global currentpage := 1 ; Текущая страница.
lastupdate := "31.07.2019"
global c ; Количество найденных скриптов на сервере (сюда входят и Not Release'd).

IfNotExist, %A_MyDocuments%\DotaSL
	FileCreateDir, %A_MyDocuments%\DotaSL
SetWorkingDir, %A_MyDocuments%\DotaSL
IfNotExist, %A_MyDocuments%\DotaSL\logo.png
	URLDownloadToFile, https://github.com/MirchikAhtung/dotasl/raw/master/Images/logo.png, logo.png
#NoTrayIcon
;~ ///////////////
;~ Gui
;~ ///////////////

Gui, mainmenu:Add, GroupBox, x472 y10 w460 h510 ,
Gui, mainmenu:Add, Picture, x22 y30 w430 h290 , logo.png
Gui, mainmenu:Add, GroupBox, x12 y340 w450 h180 , Info
Gui, mainmenu:Add, Text, x22 y358 w430 h145 , Dota Scripts Loader - загрузчик скриптов для Доты 2.`nИспользует скрипты формата .ahk [AutoHotkey]`nЗагрузка происходит из репозитория GitHub'a (ссылка внизу).`nДля работы необходимо установить среду разработки AutoHotkey.`nВозможность загрузки пользовательских скриптов ещё не реализована.`nСписок доступных скриптов ограничен списком на GitHub.`nЕсли вы имеете желание внести свой вклад в проект - создавайте интересные и качественные скрипты.`nОтправляйте их нам и мы обязательно их добавим, сохранив ваше авторство.`n					`nРазработчик: bass_devware || Miroslav Bass
Gui, mainmenu:Font, s10 cblue
GuiControl, mainmenu:Font, static3
Gui, mainmenu:Add, Text, x302 y486 w50 h18 ggithub, GitHub
Gui, mainmenu:Add, Text, x252 y486 w50 h18 gvk, vk.com
Gui, mainmenu:Font, s10 cgray
Gui, mainmenu:Add, Text, x385 y486 w70 h18, [%lastupdate%]
Gui, mainmenu:Font, s9 cblack
Gui, mainmenu:Add, GroupBox, x482 y30 w440 h54 , Slot one
Gui, mainmenu:Add, GroupBox, x482 y90 w440 h54 , Second slot
Gui, mainmenu:Add, GroupBox, x482 y150 w440 h54 , Third slot
Gui, mainmenu:Add, GroupBox, x482 y210 w440 h54 , Fouth slot
Gui, mainmenu:Add, GroupBox, x482 y270 w440 h54 , Slot five
Gui, mainmenu:Add, GroupBox, x482 y330 w440 h54 , Sixth slot
Gui, mainmenu:Add, GroupBox, x482 y390 w440 h54 , Seventh slot
Gui, mainmenu:Add, GroupBox, x482 y450 w440 h54 , Eighth slot

;~ GITHUB DOWNLOAD
Gui, loadscript:Add, GroupBox, x12 y10 w530 h120 , Slot
Gui, loadscript:Add, GroupBox, x12 y140 w530 h120 , Slot
Gui, loadscript:Add, GroupBox, x12 y270 w530 h120 , Slot
Gui, loadscript:Add, Button, x452 y400 w90 h20 vnext gnext +disabled, Next page
Gui, loadscript:Add, Text, x22 y60 w440 h60 vdescription1, Description 1
Gui, loadscript:Add, Text, x22 y30 w510 h20 vname1, Script Name
Gui, loadscript:Add, Text, x22 y160 w510 h20 vname2, Script Name
Gui, loadscript:Add, Button, x463 y111 w78 h17 vdownload1 gdownload +disabled, Download
Gui, loadscript:Add, Button, x463 y92 w78 h19 vpage1 gpage +disabled, Page
Gui, loadscript:Add, Text, x22 y190 w440 h60 vdescription2, Script description
Gui, loadscript:Add, Text, x22 y320 w440 h60 vdescription3, Script description
Gui, loadscript:Add, Text, x92 y403 w40 h14 vpagenumber, Page: 1
Gui, loadscript:Add, Text, x22 y290 w510 h20 vname3, Script Name
Gui, loadscript:Add, Button, x463 y222 w78 h19 vpage2 gpage +disabled, Page
Gui, loadscript:Add, Button, x463 y242 w78 h17 vdownload2 gdownload +disabled, Download
Gui, loadscript:Add, Button, x463 y352 w78 h19 vpage3 gpage +disabled, Page
Gui, loadscript:Add, Button, x463 y372 w78 h17 vdownload3 gdownload +disabled, Download
Gui, loadscript:Add, GroupBox, x462 y85 w80 h45 ,
Gui, loadscript:Add, GroupBox, x462 y215 w80 h45 ,
Gui, loadscript:Add, GroupBox, x462 y345 w80 h45 ,
Gui, loadscript:Add, Button, x12 y400 w70 h20 gcancel, Cancel
;~ В отличии от остального интерфейса окон, здесь присутствуют переменные V. В ближайших планах убрать этот недочёт.
Gui, loadscript:Show, w557 h432 hide, [DOTA SL] Download Script
;~ GITHUB DOWNLOAD

Gui, mainmenu:Add, Edit, x492 y50 w190 h20 +Hidden +Disabled, Edit
Gui, mainmenu:Add, Button, x692 y50 w70 h20 +Hidden glaunch, Launch
Gui, mainmenu:Add, Button, x762 y50 w70 h20 +Hidden +Disabled gpid, PID
Gui, mainmenu:Add, Button, x842 y50 w70 h20 +Hidden  gsettings, Settings

Gui, mainmenu:Add, Edit, x492 y110 w190 h20 +Hidden +Disabled, Edit2
Gui, mainmenu:Add, Button, x692 y110 w70 h20 +Hidden glaunch, Launch 2
Gui, mainmenu:Add, Button, x762 y110 w70 h20 +Hidden +Disabled gpid, PID 2
Gui, mainmenu:Add, Button, x842 y110 w70 h20 +Hidden  gsettings, Settings 2

Gui, mainmenu:Add, Edit, x492 y170 w190 h20 +Hidden +Disabled, Edit3
Gui, mainmenu:Add, Button, x692 y170 w70 h20 +Hidden glaunch, Launch 3
Gui, mainmenu:Add, Button, x762 y170 w70 h20 +Hidden +Disabled gpid, PID 3
Gui, mainmenu:Add, Button, x842 y170 w70 h20 +Hidden  gsettings, Settings 3

Gui, mainmenu:Add, Edit, x492 y230 w190 h20 +Hidden +Disabled, Edit4
Gui, mainmenu:Add, Button, x692 y230 w70 h20 +Hidden glaunch, Launch 4
Gui, mainmenu:Add, Button, x762 y230 w70 h20 +Hidden +Disabled gpid, PID 4
Gui, mainmenu:Add, Button, x842 y230 w70 h20 +Hidden  gsettings, Settings 4

Gui, mainmenu:Add, Edit, x492 y290 w190 h20 +Hidden +Disabled, Edit5
Gui, mainmenu:Add, Button, x692 y290 w70 h20 +Hidden glaunch, Launch 5
Gui, mainmenu:Add, Button, x762 y290 w70 h20 +Hidden +Disabled gpid, PID 5
Gui, mainmenu:Add, Button, x842 y290 w70 h20 +Hidden  gsettings, Settings 5

Gui, mainmenu:Add, Edit, x492 y350 w190 h20 +Hidden +Disabled, Edit6
Gui, mainmenu:Add, Button, x692 y350 w70 h20 +Hidden glaunch, Launch 6
Gui, mainmenu:Add, Button, x762 y350 w70 h20 +Hidden +Disabled gpid, PID 6
Gui, mainmenu:Add, Button, x842 y350 w70 h20 +Hidden  gsettings, Settings 6

Gui, mainmenu:Add, Edit, x492 y410 w190 h20 +Hidden +Disabled, Edit7
Gui, mainmenu:Add, Button, x692 y410 w70 h20 +Hidden glaunch, Launch 7
Gui, mainmenu:Add, Button, x762 y410 w70 h20 +Hidden +Disabled gpid, PID 7
Gui, mainmenu:Add, Button, x842 y410 w70 h20 +Hidden  gsettings, Settings 7

Gui, mainmenu:Add, Edit, x492 y470 w190 h20 +Hidden +Disabled, Edit8
Gui, mainmenu:Add, Button, x692 y470 w70 h20 +Hidden glaunch, Launch 8
Gui, mainmenu:Add, Button, x762 y470 w70 h20 +Hidden +Disabled gpid, PID 8
Gui, mainmenu:Add, Button, x842 y470 w70 h20 +Hidden  gsettings, Settings 8

Gui, mainmenu:Add, Button, x522 y50 w170 h20 +Disabled, Load from PC
Gui, mainmenu:Add, Button, x702 y50 w170 h20 gsearch, Download from server

Gui, mainmenu:Add, Button, x522 y110 w170 h20 +Disabled, Load from PC
Gui, mainmenu:Add, Button, x702 y110 w170 h20 gsearch, Download from server

Gui, mainmenu:Add, Button, x522 y170 w170 h20 +Disabled, Load from PC
Gui, mainmenu:Add, Button, x702 y170 w170 h20 gsearch, Download from server

Gui, mainmenu:Add, Button, x522 y230 w170 h20 +Disabled, Load from PC
Gui, mainmenu:Add, Button, x702 y230 w170 h20 gsearch, Download from server

Gui, mainmenu:Add, Button, x522 y290 w170 h20 +Disabled, Load from PC
Gui, mainmenu:Add, Button, x702 y290 w170 h20 gsearch, Download from server

Gui, mainmenu:Add, Button, x522 y350 w170 h20 +Disabled, Load from PC
Gui, mainmenu:Add, Button, x702 y350 w170 h20 gsearch, Download from server

Gui, mainmenu:Add, Button, x522 y410 w170 h20 +Disabled, Load from PC
Gui, mainmenu:Add, Button, x702 y410 w170 h20 gsearch, Download from server

Gui, mainmenu:Add, Button, x522 y470 w170 h20 +Disabled, Load from PC
Gui, mainmenu:Add, Button, x702 y470 w170 h20 gsearch, Download from server

Gui, mainmenu:Add, GroupBox, x12 y10 w450 h320 ,
Gui, mainmenu:Show, w942 h534, [DOTA SL] Menu

;~ SCRIPT SETTINGS
Gui, settings:Add, CheckBox, x12 y10 w110 h20 vcheckbutton gcheckbutton, Use settings?
Gui, settings:Add, GroupBox, x2 y0 w330 h170 ,
Gui, settings:Add, GroupBox, x2 y0 w330 h40 ,
Gui, settings:Add, Edit, x12 y50 w220 h110 vedit +disabled,
Gui, settings:Add, Button, x242 y140 w80 h20 gsave +disabled, Save
Gui, settings:Add, Button, x242 y120 w80 h20 gcancel2 , Cancel
Gui, settings:Show, w335 h173 hide, [DOTA SL] Settings
;~ SCRIPT SETTINGS

;~ ///////////////
;~ Gui
;~ ///////////////

oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWhr.Open("GET", "https://raw.githubusercontent.com/MirchikAhtung/dotasl/master/changelog.txt", false)
oWhr.Send()
changelog := oWhr.ResponseText
loop, parse, changelog, `n
{
	if regexmatch(A_LoopField, "That's all\.")
		break
	allchangelog := A_LoopField . "`n" . allchangelog
	if a_index > 100
		break
}
MsgBox, 8256, [DOTA SL] Last changes, %allchangelog%
return



search:
ControlGetFocus, buttondownload
GuiControl, loadscript:Enable, button14
oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWhr.Open("GET", "https://raw.githubusercontent.com/MirchikAhtung/dotasl/master/avaliblescripts.txt", false)
oWhr.Send()
avaliblescripts := oWhr.ResponseText
;~ Загружаем информацию о доступных скриптах.
c =
page =
page++
;~ Сбрасываем счётчик ранее загруженных скриптов
loop, parse, avaliblescripts, `n
{
	if regexmatch(A_LoopField, "\+\+\+ ") ; Находим доступный скрипт
	{
		c++
		if c > 3 ; Если доступных скриптов более 3-х, мы переносим все последующие на следующую страницу, ибо на одной странице может отображатся не более 3-х скриптов.
			page++
		NameNumber%c% := RegExReplace(A_LoopField, "\+\+\+ ", "")  ; Сохраняем название скрипта в его номерном слоте.
	}
	if regexmatch(A_LoopField, "### ")
		DescriptionNumber%c% := RegExReplace(A_LoopField, "### ", "")  ; Сохраняем описание скрипта в его номерном слоте.
	if regexmatch(A_LoopField, "\$\$\$ ")
		LinkNumber%c% := RegExReplace(A_LoopField, "\$\$\$ ", "")  ; Сохраняем ссылку на скрипт в его номерном слоте.
	if regexmatch(A_LoopField, "Not Release")
		releasestatus%c% := 0
}
;~ Обрабатываем полученную информацию

if page > 1
	GuiControl, loadscript:enable, next
;~ Если страниц более одной - разблокируем кнопку для перехода между ними.
ApplyChanges()
gui, mainmenu:hide
gui, loadscript:Restore
;~ Отображаем пользователю полученную информацию уже в GUI.
return

page:
ControlGetFocus, pressedbutton
somerun := pressedbutton = "button6" ? "1" : pressedbutton = "button7" ? "2" : pressedbutton = "button9" ? "3" : "ERRORPAGERUN"
running := currentpage = 2 ? 3 : 0, somerun := somerun + running
run, % LinkNumber%somerun%
;~ Открываем страницу выбранного скрипта в браузере. Кнопка "Page".
return

download:
GuiControl, loadscript:disable, button14
ControlGetFocus, pressedbutton
somedownload =
somedownload := pressedbutton = "button5" ? "1" : pressedbutton = "button8" ? "2" : pressedbutton = "button10" ? "3" : "ERRORDOWNLOAD"
gui, loadscript:+disabled
if currentpage = 2
	somedownload += 3
if checkscript := (script1 = NameNumber%somedownload% ? "1" : script2 = NameNumber%somedownload% ? "1" : script3 = NameNumber%somedownload% ? "1" : script4 = NameNumber%somedownload% ? "1" : script5 = NameNumber%somedownload% ? "1" : script6 = NameNumber%somedownload% ? "1" : script7 = NameNumber%somedownload% ? "1" : script8 = NameNumber%somedownload% ? "1" : "0")
{
	;~ При загрузке нового скрипта идёт проверка - есть ли в загруженных скриптах уже скрипт с таким названием. Работает как на 1-й, так и на 2-й странице.
	;~ Найден? По нажатию на кнопку download (код в next меняем название на unload) будет предложено выгрузить скрипт.
	zdelete := sm%somedownload%
	RegExMatch(4delete%zdelete%, "(\d\d)(\d\d)(\d\d)(\d\d)(\d)Button(\d\d)", delete)
	GuiControl, mainmenu:show, button%delete1%
	GuiControl, mainmenu:show, button%delete6%
	
	GuiControl, mainmenu:hide, button%delete2%
	GuiControl, mainmenu:hide, button%delete3%
	GuiControl, mainmenu:hide, button%delete4%
	GuiControl, mainmenu:hide, edit%delete5%
	;~ Выгрузка скрипта из слота на уровне GUI. Т.к кнопки загруженного слота появляются только при загрузке скрипта с сервера, данные переменных всё равно будут переписаны. Тут их не трогал.
	script%delete5% =
	;~ Убераем название выгруженного скрипта из списка, освобождая этим место.
	GuiControl, loadscript:, %pressedbutton%, Download
	MsgBox, 8256, Download Script, The script was successfully unloaded from the slot.
	gui, loadscript:-disabled
	GuiControl, loadscript:Enable, button14
	gui, loadscript:show
	return
}
;~ В переменной scriptN находяться названия загруженных скриптов благодаря script%change5% := NameNumber%somedownload%, если название совпадает с названием скрипта который был определен циклом в search, то не даём загрузить скрипт в другой слот повторно.

SetWorkingDir, %A_MyDocuments%\DotaSL ; Дефолтная директива

IfNotExist, % NameNumber%somedownload%
	FileCreateDir, % NameNumber%somedownload%
SetWorkingDir, % NameNumber%somedownload% ; Для работы делаем папку загружаемого скрипта родительной
IfExist, % NameNumber%somedownload% . ".ahk" ; Если желаемый к скачиванию скрипт имеет дубликат в родительной папке - отображаем сообщение.
	MsgBox, 8256, Download Script, Script file already exists in the folder. The current file will be replaced with a new one.
URLDownloadToFile, % LinkNumber%somedownload%, % NameNumber%somedownload% . ".ahk"
if errorlevel ; Если во время скачивания проихзошла ошибка.
{
	MsgBox, 8208, Download Script, An error occurred while downloading the script.
}
else
{
	LoadFromPC := buttondownload = "button36" ? "button35.button11.button12.button13.edit1" : buttondownload = "button38" ? "button37.button14.button15.button16.edit2" : buttondownload = "button40" ? "button39.button17.button18.button19.edit3" : buttondownload = "button42" ? "button41.button20.button21.button22.edit4" : buttondownload = "button44" ? "button43.button23.button24.button25.edit5" : buttondownload = "button46" ? "button45.button26.button27.button28.edit6" : buttondownload = "button48" ? "button47.button29.button30.button31.edit7" : buttondownload = "button50" ? "button49.button32.button33.button34.edit8" : "ERROR"
	;~ Определяем  в какой из 8-ми слотов мы будем загружать скрипт
	RegExMatch(LoadFromPC, "button(\d\d).button(\d\d).button(\d\d).button(\d\d).edit(\d)", change)
	
	GuiControl, mainmenu:hide, button%change1%
	GuiControl, mainmenu:hide, %buttondownload%
	
	GuiControl, mainmenu:show, button%change2%
	GuiControl, mainmenu:show, button%change3%
	GuiControl, mainmenu:show, button%change4%
	GuiControl, mainmenu:show, edit%change5%
	GuiControl, mainmenu:, edit%change5%, % NameNumber%somedownload%
	gui, mainmenu:Restore
	gui, loadscript:Hide
	script%change5% := NameNumber%somedownload% ; Формат script1, script2. При успешной загрузке скрипта и его отображении сохраняем его.
	4delete%change5% := change1 . change2 . change3 . change4 . change5 . buttondownload
	sm%somedownload% := change5
	;~ Короче, это сохранение скрипта в слот, нужно это для удаления скриптов не только на 1-й, но и 2-й странице.
	SetWorkingDir, %A_MyDocuments%\DotaSL
	GuiControl, loadscript:, %pressedbutton%, Unload
}
gui, loadscript:-disabled
GuiControl, loadscript:Enable, button14
return

next:
kkk = 0
currentpage := currentpage = 1 ? 2 : 1
GuiControl, loadscript:, pagenumber, Page: %currentpage%
if currentpage = 2
	kkk += 3
loop, 3
{
	GuiControl, loadscript:Disable, download%A_Index%
	GuiControl, loadscript:Disable, page%A_Index%
	kkk += 1
	zzz := A_Index = "1" ? "button5" : A_Index = "2" ? "button8" : A_Index = "3" ? "button10" : "ERRORNEXTPAGE"
	if var := (script1 = NameNumber%kkk% ? "1" : script2 = NameNumber%kkk% ? "1" : script3 = NameNumber%kkk% ? "1" : script4 = NameNumber%kkk% ? "1" : script5 = NameNumber%kkk% ? "1" : script6 = NameNumber%kkk% ? "1" : script7 = NameNumber%kkk% ? "1" : script8 = NameNumber%kkk% ? "1" : "0")
		;~ Если в загруженных скриптах найден скрипт и названием, как и у скрипта для загрузки - меняем текст кнопки (это чисто визуально)
	GuiControl, loadscript:, %zzz%, Unload
	else
		;~ И наоборот. Не найдено - оставляем прежним текст кнопки.
	GuiControl, loadscript:, %zzz%, Download
}
ApplyChanges()
;~ Переходим на следующую страницу и отображаем в элементах GUI данные с 4 по 6 слот.
return

serverdownload:
ControlGetFocus, buttondownload
gui, mainmenu:hide
gui, loadscript:Restore
goto search
return

launch:
ControlGetFocus, buttondownload
launch := buttondownload = "button11" ? "1" : buttondownload = "button14" ? "2" : buttondownload = "button17" ? "3" : buttondownload = "button20" ? "4" : buttondownload = "button23" ? "5" : buttondownload = "button26" ? "6" : buttondownload = "button29" ? "7" : buttondownload = "button32" ? "8" : "errorlaunch"
script = % A_WorkingDir "\" script%launch% "\" script%launch% . ".ahk"
IfNotExist, % A_AppData "\DotaScriptsBuilder.ahk"
{
	oWhr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	oWhr.Open("GET", "https://raw.githubusercontent.com/MirchikAhtung/dotasb/master/DotaScriptsBuilder.ahk", false)
	oWhr.Send()
	DotaScriptsBuilder := oWhr.ResponseText
	FileAppend, %DotaScriptsBuilder%, % A_AppData "\DotaScriptsBuilder.ahk"
}
;~ Проверяем есть ли в папке "Appdata" библиотека DotaScriptsBuilder.ahk (необходима всем скриптам скачиваемым с гитхаба)

Run, % A_AhkPath " " script,, UseErrorLevel, pid
if errorlevel
{
	MsgBox, 8208, Launch script, An error occurred while starting the script.`nERROR #501
	return
}
else if pid =
{
	MsgBox, 8208, Launch script, An error occurred while executing the script.`nERROR #505
	return
}
slotcp%launch% := 9 + (launch * 3)
slotst%launch% := 10 + (launch * 3)
slotbd%launch% := buttondownload
;~ Определяем с кнопками какого слота мы будем работать + даём себе возможность в дальнейшем использовать эти переменные для определения работы над элементами слота.
GuiControl, mainmenu:Enable, % "button" slotcp%launch%
GuiControl, mainmenu:, % "button" slotcp%launch%, %pid%
GuiControl, mainmenu:Disable, %buttondownload%
GuiControl, mainmenu:Disable, % "button" slotst%launch%
;~ Работаем.
pidslot%launch% := pid
return

pid:
ControlGetFocus, buttonpid
id := buttonpid = "button12" ? "1" : buttonpid = "button15" ? "2" : buttonpid = "button18" ? "3" : buttonpid = "button21" ? "4" : buttonpid = "button24" ? "5" : buttonpid = "button27" ? "6" : buttonpid = "button30" ? "7" : buttonpid = "button33" ? "8" : "errorpid"
Process, exist, % pidslot%id%
if !errorlevel
{
	buttondownload := slotbd%id%
	GuiControl, mainmenu:Disable, % "button" slotcp%id%
	GuiControl, mainmenu:, % "button" slotcp%id%, PID
	GuiControl, mainmenu:Enable, % "button" slotst%id%
	GuiControl, mainmenu:Enable, %buttondownload%
	;~ id - показывает номер текущего слота и переменные slotcpN, slotstN и slotbdN помогают нам в манипуляциях с элементами слота.
	MsgBox, 8240, Script menu, The process of the executable script was not found.
}
else
{
	MsgBox, 8228, Script menu, Would you like to close the script process?
	IfMsgBox, Yes
	{
		Process, close, % pidslot%id%
		if errorlevel != 0
		{
			buttondownload := slotbd%id%
			GuiControl, mainmenu:Disable, % "button" slotcp%id%
			GuiControl, mainmenu:, % "button" slotcp%id%, PID
			GuiControl, mainmenu:Enable, % "button" slotst%id%
			GuiControl, mainmenu:Enable, %buttondownload%
			;~ Аналогично комментарию выше.
			MsgBox, 8256, Script menu, The process of the executable script is complete.
		}
		else
			MsgBox, 8240, Script menu, An error occurred while killing the script process.
	}
}
return

cancel:
gui, mainmenu:Restore
gui, loadscript:hide
return

settings:
ControlGetFocus, buttonpid
settingsid := buttonpid = "button13" ? "1" : buttonpid = "button16" ? "2" : buttonpid = "button19" ? "3" : buttonpid = "button22" ? "4" : buttonpid = "button25" ? "5" : buttonpid = "button28" ? "6" : buttonpid = "button31" ? "7" : buttonpid = "button34" ? "8" : "errorsettingsid"
gui, mainmenu:+disabled
gui, settings:Restore
gui, mainmenu:+disabled
return

checkbutton:
scriptname := script%settingsid%
gui, settings:submit, nohide
if checkbutton
{
	IfExist, %scriptname%\options.txt
		Loop, read, %scriptname%\options.txt
	if regexmatch(A_LoopReadLine, "^var_", change)
		StringReplace, 2write, A_LoopReadLine, var_, %2write%`n,
	;~ Если файл с настройками существует
	
	IfNotExist, %scriptname%\options.txt
	{
		Loop, read, %scriptname%\%scriptname%.ahk
		{
			if regexmatch(A_LoopReadLine, "^var_")
				StringReplace, 2write, A_LoopReadLine, var_, %2write%`n,
			if InStr(A_LoopReadLine, "return")
				break
		}
	}
	;~ Если файла с настройками нет (ищем переменные в самом скрипте)
	
	GuiControl, settings:, edit, %2write%
	GuiControl, settings:enable, edit
	GuiControl, settings:enable, button4
	GuiControl, settings:enable, button5
}
else
{
	GuiControl, settings:, edit,
	GuiControl, settings:Disable, edit
	GuiControl, settings:Disable, button4
	2write =
}
return

save:
IfExist, %scriptname%\options.txt
	FileDelete, %scriptname%\options.txt
;~ Если в папке со скриптом существует файл в настройками
gui, settings:submit, nohide
loop, parse, edit, `n
{
	StringReplace, edit, edit, %A_LoopField%, var_%A_LoopField%, All
}
FileAppend, %edit%, %scriptname%\options.txt
GuiControl, settings:Disable, edit
GuiControl, settings:, edit,
GuiControl, settings:, button1, 0
GuiControl, settings:Disable, button4
gui, settings:hide
2write =
gui, mainmenu:-disabled
return

cancel2:
GuiControl, settings:, edit,
GuiControl, settings:Disable, edit
GuiControl, settings:Disable, button4
GuiControl, settings:, button1, 0
gui, settings:hide
2write =
gui, mainmenu:-disabled
gui, mainmenu:show
return

github:
run, https://github.com/MirchikAhtung
return

vk:
run, https://vk.com/bass_devware
return

ApplyChanges()
{
	nextpage := currentpage = 2 ? 3 : 0
	;~ Определяем текущую страницу и отображаем нужные нам данные.
	loop, %c%
	{
		plusadd := nextpage + A_Index
		GuiControl, loadscript:, name%A_Index%, % NameNumber%plusadd%
		GuiControl, loadscript:, description%A_Index%, % DescriptionNumber%plusadd%
		if releasestatus%plusadd% = 0
			continue
		GuiControl, loadscript:enable, download%A_Index%
		GuiControl, loadscript:enable, page%A_Index%
	}
}

!F12::
ExitApp
!F11::
Reload

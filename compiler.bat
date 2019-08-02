@echo off
echo %time%
echo File Compilation: UnInstall.ahk ScriptUpdater.ahk LauncherDOTASL.ahk
"&Ahk2Exe.exe" /in "Uninstall.ahk"
"&Ahk2Exe.exe" /in "LauncherDOTASL.ahk"
echo Compilation complete.
timeout 1 > NUL

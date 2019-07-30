@echo off
echo %time%
echo File Compilation: UnInstall.ahk ScriptUpdater.ahk Startup.ahk
"&Ahk2Exe.exe" /in "Uninstall.ahk"
"&Ahk2Exe.exe" /in "ScriptUpdater.ahk"
"&Ahk2Exe.exe" /in "Startup.ahk"
echo Compilation complete.
timeout 1 > NUL

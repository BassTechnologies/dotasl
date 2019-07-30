@echo off
echo %time%
"&Ahk2Exe.exe" /in "Uninstall.ahk"
"&Ahk2Exe.exe" /in "ScriptUpdater.ahk"
"&Ahk2Exe.exe" /in "Startup.ahk"
timeout 5 > NUL

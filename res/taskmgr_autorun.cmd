@echo off
@chcp 1251 > nul
pause
echo Создание ярлыка в папке shell:startup... 

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Task Manager.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.WindowStyle = 7 >> %SCRIPT%
echo oLink.TargetPath = "taskmgr" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

echo OK.
timeout /t 1 /nobreak > nul
SET /A Rezult=0
exit /b
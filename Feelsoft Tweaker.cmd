:start1

@echo off
@chcp 1251 > nul
TITLE Feelsoft Tweaker v1.0.0
CLS
rem Если передан файл - перейти на метку goto copy.
if not "%~1"=="" goto copy
rem Изменяем рабочую папку на ту, из которой запущен скрипт
cd /d %~dp0
ECHO. Feelsoft Tweaker
ECHO. ====================
ECHO. 
ECHO. Выбор действия: 
ECHO.    
ECHO.    1  - Улучшения интерфейса (безопасно)
ECHO.    2  - Оптимизировать настройки безопасности
ECHO.    3  - Добавить диспетчер задач в автозагрузку
ECHO.    4  - Зарезервировано
ECHO.    h  - Помощь
ECHO. 
ECHO.    0  - Выход
ECHO. 
ECHO. !ВАЖНО! Помните, все действия вы совершаете на свой страх и риск.
ECHO.
ECHO.
set INPUT=
set /P INPUT=  Пожалуйста, введите номер необходимого пункта и нажмите ввод: %=%
if "%INPUT%"=="1" goto enhance_interface
if "%INPUT%"=="2" goto disable_security
if "%INPUT%"=="3" goto taskmgr_autorun
if "%INPUT%"=="4" goto start1
if "%INPUT%"=="h" goto help

if "%INPUT%"=="0" goto exit
goto end



:help
CLS
echo. Помощь
echo. ====================
echo. Удобная текстовая оболочка для импорта твиков реестра. 
echo. В комплекте уже идут некоторые для первичной настройки 
echo. системы после установки начисто
echo.
echo.
echo. Дополнительно: 
echo. ====================
echo. Скрипт написан в стиле старых програм MS-DOS
echo. Твики составлял: @Feelsoft
echo. https://linker.pp.ua/projects/tweaker.html
echo.
echo.
echo. Отладка: 
echo. ====================
echo. Лицензия: (не предусмотрено)
echo. Версия: 1.0.1
echo. 
echo. 

PAUSE
goto end

:enhance_interface
CLS
echo. Улучшения интерфейса
echo. =====================
echo. 
echo. 01. Смена языка по Ctrl+Shift, раскладка по Alt+Shift
echo. 02. Темная тема оформления
echo. 03. Добавить значок Компьютер на рабочий стол
echo. 04. Открывать Компьютер при запуске проводника
echo. 05. Отключить показ недавних файлов
echo. 06. Исправить региональные настройки (точка как разделитель целой и дробной части)
echo.
pause
echo Импортирую данные в реестр...
reg import ./res/enhance_interface.reg
echo. ====================
echo.      Готово!
echo. ====================
echo.
echo. Изменения должны проявиться сразу же.
echo. Если что-то не сработало попробуй перезагрузить проводник или комп
echo.
PAUSE
goto end

:disable_security
CLS
echo. Отключение безопасности
echo. ========================
echo. 
echo. 01. Отключить Defender (требуются ручные действия)
echo. 02. Отключить UAC
echo. 03. Отключить Smart Screen
echo. 04. Отключить автоматическое обновление
echo. 05. Убрать автозапуск SecurityHealth
echo. 06. Отключить Firewall
echo. 
echo. Внимание! 
echo. - Изменения будут применены только если программа запущена от имени администратора
echo. - Антивирус будет отключен только если вручную выключено галочку "отключить защиту от подделки".
echo.   Она находится тут: Параметры; Обновление и безопасность; Безопасность Windows; Защита от вирусов и угроз;
echo.   Параметры защиты от вирусов и угроз (пункт Управление настройками); Защита от подделки (пункт Откл)
ECHO.
ECHO.
set INPUT=
set /P INPUT=  Хотите открыть настройки что бы убрать эту галочку? (y/n): %=%
if "%INPUT%"=="y" echo Открываю настройки... Найди нужную галку и отключи её. & TIMEOUT /T 3 /nobreak > nul & start explorer.exe windowsdefender:
TIMEOUT /T 1 /nobreak > nul
pause
echo.
rem cls
echo Импортирую данные в реестр...
reg import ./res/disable_security.reg
echo Отключаю Firewall...
call "%cd%\res\disable_firewall.cmd"
rem netsh advfirewall set allprofiles state off
echo. ====================
echo.      Готово!
echo. ====================
echo.
echo. Если что-то прошло не по плану, придется разобраться самому.
echo. - Все исходники лежат в папке "%cd%"
echo. - Твик предназначен для Win 10, в других версиях может не работать.
echo. - В версии windows "домашняя" не работает отключение обновлений. Юзайте сторонний софт
echo.
echo.
PAUSE
goto end

:taskmgr_autorun
cls
echo. Добавить диспетчер задач в автозагрузку
echo. =======================================
echo. Скрипт создаст ярлык в папке "автозагрузка". Диспетчер будет запускаться в свернутом виде.
echo.
call ./res/taskmgr_autorun.cmd
echo Код возврата: %Rezult%
TIMEOUT /T 1 /nobreak > nul
echo. ====================
echo.      Готово!
echo. ====================
echo.
set INPUT=
set /P INPUT=  Хотите открыть папку shell:startup? (y/n): %=%
if "%INPUT%"=="y" echo Открываю... & start shell:startup
pause
goto end

:copy
cls
echo. Получен файл. Зачем?
echo. ====================
echo. %~1
echo. 
TIMEOUT /T 1 /nobreak > nul

:end
goto :start1

:exit
exit

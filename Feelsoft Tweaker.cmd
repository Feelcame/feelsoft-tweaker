:start1

@echo off
@chcp 1251 > nul
TITLE Feelsoft Tweaker v1.0.0
CLS
rem ���� ������� ���� - ������� �� ����� goto copy.
if not "%~1"=="" goto copy
rem �������� ������� ����� �� ��, �� ������� ������� ������
cd /d %~dp0
ECHO. Feelsoft Tweaker
ECHO. ====================
ECHO. 
ECHO. ����� ��������: 
ECHO.    
ECHO.    1  - ��������� ���������� (���������)
ECHO.    2  - �������������� ��������� ������������
ECHO.    3  - �������� ��������� ����� � ������������
ECHO.    4  - ���������������
ECHO.    h  - ������
ECHO. 
ECHO.    0  - �����
ECHO. 
ECHO. !�����! �������, ��� �������� �� ���������� �� ���� ����� � ����.
ECHO.
ECHO.
set INPUT=
set /P INPUT=  ����������, ������� ����� ������������ ������ � ������� ����: %=%
if "%INPUT%"=="1" goto enhance_interface
if "%INPUT%"=="2" goto disable_security
if "%INPUT%"=="3" goto taskmgr_autorun
if "%INPUT%"=="4" goto start1
if "%INPUT%"=="h" goto help

if "%INPUT%"=="0" goto exit
goto end



:help
CLS
echo. ������
echo. ====================
echo. ������� ��������� �������� ��� ������� ������ �������. 
echo. � ��������� ��� ���� ��������� ��� ��������� ��������� 
echo. ������� ����� ��������� �������
echo.
echo.
echo. �������������: 
echo. ====================
echo. ������ ������� � ����� ������ ������� MS-DOS
echo. ����� ���������: @Feelsoft
echo. https://linker.pp.ua/projects/tweaker.html
echo.
echo.
echo. �������: 
echo. ====================
echo. ��������: (�� �������������)
echo. ������: 1.0.1
echo. 
echo. 

PAUSE
goto end

:enhance_interface
CLS
echo. ��������� ����������
echo. =====================
echo. 
echo. 01. ����� ����� �� Ctrl+Shift, ��������� �� Alt+Shift
echo. 02. ������ ���� ����������
echo. 03. �������� ������ ��������� �� ������� ����
echo. 04. ��������� ��������� ��� ������� ����������
echo. 05. ��������� ����� �������� ������
echo. 06. ��������� ������������ ��������� (����� ��� ����������� ����� � ������� �����)
echo.
pause
echo ���������� ������ � ������...
reg import ./res/enhance_interface.reg
echo. ====================
echo.      ������!
echo. ====================
echo.
echo. ��������� ������ ���������� ����� ��.
echo. ���� ���-�� �� ��������� �������� ������������� ��������� ��� ����
echo.
PAUSE
goto end

:disable_security
CLS
echo. ���������� ������������
echo. ========================
echo. 
echo. 01. ��������� Defender (��������� ������ ��������)
echo. 02. ��������� UAC
echo. 03. ��������� Smart Screen
echo. 04. ��������� �������������� ����������
echo. 05. ������ ���������� SecurityHealth
echo. 06. ��������� Firewall
echo. 
echo. ��������! 
echo. - ��������� ����� ��������� ������ ���� ��������� �������� �� ����� ��������������
echo. - ��������� ����� �������� ������ ���� ������� ��������� ������� "��������� ������ �� ��������".
echo.   ��� ��������� ���: ���������; ���������� � ������������; ������������ Windows; ������ �� ������� � �����;
echo.   ��������� ������ �� ������� � ����� (����� ���������� �����������); ������ �� �������� (����� ����)
ECHO.
ECHO.
set INPUT=
set /P INPUT=  ������ ������� ��������� ��� �� ������ ��� �������? (y/n): %=%
if "%INPUT%"=="y" echo �������� ���������... ����� ������ ����� � ������� �. & TIMEOUT /T 3 /nobreak > nul & start explorer.exe windowsdefender:
TIMEOUT /T 1 /nobreak > nul
pause
echo.
rem cls
echo ���������� ������ � ������...
reg import ./res/disable_security.reg
echo �������� Firewall...
call "%cd%\res\disable_firewall.cmd"
rem netsh advfirewall set allprofiles state off
echo. ====================
echo.      ������!
echo. ====================
echo.
echo. ���� ���-�� ������ �� �� �����, �������� ����������� ������.
echo. - ��� ��������� ����� � ����� "%cd%"
echo. - ���� ������������ ��� Win 10, � ������ ������� ����� �� ��������.
echo. - � ������ windows "��������" �� �������� ���������� ����������. ������ ��������� ����
echo.
echo.
PAUSE
goto end

:taskmgr_autorun
cls
echo. �������� ��������� ����� � ������������
echo. =======================================
echo. ������ ������� ����� � ����� "������������". ��������� ����� ����������� � ��������� ����.
echo.
call ./res/taskmgr_autorun.cmd
echo ��� ��������: %Rezult%
TIMEOUT /T 1 /nobreak > nul
echo. ====================
echo.      ������!
echo. ====================
echo.
set INPUT=
set /P INPUT=  ������ ������� ����� shell:startup? (y/n): %=%
if "%INPUT%"=="y" echo ��������... & start shell:startup
pause
goto end

:copy
cls
echo. ������� ����. �����?
echo. ====================
echo. %~1
echo. 
TIMEOUT /T 1 /nobreak > nul

:end
goto :start1

:exit
exit

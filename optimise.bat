@echo off
SETLOCAL EnableDelayedExpansion

REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo [ PERFORMANCE ]
REGEDIT /s "%~dp0/reg/adjust_for_best_performance_of_background_services.reg"
echo Adjusted for best performance of Background Services.
REGEDIT /s "%~dp0/reg/adjust_visual_effects_for_best_performance.reg"
echo Adjusted Visual Effects for best performance.
REGEDIT /s "%~dp0/reg/disable_paging.reg"
echo Disabled paging.

echo.

echo [ POWER ]

echo Restoring default power configurations...
powercfg -restoredefaultschemes

for /f "tokens=2,4 delims=:()" %%G in ('powercfg /import "%~dp0/config.pow"') do (
	set high_performance_schema=%%G
)

@powercfg /changename %high_performance_schema% "Real-time Audio Configuration" "Designed for high performance with real-time audio."

echo Setting power configuration to "Real-time Audio Configuration":
@powercfg /setactive %high_performance_schema%
echo + Set minimum processor state to 100%
echo + Never sleep or hibernate
echo + Never turn off the display
echo + Set 'Turn off hard disk' to 'Never'
echo + Disable USP selective suspend

echo.

echo [ NETWORK ]

PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File ""%~dp0/ps/disable_fc_im.ps1""' -Verb RunAs}"

echo Searching for wireless network adapters:

netsh wlan show interfaces | find "There is no wireless interface on the system."

set /A count=0
for /f "tokens=2 delims=:" %%G in ('netsh wlan show interfaces') do (
    set item=%%G
    if !count!==1 netsh interface set interface "!item:~1!" disable
	if !count!==1 echo Disabled "!item:~1!".
    set /A count+=1
)

echo.

PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File ""%~dp0/ps/disable_nagling.ps1""' -Verb RunAs}"
echo Disabled Nagle's algorithm.

echo.

echo [ MISCELLANEOUS ]
REGEDIT /s "%~dp0/reg/disable_windows_sounds.reg"
echo Disabled Windows sounds.

REGEDIT /s "%~dp0/reg/disable_background_apps.reg"
echo Disabled background applications.

@sc stop "WSearch"
@sc config "WSearch" start=disabled
echo Disabled search indexing.

@reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
echo Disabled UAC.

@wmic path Win32_PNPEntity where "caption like '%bluetooth%' AND DeviceID like 'USB\\%'" call disable
echo Disabled Bluetooth adapters.

echo.
echo Congrats. Audio will now pass flawlessly.

TIMEOUT /T 3
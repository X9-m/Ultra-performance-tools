@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM ==============================================================================
REM  3AKED ULTRA PERFORMANCE TOOL - STABLE CMD EDITION
REM ==============================================================================
REM  Tool Name : 3AKED Ultra Performance Tools
REM  Version   : 2.0 Stable CMD Edition
REM  Developer : Mohammad AL-TWAIT
REM  Email     : mo.twait2005@gmail.com
REM  Phone     : +962791501269
REM  Telegram  : twait_jo
REM
REM  Purpose:
REM    Safe Windows performance helper for weak/low-end PCs.
REM
REM  Main Features:
REM    - Requests Administrator automatically.
REM    - Activates Ultimate Performance or High Performance power plan.
REM    - Reduces Windows animations and transparency.
REM    - Cleans TEMP, Windows TEMP, Recent cache, Prefetch, and DNS cache.
REM    - Closes common heavy background apps.
REM    - Temporarily stops optional heavy services: SysMain and Windows Search.
REM    - Shows system information.
REM    - Includes a small Fun Zone.
REM    - Includes Contact Info and Documentation.
REM
REM  Safety:
REM    - Does NOT disable Windows Defender.
REM    - Does NOT disable Firewall.
REM    - Does NOT delete personal files.
REM    - Does NOT permanently damage Windows services.
REM
REM  Note:
REM    This file avoids Unicode menu borders and ANSI escape codes inside CMD.
REM    The logo is printed safely through PowerShell, so CMD will not parse
REM    Unicode border characters as commands.
REM ==============================================================================

title 3AKED Ultra Performance Tools - Mohammad AL-TWAIT
color 0A
chcp 65001 >nul
mode con: cols=100 lines=35 >nul 2>&1

set "LOGO_B64=X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwrilojilojilojilojilojilojilZcgIOKWiOKWiOKWiOKWiOKWiOKVlyDilojilojilZcgIOKWiOKWiOKVl+KWiOKWiOKWiOKWiOKWiOKWiOKWiOKVl+KWiOKWiOKWiOKWiOKWiOKWiOKVlwrilZrilZDilZDilZDilZDilojilojilZfilojilojilZTilZDilZDilojilojilZfilojilojilZEg4paI4paI4pWU4pWd4paI4paI4pWU4pWQ4pWQ4pWQ4pWQ4pWd4paI4paI4pWU4pWQ4pWQ4paI4paI4pWXCiDilojilojilojilojilojilZTilZ3ilojilojilojilojilojilojilojilZHilojilojilojilojilojilZTilZ0g4paI4paI4paI4paI4paI4pWXICDilojilojilZEgIOKWiOKWiOKVkQog4pWa4pWQ4pWQ4pWQ4paI4paI4pWX4paI4paI4pWU4pWQ4pWQ4paI4paI4pWR4paI4paI4pWU4pWQ4paI4paI4pWXIOKWiOKWiOKVlOKVkOKVkOKVnSAg4paI4paI4pWRICDilojilojilZEK4paI4paI4paI4paI4paI4paI4pWU4pWd4paI4paI4pWRICDilojilojilZHilojilojilZEgIOKWiOKWiOKVl+KWiOKWiOKWiOKWiOKWiOKWiOKWiOKVl+KWiOKWiOKWiOKWiOKWiOKWiOKVlOKVnQrilZrilZDilZDilZDilZDilZDilZ0g4pWa4pWQ4pWdICDilZrilZDilZ3ilZrilZDilZ0gIOKVmuKVkOKVneKVmuKVkOKVkOKVkOKVkOKVkOKVkOKVneKVmuKVkOKVkOKVkOKVkOKVkOKVnQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f"

REM ------------------------------------------------------------------------------
REM Admin Check
REM ------------------------------------------------------------------------------
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    echo.
    echo ================================================================
    echo   3AKED requires Administrator privileges.
    echo   Requesting Administrator permission now...
    echo ================================================================
    echo.
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

goto MAIN_MENU


REM ==============================================================================
REM Header
REM ==============================================================================
:HEADER
cls
powershell -NoProfile -ExecutionPolicy Bypass -Command "$OutputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new(); $s=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($env:LOGO_B64)); Write-Host $s -ForegroundColor Green"
echo.
echo                    3AKED Ultra Performance Tools - CMD Edition
echo                         Developed by: Mohammad AL-TWAIT
echo.
exit /b


REM ==============================================================================
REM Main Menu
REM ==============================================================================
:MAIN_MENU
call :HEADER
echo ================================================================================
echo  MAIN MENU
echo ================================================================================
echo.
echo  [1] Ultra Performance Boost      Run all safe performance optimizations
echo  [2] Clean Temp and Cache         Delete temp files and Windows cache
echo  [3] Close Heavy Processes        Close browsers, launchers, chat apps
echo  [4] Visual Performance Mode      Reduce animations and visual effects
echo  [5] Power Plan Optimizer         Enable Ultimate or High Performance
echo  [6] System Information           Show PC, RAM, CPU, disk, Windows info
echo  [7] Fun Zone                     Terminal train and loading animation
echo  [8] Contact Info                 Developer contact information
echo  [9] Documentation                Tool documentation and credits
echo  [R] Restore / Restart Services   Restart optional services and Explorer
echo  [0] Exit                         Close the tool
echo.
echo ================================================================================
echo.
set /p "choice=Enter option number: "

if /i "%choice%"=="1" goto ULTRA
if /i "%choice%"=="2" goto CLEAN_ONLY
if /i "%choice%"=="3" goto CLOSE_ONLY
if /i "%choice%"=="4" goto VISUAL_ONLY
if /i "%choice%"=="5" goto POWER_ONLY
if /i "%choice%"=="6" goto SYS_INFO
if /i "%choice%"=="7" goto FUN_ZONE
if /i "%choice%"=="8" goto CONTACT
if /i "%choice%"=="9" goto DOCS
if /i "%choice%"=="R" goto RESTORE
if /i "%choice%"=="0" goto EXIT_TOOL

echo.
echo [!] Invalid option. Try again.
timeout /t 2 >nul
goto MAIN_MENU


REM ==============================================================================
REM Option 1 - Ultra Performance
REM ==============================================================================
:ULTRA
call :HEADER
echo [+] Starting 3AKED Ultra Performance Boost...
echo.
call :APPLY_POWER
call :APPLY_VISUALS
call :APPLY_CLOSE_PROCESSES
call :APPLY_STOP_SERVICES
call :APPLY_CLEAN_TEMP
call :RESTART_EXPLORER
echo.
echo [OK] Ultra Performance Boost completed.
echo [INFO] For best result, restart Windows after using the tool.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Option 2 - Cleanup
REM ==============================================================================
:CLEAN_ONLY
call :HEADER
echo [+] Cleaning temporary files and cache...
echo.
call :APPLY_CLEAN_TEMP
echo.
echo [OK] Cleanup completed.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Option 3 - Close Processes
REM ==============================================================================
:CLOSE_ONLY
call :HEADER
echo [+] Closing common heavy processes...
echo.
call :APPLY_CLOSE_PROCESSES
call :APPLY_STOP_SERVICES
echo.
echo [OK] Heavy process cleanup completed.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Option 4 - Visual Performance
REM ==============================================================================
:VISUAL_ONLY
call :HEADER
echo [+] Applying visual performance settings...
echo.
call :APPLY_VISUALS
echo.
echo [OK] Visual performance settings applied.
echo [INFO] Some settings may need sign out or restart to fully apply.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Option 5 - Power
REM ==============================================================================
:POWER_ONLY
call :HEADER
echo [+] Optimizing power plan...
echo.
call :APPLY_POWER
echo.
echo [OK] Power optimization completed.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Apply Power
REM ==============================================================================
:APPLY_POWER
echo [*] Power Plan Optimizer
echo     Trying Ultimate Performance...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1

if %errorlevel% neq 0 (
    echo     Ultimate Performance unavailable. Trying High Performance...
    powercfg /setactive SCHEME_MIN >nul 2>&1
    if %errorlevel% neq 0 (
        echo     [FAIL] Could not change power plan.
    ) else (
        echo     [OK] High Performance activated.
    )
) else (
    echo     [OK] Ultimate Performance activated.
)
echo.
exit /b


REM ==============================================================================
REM Apply Visuals
REM ==============================================================================
:APPLY_VISUALS
echo [*] Visual Performance Mode
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
echo     [OK] Animations and transparency reduced.
echo.
exit /b


REM ==============================================================================
REM Close Heavy Apps
REM ==============================================================================
:APPLY_CLOSE_PROCESSES
echo [*] Closing Heavy User Applications
for %%P in (
    OneDrive.exe
    msedge.exe
    chrome.exe
    firefox.exe
    opera.exe
    brave.exe
    Teams.exe
    Discord.exe
    Skype.exe
    Steam.exe
    EpicGamesLauncher.exe
    Battle.net.exe
    Telegram.exe
    WhatsApp.exe
    Zoom.exe
    YourPhone.exe
    PhoneExperienceHost.exe
    Widgets.exe
    WidgetService.exe
    XboxAppServices.exe
    GameBar.exe
    GameBarFTServer.exe
) do (
    taskkill /f /im %%P >nul 2>&1
)
echo     [OK] Common heavy processes handled.
echo.
exit /b


REM ==============================================================================
REM Stop Optional Heavy Services Temporarily
REM ==============================================================================
:APPLY_STOP_SERVICES
echo [*] Temporarily Stopping Optional Heavy Services
net stop SysMain /y >nul 2>&1
if %errorlevel% equ 0 (
    echo     [OK] SysMain stopped temporarily.
) else (
    echo     [SKIP] SysMain was not running or could not be stopped.
)

net stop WSearch /y >nul 2>&1
if %errorlevel% equ 0 (
    echo     [OK] Windows Search stopped temporarily.
) else (
    echo     [SKIP] Windows Search was not running or could not be stopped.
)
echo.
exit /b


REM ==============================================================================
REM Clean Temp and Cache
REM ==============================================================================
:APPLY_CLEAN_TEMP
echo [*] Temp and Cache Cleaner

echo     Cleaning user TEMP...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1

echo     Cleaning Windows TEMP...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%D in ("C:\Windows\Temp\*") do rd /s /q "%%D" >nul 2>&1

echo     Cleaning Recent files cache...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

echo     Cleaning Prefetch cache...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo     Flushing DNS cache...
ipconfig /flushdns >nul 2>&1

echo     [OK] Temporary/cache cleanup finished.
echo.
exit /b


REM ==============================================================================
REM Restart Explorer
REM ==============================================================================
:RESTART_EXPLORER
echo [*] Refreshing Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe >nul 2>&1
echo     [OK] Explorer restarted.
echo.
exit /b


REM ==============================================================================
REM System Information
REM ==============================================================================
:SYS_INFO
call :HEADER
echo [+] System Information
echo.
echo Computer Name: %COMPUTERNAME%
echo Username     : %USERNAME%
echo.
echo Windows Version:
ver
echo.
echo CPU:
wmic cpu get Name /value 2>nul | find "="
echo.
echo RAM:
wmic computersystem get TotalPhysicalMemory /value 2>nul | find "="
echo.
echo Disk Drives:
wmic logicaldisk get DeviceID,FreeSpace,Size,FileSystem 2>nul
echo.
echo Active Power Plan:
powercfg /getactivescheme
echo.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Fun Zone
REM ==============================================================================
:FUN_ZONE
call :HEADER
echo ================================================================================
echo  FUN ZONE
echo ================================================================================
echo.
echo  [1] 3AKED Terminal Train
echo  [2] Turbo Loading Animation
echo  [3] Hacker Style Message
echo  [0] Back
echo.
set /p "fun=Enter option number: "

if "%fun%"=="1" goto TRAIN
if "%fun%"=="2" goto LOADING
if "%fun%"=="3" goto HACKER_MSG
if "%fun%"=="0" goto MAIN_MENU
goto FUN_ZONE


:TRAIN
call :HEADER
echo 3AKED Terminal Train is moving...
echo.
for /l %%I in (1,1,8) do (
    cls
    call :HEADER
    echo.
    echo        ____      ____      ____      ____
    echo   ____/3AKED____/CMD_______/TOOLS____/EXPRESS___
    echo  O====O====O====O====O====O====O====O====O====O
    echo.
    echo        Powered by Mohammad AL-TWAIT
    ping localhost -n 2 >nul
)
call :PAUSE_BACK
goto FUN_ZONE


:LOADING
call :HEADER
echo Simulating terminal turbo mode...
echo.
set "bar="
for /l %%I in (1,1,25) do (
    set "bar=!bar!#"
    cls
    call :HEADER
    echo.
    echo Loading: !bar!
    ping localhost -n 1 >nul
)
echo.
echo Done. Your terminal energy is now 3AKED-certified.
call :PAUSE_BACK
goto FUN_ZONE


:HACKER_MSG
call :HEADER
echo [ACCESS GRANTED]
echo.
echo Initializing 3AKED shell...
echo Loading performance modules...
echo Checking weak PC mode...
echo Status: READY
echo.
echo 3AKED Tools - Fast. Clean. Powerful. Terminal Style.
call :PAUSE_BACK
goto FUN_ZONE


REM ==============================================================================
REM Contact
REM ==============================================================================
:CONTACT
call :HEADER
echo ================================================================================
echo  CONTACT INFO
echo ================================================================================
echo.
echo Developer : Mohammad AL-TWAIT
echo Email     : mo.twait2005@gmail.com
echo Phone     : +962791501269
echo Telegram  : twait_jo
echo.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Documentation
REM ==============================================================================
:DOCS
call :HEADER
echo 3AKED Tool Documentation
echo.
echo Tool      : 3AKED Ultra Performance Tools - CMD Edition
echo Developer : Mohammad AL-TWAIT
echo Version   : 2.0 Stable CMD Edition
echo.
echo What option [1] does:
echo   1. Activates Ultimate or High Performance power plan.
echo   2. Reduces animations, transparency, Aero Peek, and taskbar animations.
echo   3. Closes common heavy apps like browsers, Discord, Steam, Teams, etc.
echo   4. Temporarily stops SysMain and Windows Search.
echo   5. Cleans TEMP, Windows TEMP, Recent cache, Prefetch cache, and DNS cache.
echo   6. Restarts Windows Explorer.
echo.
echo What this tool does NOT do:
echo   - It does not disable Windows Defender.
echo   - It does not disable Firewall.
echo   - It does not delete personal documents, pictures, videos, or desktop files.
echo.
echo Restore option:
echo   Use [R] to restart SysMain, Windows Search, and Windows Explorer.
echo.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Restore
REM ==============================================================================
:RESTORE
call :HEADER
echo [+] Restore / Restart Services
echo.
echo [*] Starting SysMain...
net start SysMain >nul 2>&1
if %errorlevel% equ 0 (
    echo     [OK] SysMain started.
) else (
    echo     [SKIP] SysMain could not be started or is disabled.
)

echo [*] Starting Windows Search...
net start WSearch >nul 2>&1
if %errorlevel% equ 0 (
    echo     [OK] Windows Search started.
) else (
    echo     [SKIP] Windows Search could not be started or is disabled.
)

call :RESTART_EXPLORER
echo.
call :PAUSE_BACK
goto MAIN_MENU


REM ==============================================================================
REM Exit
REM ==============================================================================
:EXIT_TOOL
call :HEADER
echo Thank you for using 3AKED Tools.
echo Developed by Mohammad AL-TWAIT
echo.
timeout /t 2 >nul
exit /b


REM ==============================================================================
REM Helper
REM ==============================================================================
:PAUSE_BACK
echo.
echo Press any key to return...
pause >nul
exit /b

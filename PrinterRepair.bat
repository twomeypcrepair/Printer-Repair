@echo off
::############################################################
::#                                                          #
::#          TWOMEY PC REPAIR  ^|  Toolbox                    #
::#          Independent tech repair - Highland, AR          #
::#          https://github.com/twomeypcrepair                #
::#                                                          #
::#          No adware. No sponsor offers.                   #
::#          No bundled junk.                                #
::#                                                          #
::#          Tool: Printer Repair                            #
::#          Stops the Print Spooler, clears the print       #
::#          queue, and restarts the Print Spooler.          #
::#                                                          #
::############################################################

REM Require admin
net session >nul 2>&1
if errorlevel 1 (
    echo [!] This script must be run as Administrator.
    echo     Right-click PrinterRepair.bat and choose "Run as administrator".
    pause
    exit /b 1
)

echo [1/3] Stopping Print Spooler service...
net stop spooler
if errorlevel 1 (
    echo [!] Failed to stop the spooler. Aborting.
    pause
    exit /b 1
)

echo.
echo [2/3] Clearing print queue at %SystemRoot%\System32\spool\PRINTERS...
del /Q /F "%SystemRoot%\System32\spool\PRINTERS\*.*" >nul 2>&1
echo     Queue cleared.

echo.
echo [3/3] Starting Print Spooler service...
net start spooler
if errorlevel 1 (
    echo [!] Failed to start the spooler. Check services.msc.
    pause
    exit /b 1
)

echo.
echo [+] Printer repair complete.
pause
exit /b 0

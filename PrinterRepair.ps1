#Requires -RunAsAdministrator

#############################################################
#                                                           #
#          TWOMEY PC REPAIR  |  Toolbox                     #
#          Independent tech repair - Highland, AR           #
#          https://github.com/twomeypcrepair                #
#                                                           #
#          No adware. No sponsor offers.                    #
#          No bundled junk.                                 #
#                                                           #
#          Tool: Printer Repair                             #
#          Stops the Print Spooler, clears the print        #
#          queue, and restarts the Print Spooler.           #
#                                                           #
#############################################################

$spoolPath = Join-Path $env:SystemRoot 'System32\spool\PRINTERS'

Write-Host '[1/3] Stopping Print Spooler service...' -ForegroundColor Cyan
Stop-Service -Name Spooler -Force -ErrorAction Stop

Write-Host ''
Write-Host "[2/3] Clearing print queue at $spoolPath..." -ForegroundColor Cyan
if (Test-Path $spoolPath) {
    Get-ChildItem -Path $spoolPath -File -Force | Remove-Item -Force -ErrorAction SilentlyContinue
    Write-Host '    Queue cleared.' -ForegroundColor Green
} else {
    Write-Host '    Spool folder not found - skipping.' -ForegroundColor Yellow
}

Write-Host ''
Write-Host '[3/3] Starting Print Spooler service...' -ForegroundColor Cyan
Start-Service -Name Spooler -ErrorAction Stop

Write-Host ''
Write-Host '[+] Printer repair complete.' -ForegroundColor Green

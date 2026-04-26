# Printer Repair

Part of the [Twomey PC Repair Toolbox](https://twomeypcrepair.com/toolbox) — independent tech repair shop in Highland, Arkansas.

> No adware. No sponsor offers. No bundled junk.

## What it does

Fixes the most common Windows printing problems by performing the classic three-step spooler reset:

1. **Stops** the `Print Spooler` service.
2. **Clears** every queued print job by deleting all files in `C:\Windows\System32\spool\PRINTERS\`.
3. **Starts** the `Print Spooler` service back up.

After it runs, your printer queue is empty and the spooler is in a clean state — most "stuck job", "printer offline", and "documents won't print" issues clear up immediately.

## When to use it

- A print job is stuck and won't cancel.
- The printer shows as offline even though it's powered on and connected.
- Documents queue but never reach the printer.
- Print Spooler service keeps crashing or hanging.

## Files

| File | For |
|------|-----|
| `PrinterRepair.bat` | Classic batch — right-click → **Run as administrator**. |
| `PrinterRepair.ps1` | PowerShell — run from an elevated PowerShell window. |

Both versions do exactly the same thing — pick whichever you prefer.

## Requirements

- Windows (any modern version)
- **Administrator privileges** (the script will refuse to run otherwise)

## Running it

### Batch
Right-click `PrinterRepair.bat` → **Run as administrator**.

### PowerShell
From an elevated PowerShell window:

```powershell
powershell -ExecutionPolicy Bypass -File .\PrinterRepair.ps1
```

## Heads up

- Any print jobs currently in the queue will be **discarded**. If something important is mid-print, let it finish first.
- The script does not touch printer drivers, ports, or installed printers — only the spooler service and the queue files.

@echo off
setlocal

:: Set the path to your cursor files
set "normal_cursor=C:\Path\To\Your\Cursor\normal_cursor.ani"
set "busy_cursor=C:\Path\To\Your\Cursor\busy_cursor.ani"

:: Verify that the cursor files exist
if not exist "%normal_cursor%" (
    echo Normal cursor file not found: %normal_cursor%
    endlocal
    pause
    exit /b 1
)

if not exist "%busy_cursor%" (
    echo Busy cursor file not found: %busy_cursor%
    endlocal
    pause
    exit /b 1
)

:: Update the registry to set the normal select cursor
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Arrow /t REG_SZ /d "%normal_cursor%" /f

:: Update the registry to set the busy cursor
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Wait /t REG_SZ /d "%busy_cursor%" /f

:: Refresh the cursor settings
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo Mouse pointers updated successfully.
echo If the changes do not take effect immediately, try logging off and logging back on.
endlocal
::pause
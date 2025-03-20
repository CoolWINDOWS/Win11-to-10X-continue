@echo off
setlocal

set "segoevar=%windir%\Fonts\SegUIVar.ttf"
set "backupDir=%windir%\Fonts-BAK"
set "fontName=Segoe UI Variable"

if exist "%segoevar%" (
    if not exist "%backupDir%" (
        mkdir "%backupDir%"
    )
takeown /f "%segoevar%" /a
icacls "%segoevar%" /grant Administrators:F
move /Y "%segoevar%" "%backupDir%"
    powershell -Command "Remove-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts' -Name 'Segoe UI Variable (TrueType)' -Force"

    echo '%fontName%' backed up and uninstalled successfully.
) Else (
        echo %fontName% isn't installed on your computer.
    )

endlocal
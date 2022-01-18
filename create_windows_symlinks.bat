@echo off

:: BatchGotAdmin
:-------------------------------------
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
:-------------------------------------- 

:isadministrator
cls
echo Creating symlinks

cd "%~dp0."

SETLOCAL ENABLEDELAYEDEXPANSION
FOR /d %%d IN (.\*) DO (
	echo %%d | >nul findstr /I "20[0-4][0-9]" && (
		FOR %%f IN (%%d\*) DO (
			
			FOR /F %%i IN (%%f) DO (

				set symlink=%%i
				set "symlink=!symlink:/=\!"
				mklink /D %%f_win !symlink!
			)
		)
	)
)

echo Symlinks created
pause
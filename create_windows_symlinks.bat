@echo off

whoami /groups | findstr /b BUILTIN\Administrators | findstr /c:"Enabled group" && goto :isadministrator

cls
echo "Script must be run as admin, because mklink command is needed"
pause
exit


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
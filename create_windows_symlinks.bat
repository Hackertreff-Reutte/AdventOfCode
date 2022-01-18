@echo off

whoami /groups | findstr /b BUILTIN\Administrators | findstr /c:"Enabled group" && goto :isadministrator

cls
echo "Script must be run as admin, because mklink command is needed"
pause
exit

:isadministrator

echo Creating symlinks

FOR /d %%d IN (.\*.*) DO (
	echo %%d | >nul findstr /I "20[0-4][0-9]" && (
		FOR %%f IN (%%d\*) DO (
			for /f "delims=" %%x in (%%f) do set Symlink=%%x
			set "Symlink=%Symlink:/=\%"
			mklink /D %%f_win %Symlink%
		)
	)
)

echo Symlinks created
pause
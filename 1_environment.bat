@call set_vars.bat
@echo About to download MinGW/MSYS installer - you need to install it manually. Note:
@echo  Install to default directory: %MINGWPATH%
@echo  Unselect "... also install support for the graphical user interface."
@echo.
@pause
@start %MINGWDLPATH%
@echo.
@echo Once the mingw-get-setup has finished press a key.
@pause
%MINGWPATH%\bin\mingw-get.exe update
%MINGWPATH%\bin\mingw-get.exe install msys-base
%MINGWPATH%\bin\mingw-get install msys-wget-bin
%MINGWPATH%\bin\mingw-get install msys-unzip-bin
%MINGWPATH%\bin\mingw-get install msys-perl

%MINGWPATH%\bin\mingw-get install msys-base-bin
%MINGWPATH%\bin\mingw-get install msys-autoconf-bin
%MINGWPATH%\bin\mingw-get install msys-automake-bin
%MINGWPATH%\bin\mingw-get install msys-libtool-bin

echo.
echo done

@call 1a_env_update_download.bat
@if errorlevel 1 goto error

@call 1b_env_update_unpack.bat
@if errorlevel 1 goto error

@if not "%RUNALL%"=="1" pause

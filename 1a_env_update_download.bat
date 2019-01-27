@call set_vars.bat
@echo Downloading Updated MinGW tools 
@echo (wget, openssl, unzip)
@echo.
if not exist "%DOWNLOAD%" mkdir %DOWNLOAD%
if not exist "%LIB%" mkdir %LIB%
cd %DOWNLOAD%
start powershell -command "Invoke-WebRequest -OutFile %WGET_NAME%.zip -Uri %WGET_URL%"
start powershell -command "Invoke-WebRequest -OutFile %UNZIP_NAME%.zip -Uri %UNZIP_URL%"
start powershell -command "Invoke-WebRequest -OutFile %OPENSSL_NAME%.zip -Uri %OPENSSL_URL%"
@echo wait until powershell finishes downloading MinGW fixes
@pause
@echo.
@echo done
cd ..
@if not "%RUNALL%"=="1" pause
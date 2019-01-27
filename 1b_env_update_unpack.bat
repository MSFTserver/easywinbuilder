@call set_vars.bat
@echo Extracting...
@echo (wget, openssl, unzip)
@echo.
start powershell -command "Expand-Archive %EWBPATH%%DOWNLOAD%/%WGET_NAME%.zip %EWBPATH%%LIB%"
start powershell -command "Expand-Archive %EWBPATH%%DOWNLOAD%/%UNZIP_NAME%.zip %EWBPATH%%LIB%"
start powershell -command "Expand-Archive %EWBPATH%%DOWNLOAD%/%OPENSSL_NAME%.zip %EWBPATH%%LIB%"
@echo wait until powershell finishes working
@pause
echo.
echo done Extracting...
echo Moving extracted files to %MINGWPATH%
move %~dp0%LIB%\%WGET_NAME%64\wget.exe C:\MinGW\msys\1.0\bin
move %~dp0%LIB%\%UNZIP_NAME%64\bin\*.* C:\MinGW\msys\1.0\bin
move %~dp0%LIB%\%OPENSSL_NAME%64\c_rehash.pl C:\MinGW\msys\1.0\bin
move %~dp0%LIB%\%OPENSSL_NAME%64\bin\openssl.exe C:\MinGW\msys\1.0\bin
echo done Mving Files!
@if not "%RUNALL%"=="1" pause
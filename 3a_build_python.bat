@call set_vars.bat
@set SPACES10=          
@set SPACES20=%SPACES10%%SPACES10%
@set SPACES30=%SPACES10%%SPACES20%
@set SPACES40=%SPACES20%%SPACES20%
@set DESCRIPTION="%SPACES40%Python for %COINNAME% windows installer %SPACES40% Options Used: SimpleInstall=1 Include_launcher=0 Shortcuts=0 Include_test=0 TargetDir=%EWBPATH%%LIB%/Python-%PYTHON%"
@echo python...
mkdir "%LIB%/Python-%PYTHON%"
@cd "%DOWNLOAD%"
@python-%PYTHON%.exe /qn+ SimpleInstall=1 Include_launcher=0 Shortcuts=0 Include_test=0^
 TargetDir=%EWBPATH:/=\%%LIB:/=\%\Python-%PYTHON%^
 SimpleInstallDescription=%DESCRIPTION%
@cd ..
@pause
@echo EasyWinBuilder v1.0 for Bitcoin
@echo.
@set RUNALL=1
@echo.
@call 1_environment.bat
@if errorlevel 1 goto error
@echo.
@call __everything_but_environment_easywinbuilder.bat
@goto end

:error
@echo Fatal error! Errorlevel: %ERRORLEVEL%
@pause

:end

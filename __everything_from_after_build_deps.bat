@set RUNALL=1
@call set_vars.bat
@call 4_run_build_daemon_and_qt.bat
@if errorlevel 1 goto error
@echo.
@echo.
@goto end

:error
@echo Fatal error! Errorlevel: %errorlevel%

:end
@pause



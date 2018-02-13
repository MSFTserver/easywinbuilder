@set RUNALL=1
@call 2a_run_download.bat
@call 2c_run_unpack_coin.bat
@if errorlevel 1 goto error
@call 4_run_build_daemon_and_qt.bat
@call 5_gather_files.bat
@goto end

:error
@echo Fatal error! Errorlevel: %ERRORLEVEL%
@pause

:end

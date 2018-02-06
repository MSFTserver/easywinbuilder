@set RUNALL=1
@call 2c_run_unpack_coin.bat
@if errorlevel 1 goto error
@call __everything_from_after_unpack_easywinbuilder.bat
@goto end

:error
@echo Fatal error! Errorlevel: %ERRORLEVEL%
@pause

:end

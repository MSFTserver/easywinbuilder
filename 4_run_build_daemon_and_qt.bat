@call set_vars.bat
set PATH=%PATH%;%QTPATH%/bin;%BOOSTPATH%;%SCONSPATH%;%PYTHONPATH%;%NSISPATH%
@bash ./build_daemon_and_qt.sh
@if errorlevel 1 goto error
@call 5_gather_files.bat
@if errorlevel 1 goto error

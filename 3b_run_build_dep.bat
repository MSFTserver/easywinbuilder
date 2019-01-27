@call set_vars.bat
set PATH=%PATH%;%SCONSPATH%;%PYTHONPATH%;%QTPATH%/bin
@bash ./build_dep.sh
@if not "%RUNALL%"=="1" pause
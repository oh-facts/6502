@echo off
setlocal
cd /D "%~dp0"

set debug_build="-O0 -g"
set release_build="-O3"
set build_type=""
for %%a in (%*) do set "%%a=1"

set common_c_flags="-std=c99 -fno-exceptions -Wall -Wno-unused-function -Wno-writable-strings -Wno-comment -g"

set common_flags="-std=c++17 -msse4.1 -fno-rtti -fno-exceptions -Wall -Wno-unused-function -Wno-writable-strings -Wno-comment -g"

if "%cloc%" == "1" cloc --exclude-list-file=.clocignore .\code\
if "%clean%" == "1" rmdir /s /q "out" && del "code\meta.h"
if "%debug%" == "1" echo [debug] && set build_type=%debug_build%
if "%release%" == "1" echo [release] && set build_type=%release_build%

:: literally doesnt work if I use "if not"
if exist out (
    REM folder exists
) else (
    mkdir out && echo [created build dir]
)

if "%cpu%" == "1" echo [cpu] && clang "%common_flags%" "%build_type%" -I./code/ -o out/cpu.exe code/cpu/cpu_main.cpp

if %errorlevel% neq 0 echo platform compilation failed && exit /b

if "%run%" == "1" .\out\cpu.exe && echo [run]
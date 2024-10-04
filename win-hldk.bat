@echo off
REM =========================================
REM           HLDK Server Startup Script
REM =========================================

REM Function to handle errors
:handle_error
echo Error: %*
exit /b 1

REM Start of the script
echo =========================================
echo       Starting HLDK Server Setup
echo =========================================

REM Check if Node.js is installed
echo Checking if Node.js is installed...
where node >nul 2>nul
if %errorlevel% neq 0 (
    call :handle_error "Node.js is not installed. Please install Node.js and try again."
) else (
    echo Node.js is installed.
)

REM Check if pnpm is installed
echo Checking if pnpm is installed...
where pnpm >nul 2>nul
if %errorlevel% neq 0 (
    call :handle_error "pnpm is not installed. Please install pnpm and try again."
) else (
    echo pnpm is installed.
)

REM Set the path to the server file
set "SERVER_FILE=server\hldk-server.js"

REM Check if the server file exists
echo Checking if server file exists at "%SERVER_FILE%"...
if not exist "%SERVER_FILE%" (
    call :handle_error "Server file not found: %SERVER_FILE%"
) else (
    echo Server file found.
)

REM Install npm packages
echo Installing npm packages...
pnpm install
if %errorlevel% neq 0 (
    call :handle_error "Failed to install npm packages."
) else (
    echo npm packages installed successfully.
)

REM Start the server
echo Starting HLDK server...
call :start_server

REM Keep the script running
echo.
echo Press any key to stop the server and exit.
pause >nul
taskkill /f /fi "WindowTitle eq HLDK Server*"

goto :eof

REM Function to start the server
:start_server
setlocal

REM Set environment variables from .env file
if not exist ".env" (
    echo Warning: .env file not found. Skipping environment variable setup.
) else (
    echo Setting environment variables from .env file...
    for /f "usebackq delims=" %%x in (`type ".env" ^| findstr /v "^#"`) do set %%x
)

set "START_COMMAND=node %SERVER_FILE%"
echo Starting the server with command: %START_COMMAND%

REM Start the server in a new command window
start "HLDK Server" cmd /c "%START_COMMAND%"
if %errorlevel% neq 0 (
    call :handle_error "Failed to start the server."
) else (
    echo Server started successfully.
)

endlocal
goto :eof

@echo off
REM =========================================
REM           HLDK Server Startup Script
REM =========================================

REM Start of the script
echo =========================================
echo       Starting HLDK Server Setup
echo =========================================

REM Check if Node.js is installed
echo Checking if Node.js is installed...
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Node.js is not installed. Please install Node.js and try again.
    exit /b 1
) else (
    echo Node.js is installed.
)

REM Check if pnpm is installed
echo Checking if pnpm is installed...
where pnpm >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: pnpm is not installed. Please install pnpm and try again.
    exit /b 1
) else (
    echo pnpm is installed.
)

REM Set the path to the server file
set "SERVER_FILE=server\hldk-server.js"

REM Check if the server file exists
echo Checking if server file exists at "%SERVER_FILE%"...
if not exist "%SERVER_FILE%" (
    echo Error: Server file not found: %SERVER_FILE%
    exit /b 1
) else (
    echo Server file found.
)

REM Install npm packages
echo Installing npm packages...
call pnpm install
if %ERRORLEVEL% NEQ 0 (
    echo Error: Failed to install npm packages.
    exit /b 1
) else (
    echo npm packages installed successfully.
)

REM Set environment variables from .env file
if not exist ".env" (
    echo Warning: .env file not found. Skipping environment variable setup.
) else (
    echo Setting environment variables from .env file...
    for /F "usebackq delims=" %%x in (`type ".env" ^| findstr /v "^#"`) do (
        set %%x
    )
)

REM Start the server
set "START_COMMAND=node %SERVER_FILE%"
echo Starting the server with command: %START_COMMAND%
echo.

REM Start the server in the current command shell
%START_COMMAND%
if %ERRORLEVEL% NEQ 0 (
    echo Error: Server process exited with an error. Exiting.
    exit /b 1
)

REM The server process has been terminated
echo.
echo Server has been stopped.
exit /b 0

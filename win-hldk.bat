@echo off
rem HLDK Server Startup Script

rem Function to handle errors
:handle_error
echo Error: %1
exit /b 1

rem Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    call :handle_error "Node.js is not installed. Please install Node.js and try again."
)

rem Set the path to the server file
set "SERVER_FILE=server\hldk-server.js"

rem Check if the server file exists
if not exist "%SERVER_FILE%" (
    call :handle_error "Server file not found: %SERVER_FILE%"
)

rem Function to start the server
:start_server
setlocal
set "start_command=node %SERVER_FILE%"
echo Starting the server with command: %start_command%

rem Set environment variables from .env file
for /f "delims=" %%x in ('type .env ^| findstr /v "^#"') do set %%x

start "" /b %start_command%
set SERVER_PID=%!

rem Wait for the server to start (adjust the timeout if needed)
timeout /t 5 >nul

rem Check if the server process is still running
tasklist /fi "PID eq %SERVER_PID%" | find "%SERVER_PID%" >nul
if %errorlevel% neq 0 (
    echo Server failed to start. Exiting.
    exit /b 1
) else (
    echo Server is running...
)

endlocal
goto :eof

echo Checking npm packages...
pnpm install

rem Start the server
echo Starting HLDK server...
call :start_server

rem Keep the script running and capture any errors
wait %SERVER_PID%
if %errorlevel% neq 0 (
    echo Server process exited with an error. Exiting.
    exit /b 1
)

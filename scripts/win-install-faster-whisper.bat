@echo off

REM Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Installing Python...

    REM Define the URL for the Python installer (update the version number if needed)
    set PYTHON_URL=https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe

    REM Download the installer
    echo Downloading Python installer...
    powershell -Command "Invoke-WebRequest -Uri '%PYTHON_URL%' -OutFile 'python-installer.exe'"

    REM Run the installer silently
    echo Installing Python...
    python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

    REM Delete the installer
    del python-installer.exe

    REM Refresh the environment variables
    set "PATH=%PATH%;C:\Program Files\Python311\;C:\Program Files\Python311\Scripts\"
) else (
    echo Python is already installed.
)

REM Check if pip is installed
python -m pip --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo pip is not installed. Installing pip...

    REM Download get-pip.py
    echo Downloading get-pip.py...
    powershell -Command "Invoke-WebRequest -Uri 'https://bootstrap.pypa.io/get-pip.py' -OutFile 'get-pip.py'"

    REM Install pip
    echo Installing pip...
    python get-pip.py

    REM Delete get-pip.py
    del get-pip.py
) else (
    echo pip is already installed.
)

REM Install faster-whisper-cli
echo Installing faster-whisper-cli...
python -m pip install faster-whisper-cli

echo Installation complete!
pause

@echo off
setlocal enabledelayedexpansion

echo Verifying and installing required tools...

:: Check for Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo Node.js not found. Installing Node.js 21...
    powershell -Command "Invoke-WebRequest https://nodejs.org/dist/v21.6.1/node-v21.6.1-x64.msi -OutFile node-installer.msi"
    msiexec /i node-installer.msi /qn
    if !errorlevel! neq 0 (
        echo Failed to install Node.js. Please check your internet connection and try again.
        exit /b 1
    )
    del node-installer.msi
) else (
    for /f "tokens=1,2,3 delims=." %%a in ('node -v') do set nodeVersion=%%a
    if !nodeVersion! lss v21 (
        echo Upgrading Node.js to version 21...
        powershell -Command "Invoke-WebRequest https://nodejs.org/dist/v21.6.1/node-v21.6.1-x64.msi -OutFile node-installer.msi"
        msiexec /i node-installer.msi /qn
        if !errorlevel! neq 0 (
            echo Failed to upgrade Node.js. Please check your internet connection and try again.
            exit /b 1
        )
        del node-installer.msi
    ) else (
        echo Node.js 21 or higher is already installed.
    )
)

:: Check for pnpm
where pnpm >nul 2>nul
if %errorlevel% neq 0 (
    echo pnpm not found. Installing pnpm...
    npm install -g pnpm
    if !errorlevel! neq 0 (
        echo Failed to install pnpm. Please check your npm installation and try again.
        exit /b 1
    )
) else (
    echo pnpm is already installed.
)

echo All required tools are installed and up to date!
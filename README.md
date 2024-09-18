<p align="center">
  <img alt="Higher Level Dev Kit" src="assets/favicon.svg" width=200px/>
</p>
<h1 align="center">Higher Level Dev Kit</h1>

<p align='center'>
<b>Take command of your own set of Software Engineering Agents</b><br><br>
</p>

## Quick Start

1. Clone the repository
2. Set up your Anthropic API key in `.env`
3. Verify and install required tools (Node.js 21+ and pnpm)
4. (Optional) Set up audio transcription
5. Run the HLDK server
6. Access the web UI in your browser at http://localhost:3010
7. Import your local git repo as a workspace
8. Chat with the SE Agent to make updates to your system

For detailed instructions, see the sections below.

If you have questions then feel free to email: adam@higherleveldev.com

## What is this?

A node based server and web UI that allows you to develop at a 
higher level (in English) by offloading the actual coding to an 
LLM-powered Software Engineering Agent. 
<p></p>
Currently we support Anthropic Claude Sonnet 3.5

## Getting Started

### Set your Anthropic API Key in the server .env file

If you don't already have an API account with Anthropic then sign up at https://console.anthropic.com
<p></p>
Then go to settings (top right) --> Api Keys  --> Create Key
<p></p>
Then create a .env file in the root of this repo and add your key with something like:

    echo "ANTHROPIC_API_KEY=<your-anthropic-api-key>" > .env

#### A note about Anthropic credits and paying for Claude

You will need to add a debit or credit card and purchase some credits.
A developer working flat out most days is going to rack up something like £100 worth of tokens per month.
YMMV based on repo size etc. You can set limits in the Anthropic Console to protect yourself. 
I suggest you have your own Anthropic account and either expense it or use a company debit/credit card.
If you try to share an API key among developers then you may well run into per month usage limits or rate limits. 

### Verify and Install Required Tools

We provide scripts to automatically verify and install the required tools (Node.js 21+ and pnpm). Run the appropriate script for your operating system:

#### macOS or Linux

    ./scripts/verify-tools.sh

#### Windows

    .\scripts\verify-tools.bat

These scripts will:
1. Check if Node.js is installed. If not, it will install Node.js 21. If an older version is found, it will upgrade to Node.js 21.
2. Check if pnpm is installed. If not, it will install pnpm globally.

The scripts will provide feedback on what actions are being taken. If any errors occur during the process, the script will exit and display an error message.

Note: On macOS/Linux, you may need to run the script with sudo permissions if you encounter permission errors.

### Audio Transcription Setup

The Higher Level Dev Kit includes support for audio transcription using the faster-whisper library. To set up the audio transcription feature, follow these steps:

1. Make sure you have Python3 and pip installed on your system. If not, the installation script will attempt to install them for you.

2. Run the install-faster-whisper.sh script:

   ```
   ./scripts/install-faster-whisper.sh
   ```

   This script will:
   - Check if Python3 and pip are installed, and install them if necessary.
   - Install the faster-whisper-cli package using pip.

3. After running the script, the faster-whisper-cli should be installed and ready to use with the Higher Level Dev Kit.

Note: The installation script supports macOS and Linux. For Windows users, you may need to install Python3, pip, and faster-whisper-cli manually.

If you encounter any issues during the installation, please refer to the error messages in the console or seek assistance from the project maintainers.

## Running the HLDK Server

Once you have completed the setup steps above, you can start the HLDK server using the provided script. Follow these steps:

1. Open a terminal and navigate to the root directory of the HLDK project.

2. Run the following command:

   ```
   ./hldk.sh
   ```

   This script will:
   - Install or update npm packages using pnpm
   - Start the HLDK server

3. Wait for the server to start. You should see a message indicating that the server is running.

4. Once the server is running, you can access the web UI by opening a web browser and navigating to: http://localhost:3010

If you encounter any issues while starting the server, check the console output for error messages. Make sure you have completed all the setup steps, including setting your Anthropic API key in the `.env` file and installing the required tools.

To stop the server, you can use `Ctrl+C` in the terminal where the server is running.

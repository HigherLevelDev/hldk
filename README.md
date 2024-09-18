<p align="center">
  <img alt="Higher Level Dev Kit" src="assets/favicon.svg" width=200px/>
</p>
<h1 align="center">Higher Level Dev Kit</h1>

<p align='center'>
<b>Take command of your own set of Software Engineering Agents</b><br><br>
</p>

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
Then create a .env file under the server folder and add your key with something like:

    echo "ANTHROPIC_API_KEY=<your-anthropic-api-key>" > ./server/.env

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

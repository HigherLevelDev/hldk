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

### Install or upgrade NodeJS

You need NodeJS 20 or higher. You can run one of the scripts to install/upgrade:

#### MacOSX or Linux

    ./scripts/install-node.sh

#### Windows

    ./scripts/install-node.bat

# Higher Level Development Guide
This guide is here to help you get the most out of the Higher Level Dev Kit.

## Table of Contents

1. [Introduction to Higher Level Development](#introduction-to-higher-level-development)
2. [How the AI Software Engineering Agent works](#how-the-ai-software-engineering-agent-works)

## Introduction to Higher Level Development

Friday 21st June 2024 was the day that software engineering changed forever. 
Anthropic released Claude Sonnet 3.5 - the first LLM to be able to spit out good code that runs first time most of the time and mostly bug free.
From this date it became possible to offload the actual writing of the code to the LLM.
<p></p>
Higher Level Development is the process of developing at a higher level and in a higher level language - in this case English (or some other native human language!).
Instead of writing the code in Java, Kotlin, Typescript, Go etc we define the changes we want to make in English, and we send these instructions to an LLM-powered Software Engineering Agent
and it writes the code. It will write code that fits into the existing codebase matching the style etc. And if you ask it to update the tests it will do that as well at the same time.
<p></p>
Your experience as a software developer is still very much needed. You should think of the AI agent as a developer joining your
team but one that doesn't know the code base yet. You need to tell them what files to look at and what changes need making and then they will make them and commit the changes to git.
It will take the agent between 20 seconds and 3 minutes to make the changes (depending on the extent of the changes required obviously).

<p></p>
There are limits to what the AI Agent can do in a single request. A good rule of thumb is that if you are expecting changes to be made to more than 10 files then you should probably break it down into a set of smaller requests.
<p></p>
A "session" in the HLDK is a conversation with the AI agent. The longer the conversation, the more likely it is that the agent will start to make mistakes.
So it's good practice to start a new session for each set of changes and only continue with the conversation if you need to make some more additions
or tweaks to the changes that were just made.
<p></p>
If the agent does something you don't like or don't want then you can simple say "undo" and it will revert the last set of committed changes.
<p></p>
It's a good idea to follow your normal git practices. i.e. work on a branch, use multiple hldk sessions to work on a set of changes, then open a PR etc




## How the AI Software Engineering Agent works

To begin using HLDK, make sure you have completed the installation process as described in the main README.md file. Once installed, you can...

[More content to be added in future updates]
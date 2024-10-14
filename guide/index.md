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
<p></p>
<b>Important:</b> You do still need to review the code that the agent is writing. It will occasionally get things wrong and you are still responsible for the code you commit to main etc. The HLDK shows you the updates that were made and you can also use git diffs and PR reviews etc
<p></p>
Once you learn how to do it, there's no going back IMHO... happy prompting... :-)



## How the AI Software Engineering Agent works

The first thing we do when receiving each request is to look at the workspace files and produce a "repo tree" which
is included in the request to the Large Language Model so it can see the layout of your project. It has a read_file tool
which it can use to read in the contents of any file it wished to see. It will honour .gitignore and so won't see any ignored
files. You can additionally add a .hldkignore file if you want to ignore files which you do still need in git. This might be needed
if you have a really large repository because the repo tree could be very large and sending it up to the LLM could become expensive.
For Claude we do prompt caching so that does eleviate some of the issues as you will be mostly leveraging cache read tokens for the
repo map instead of expensive input tokens.

It's good practice to give the LLM some hints about where it should look before trying to make updates but you don't have to
remember exact names or paths etc. So something like "Update the foo widget to do X,Y and Z instead of bar" should suffice. The
agent will pull in the files it needs then figure out what changes need to be made and then it will use the update_file tool to
make a series of edits to one or more files. Each edit operation consists of 3 parameters: file path, the search block and the 
replace block - so it will open a specific file, locate the position of the search block and then overwrite the search block
contents with the replace block. In this manner it can efficiently make edits to large files without having to generate a new
version of the entire file which would end up being very expensive in output tokens.

After making edits, if you have configured a build/test command then the agent should run that and verify everything is still working.
It's up to you what tests you want to run for every update but I suggest making the test script execute quite quickly and try to
cover the most important things to verify that a) everything builds okay and b) the important basic functionality is still working.

The Agent has full command access so you can always say: "run the all-tests script" if you want to specifically test something else.

If the tests fail then the Agent will generally try to fix them (or the offending code) before re-running the tests. Once they are passing
it will then commit the changes to git (assuming the workspace is a git repo) using the command line and after generating a suitable
commit message. The Agent is non-deterministic and might occasionally forget to commit. If that happens you can simply prompt it to "commit".

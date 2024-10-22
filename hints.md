# Plugins

The plugin directory is at: server/plugins

Each plugin lives in its own directory.

The layout is as follows:

    server/plugins/
        <pluginName>
            plugin-config.json
            <agent-name>-agent.js
            <tool-name>-tool.js

The plugin-config.json tells the system how to load the js files.

For example the echo-agent plugin-config.json looks like this:

    {
        "name": "echo-agent",
        "agent": "echo-agent.js",
        "tools": {
        "current_date":"current-date-tool.js"
        }
    }

A plugin can use any number of custom tools or just reference the existing set of tools which are as follows:

* update_file – Make an edit to a file in the workspace
* read_file – Read the contents of a file in the workspace
* delete_file – Delete a file in the workspace
* command_line – Execute a command in the command line
* read_workspace_tree – Read the structure of the workspace directory
* add_workspace – Add a workspace to the current context
* fetch_web_page – Fetch a web page
* read_dependency_source_tree – Read the source tree of a dependency
* read_dependency_source_file – Read a source file from a dependency
* git_commit – Commit changes in the Git repository
* git_init – Initialize a Git repository
* current_timestamp – Get the current timestamp

If you asked to add a new Plugin and/or Tool then grab the echo-agent as an example.
Each plugin can consist of 0 or 1 agents and 0 to N tools.

Each Tool must extend langchain Tool (see the current-date-tool.js for an example)

Each Agent must implement the getSystemPrompt method and can optionally implement the getToolNames method.
See echo-agent.js for an example.

Only those 2 methods should be needed.

After adding a new plugin - tell them that they can invoke the agent with a http POST request to:

POST http://localhost:3010/agents/<agent-name>/responseContent

If they want the agent to return a JSON response then set Accepts header to application/json

# Prompt Placeholders

When implementing the `getSystemPrompt(context)` method in your agent, you can use the following placeholders in your prompt:

- `${context.sessionId}`: The current session ID
- `${context.requestId}`: The current request ID
- `${context.workspace.name}`: The name of the current workspace
- `${context.workspace.repoBaseDir}`: The base directory of the repository
- `${context.workspace.remoteRepoUrl}`: The remote URL of the repository
- `${context.workspace.buildOrTestCommand}`: The build or test command for the workspace
- `${context.repositoryTree()}`: The directory tree of the repository
- `${context.repositoryHints()}`: The contents of the hints.md file in the repository root

These placeholders will be automatically replaced with their corresponding values when the prompt is generated.
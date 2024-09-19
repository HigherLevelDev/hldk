-- Create Sessions table
CREATE TABLE sessions (
    sessionId TEXT PRIMARY KEY,
    workspaceName TEXT NOT NULL,
    status TEXT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create Items table
CREATE TABLE items (
    itemId TEXT PRIMARY KEY,
    sessionId TEXT NOT NULL,
    label TEXT NOT NULL,
    content TEXT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sessionId) REFERENCES sessions(sessionId)
);

-- Create Workspaces table
CREATE TABLE workspaces (
    name TEXT PRIMARY KEY,
    repoBaseDir TEXT NOT NULL,
    remoteRepoUrl TEXT NOT NULL,
    status TEXT NOT NULL,
    buildOrTestCommand TEXT
);

-- Create Mutations table
CREATE TABLE mutations (
    id TEXT PRIMARY KEY,
    type TEXT NOT NULL,
    filePath TEXT NOT NULL,
    description TEXT NOT NULL,
    fileContentsBefore TEXT,
    fileContentsAfter TEXT,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    sessionId TEXT NOT NULL,
    FOREIGN KEY (sessionId) REFERENCES sessions(sessionId)
);

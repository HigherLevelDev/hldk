CREATE TABLE requests (
  requestId VARCHAR(26) PRIMARY KEY,
  sessionId VARCHAR(26) NOT NULL,
  requestContent TEXT NOT NULL,
  responseContent TEXT NOT NULL,
  startedAt TIMESTAMP NOT NULL,
  endedAt TIMESTAMP NOT NULL,
  tookMillis INTEGER NOT NULL,
  inputTokens INTEGER NOT NULL,
  outputTokens INTEGER NOT NULL,
  totalTokens INTEGER NOT NULL,
  cost DECIMAL(10, 6) NOT NULL,
  FOREIGN KEY (sessionId) REFERENCES sessions(sessionId)
);
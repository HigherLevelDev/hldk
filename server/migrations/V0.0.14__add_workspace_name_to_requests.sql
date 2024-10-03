ALTER TABLE requests ADD COLUMN workspaceName VARCHAR(255);

UPDATE requests
SET workspaceName = (
  SELECT s.workspaceName
  FROM sessions s
  WHERE s.sessionId = requests.sessionId
  ORDER BY s.sessionId DESC
  LIMIT 1
);
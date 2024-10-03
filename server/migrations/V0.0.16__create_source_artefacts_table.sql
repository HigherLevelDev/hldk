CREATE TABLE source_artefacts (
  id TEXT PRIMARY KEY,
  scheme TEXT NOT NULL,
  locator TEXT NOT NULL,
  repo TEXT NULL,
  valid BOOLEAN NOT NULL,
  cacheSrcBaseDir TEXT NULL,
  error TEXT NULL,
  createdAt TIMESTAMP NOT NULL
);

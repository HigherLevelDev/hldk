ALTER TABLE requests ADD COLUMN cacheWriteTokens INTEGER DEFAULT 0;
ALTER TABLE requests ADD COLUMN cacheReadTokens INTEGER DEFAULT 0;

UPDATE requests SET cacheWriteTokens = 0, cacheReadTokens = 0 WHERE cacheWriteTokens IS NULL OR cacheReadTokens IS NULL;
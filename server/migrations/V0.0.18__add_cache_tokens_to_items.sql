ALTER TABLE items ADD COLUMN cacheWriteTokens INTEGER DEFAULT 0;
ALTER TABLE items ADD COLUMN cacheReadTokens INTEGER DEFAULT 0;

UPDATE items SET cacheWriteTokens = 0, cacheReadTokens = 0;
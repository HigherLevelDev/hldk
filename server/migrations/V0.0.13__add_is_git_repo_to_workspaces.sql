-- Add isGitRepo column to workspaces table
ALTER TABLE workspaces ADD COLUMN isGitRepo BOOLEAN NOT NULL DEFAULT 1;

-- Update existing workspaces to set isGitRepo to true
UPDATE workspaces SET isGitRepo = 1;
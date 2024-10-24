const { Tool } = require('langchain/tools');
const mammoth = require('mammoth');
const fs = require('fs').promises;
const path = require('path');

class ReadDocxText extends Tool {
  name = 'read_docx_text';
  description = 'Extracts text from a Word document in the workspace';

  constructor(workspaceDir) {
    super();
    this.workspaceDir = workspaceDir;
  }

  async _call(filePath) {
    const fullPath = path.join(this.workspaceDir, filePath);
    try {
      const buffer = await fs.readFile(fullPath);
      const result = await mammoth.extractRawText({ buffer });
      return result.value;
    } catch (error) {
      return `Error reading file: ${error.message}`;
    }
  }
}

function createTool(requestContext) {
  return new ReadDocxText(requestContext.workspace.repoBaseDir);
}

module.exports = { createTool };
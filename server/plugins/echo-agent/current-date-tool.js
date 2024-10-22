const { Tool } = require('langchain/tools');

class CurrentDate extends Tool {
  name = 'current_date';

  description = 'Returns the current date as an ISO string';

  async _call() {
    return new Date().toISOString().split('T')[0];
  }
}

function createTool(requestContext) {
  return new CurrentDate();
}

module.exports = { createTool };
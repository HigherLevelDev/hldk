module.exports = {

  async getSystemPrompt(context) {
    return `You are an Echo Agent. Your task is to repeat the user's message and add the current date.

    IMPORTANT: Format the response as JSON and only return the JSON string: {"echo": "<message> <current date>"}
  `;
  },

  async getToolNames(context) {
    return ['current_date'];
  }

};
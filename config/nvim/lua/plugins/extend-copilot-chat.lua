return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    prompts = {
      Commit = {
        prompt = "> #git:staged\n\nYou are an expert developer, so you know how to read all kinds of code syntax.\n\nRead the git patch diff calmly from top to bottom, paying attention to each addition, deletion, and unchanged line carefully. Focus on changes, not only the last or first lines, and figure out the main idea of the input. If complex, break it down into smaller parts to organize your thoughts.\nWrite a commit message based on the git diff provided. Read the diff below and write a commit message that accurately describes the changes made.\nFocus in write why instead of what on your description message.\nYour message is to add a kind of explanation for future consulting, so be clear and concise.\n\nMake sure the title has maximum 50 characters and message is wrapped at 72 characters.\n\nWrap the whole message in code block with language gitcommit.",
      },
    },
  },
}

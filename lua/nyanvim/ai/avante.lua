require('lze').load {
  {
    'avante.nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('avante').setup {
        provider = 'copilot',
        openai = { model = 'o4-mini' },
        behavior = {
          auto_suggestions = false,
          enable_claude_text_editor_tool_mode = true,
          enable_cursor_planning_mode = true,
        },
        hints = { enabled = true },
        windows = { wrap = true },
      }
    end,
  },
}

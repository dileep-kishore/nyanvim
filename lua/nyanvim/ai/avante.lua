require('lze').load {
  {
    'avante.nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('avante').setup {
        provider = 'openai',
        openai = { model = 'o3-mini' },
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

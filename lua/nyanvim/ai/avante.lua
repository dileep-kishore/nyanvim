require('lze').load {
  {
    'avante.nvim',
    event = { 'DeferredUIEnter' },
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'nui.nvim',
        'copilot',
      }
    end,
    after = function(_)
      require('avante').setup {
        provider = 'copilot',
        mode = 'agentic',
        providers = {
          copilot = { model = 'gpt-4.1' },
          openai = { model = 'gpt-4.1' },
          claude = { model = 'claude-4-sonnet' },
          ['copilot-o4-mini'] = {
            __inherited_from = 'copilot',
            model = 'o4-mini',
          },
          ['copilot-claude-sonnet-4'] = {
            __inherited_from = 'copilot',
            model = 'claude-sonnet-4',
          },
          ['copilot-gpt-4.1'] = {
            __inherited_from = 'copilot',
            model = 'gpt-4.1',
          },
          ['copilot-gemini-2.5-pro'] = {
            __inherited_from = 'copilot',
            model = 'gemini-2.5-pro',
          },
        },
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

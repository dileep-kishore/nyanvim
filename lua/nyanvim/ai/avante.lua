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
        copilot = { model = 'gpt-4.1' },
        openai = { model = 'gpt-4.1' },
        claude = { model = 'claude-4-sonnet' },
        vendors = {
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
        system_prompt = function()
          local hub = require('mcphub').get_hub_instance()
          return hub and hub:get_active_servers_prompt() or ''
        end,
        custom_tools = function()
          return {
            require('mcphub.extensions.avante').mcp_tool(),
          }
        end,
        disabled_tools = {
          'list_files', -- Built-in file operations
          'search_files',
          'read_file',
          'create_file',
          'rename_file',
          'delete_file',
          'create_dir',
          'rename_dir',
          'delete_dir',
          'bash', -- Built-in terminal access
        },
      }
    end,
  },
}

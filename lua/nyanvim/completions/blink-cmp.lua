require('lze').load {
  {
    'blink.compat',
    event = { 'DeferredUIEnter' },
  },
  {
    'blink.cmp',
    event = { 'DeferredUIEnter' },
    on_require = 'blink',
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'lazydev.nvim',
        'neopyter',
        'mini.snippets',
        'blink-copilot',
      }
    end,
    after = function(_)
      require('blink.cmp').setup {
        appearance = { nerd_font_variant = 'normal' },
        snippets = { preset = 'mini_snippets' },
        keymap = {
          preset = 'enter',
          ['<Tab>'] = {},
          ['<S-Tab>'] = {},
          ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
          ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
          ['<C-l>'] = { 'snippet_forward', 'fallback' },
          ['<C-h>'] = { 'snippet_backward', 'fallback' },
        },
        signature = {
          enabled = false,
          window = {
            show_documentation = true,
            border = {
              { '󰙎', 'WarningMsg' },
              '─',
              '╮',
              '│',
              '╯',
              '─',
              '╰',
              '│',
            },
            winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:None',
          },
        },
        cmdline = {
          enabled = true,
          keymap = { preset = 'inherit' },
          completion = {
            list = { selection = { preselect = false } },
            menu = { auto_show = true },
            ghost_text = { enabled = true },
          },
        },
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = false,
            },
          },
          menu = {
            border = {
              { '󱐋', 'WarningMsg' },
              '─',
              '╮',
              '│',
              '╯',
              '─',
              '╰',
              '│',
            },
            winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:None',
          },
          documentation = {
            auto_show = true,
            window = {
              border = {
                { '󰙎', 'WarningMsg' },
                '─',
                '╮',
                '│',
                '╯',
                '─',
                '╰',
                '│',
              },
              winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:None',
            },
          },
          ghost_text = { enabled = true },
          accept = {
            auto_brackets = {
              enabled = true,
              semantic_token_resolution = { enabled = true },
            },
          },
        },
        sources = {
          default = {
            'lazydev',
            'neopyter',
            'lsp',
            'copilot',
            'path',
            'snippets',
            'buffer',
            'avante_commands',
            'avante_mentions',
            'avante_files',
          },
          providers = {
            snippets = {
              should_show_items = function(ctx)
                return ctx.trigger.initial_kind ~= 'trigger_character'
              end,
            },
            copilot = {
              name = 'copilot',
              module = 'blink-copilot',
              score_offset = 100,
              async = true,
              opts = {
                max_completions = 1,
              },
            },
            lazydev = {
              name = 'LazyDev',
              module = 'lazydev.integrations.blink',
              score_offset = 100,
            },
            neopyter = {
              name = 'Neopyter',
              module = 'neopyter.blink',
            },
            avante_commands = {
              name = 'avante_commands',
              module = 'blink.compat.source',
            },
            avante_mentions = {
              name = 'avante_mentions',
              module = 'blink.compat.source',
            },
            avante_files = {
              name = 'avante_files',
              module = 'blink.compat.source',
            },
          },
        },
      }
    end,
  },
  {
    'friendly-snippets',
    dep_of = { 'blink.cmp' },
  },
}

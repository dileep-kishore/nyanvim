require('lze').load {
  {
    'blink.cmp',
    event = { 'DeferredUIEnter' },
    on_require = 'blink',
    after = function(_)
      require('blink.cmp').setup {
        appearance = { nerd_font_variant = 'normal' },
        keymap = {
          preset = 'enter',
          ['<Tab>'] = {},
          ['<S-Tab>'] = {},
          ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
          ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
          ['<C-k>'] = { 'snippet_forward', 'fallback_to_mappings' },
          ['<C-S-k>'] = { 'snippet_forward', 'fallback_to_mappings' },
        },
        signature = { enabled = true },
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
          list = { selection = { preselect = false } },
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
        },
        sources = {
          default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
          providers = {
            lazydev = {
              name = 'LazyDev',
              module = 'lazydev.integrations.blink',
              score_offset = 100,
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

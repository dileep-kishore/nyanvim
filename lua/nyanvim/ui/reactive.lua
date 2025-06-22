require('lze').load {
  {
    'reactive-nvim',
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'smear-cursor.nvim',
      }
    end,
    event = { 'DeferredUIEnter' },
    after = function(_)
      local palette = require('catppuccin.palettes').get_palette 'mocha'
      local darken = require('catppuccin.utils.colors').darken
      require('reactive').setup {
        load = {
          'catppuccin-mocha-cursor',
          'catppuccin-mocha-cursorline',
        },
        configs = {
          ['catppuccin-mocha-cursorline'] = {
            modes = {
              n = {
                winhl = {
                  CursorLine = { bg = 'None' },
                  CursorLineNr = { bg = 'None' },
                },
              },
              i = {
                winhl = {
                  CursorLine = { bg = darken(palette.blue, 0.3) },
                  CursorLineNr = { bg = darken(palette.blue, 0.3) },
                },
              },
            },
          },
          ['catppuccin-mocha-cursor'] = {
            modes = {
              i = { hl = { ReactiveCursor = { bg = palette.blue } } },
              n = {
                hl = {
                  ReactiveCursor = { bg = darken(palette.yellow, 0.7) },
                },
              },
            },
          },
        },
      }
    end,
  },
}

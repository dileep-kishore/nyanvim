require('lze').load {
  {
    'render-markdown.nvim',
    load = function(name)
      require('lzextras').loaders.multi {
        'nvim-treesitter',
        'mini.icons',
        name,
      }
    end,
    ft = { 'markdown', 'Avante', 'quarto' },
    after = function(_)
      require('render-markdown').setup {
        preset = 'obsidian',
        heading = {
          icons = { '󰼏 ', '󰼐 ', '󰼑 ', '󰼒 ', '󰼓 ', '󰼔 ' },
          position = 'inline',
          width = 'block',
          left_pad = 2,
          right_pad = 2,
          min_width = 40,
          border = true,
          border_virtual = true,
        },
        completions = { blink = { enabled = true } },
        indent = {
          enabled = false,
        },
        code = {
          width = 'block',
          position = 'left',
          right_pad = 5,
          border = 'thick',
          min_width = 40,
        },
        dash = { width = 100 },
        file_types = {
          'markdown',
          'Avante',
          'quarto',
        },
      }
    end,
  },
}

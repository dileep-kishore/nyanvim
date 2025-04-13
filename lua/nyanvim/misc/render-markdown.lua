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
          min_width = 80,
          border = true,
          border_virtual = true,
        },
        completions = { blink = { enabled = true } },
        indent = { enabled = false },
        code = {
          width = 'block',
          language_pad = 2,
          left_pad = 2,
          position = 'left',
          right_pad = 5,
          border = 'thick',
          min_width = 80,
        },
        bullet = {
          icons = { '󰲠 ', '󰲢 ', '󰲤 ', '󰲦 ', '󰲨 ', '󰲪 ' },
        },
        dash = { width = 100 },
        pipe_table = {
          preset = 'round',
          alignment_indicator = '┅',
        },
        checkbox = {
          checked = { scope_highlight = '@markup.strikethrough' },
        },
        file_types = { 'markdown', 'Avante', 'quarto' },
      }
    end,
  },
}

require('lze').load {
  {
    'slimline-nvim',
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'noice.nvim',
        'grapple.nvim',
      }
    end,
    after = function(_)
      local grapple_status = function()
        local status_ok, grapple = pcall(require, 'grapple')
        local grapple_status_text
        if not status_ok then
          grapple_status_text = ''
        else
          grapple_status_text = grapple.statusline {}
        end
        local output_text_lhs = '󰛢'
        local output_text_rhs =
          string.sub(grapple_status_text, 6):gsub('%s+$', '')
        local h = require 'slimline.highlights'
        local c = require('slimline').config
        local comp = h.hl_component(
          { primary = output_text_lhs, secondary = output_text_rhs },
          h.hls.components['diagnostics'],
          c.sep
        )
        return comp
      end

      require('slimline').setup {
        style = 'bg',
        components = {
          left = { 'mode', 'git' },
          center = { 'path', grapple_status },
          right = { 'recording', 'diagnostics', 'filetype_lsp', 'progress' },
        },
        spaces = { components = '─', left = '─', right = '─' },
        sep = {
          hide = { first = false, last = false },
          left = '',
          right = '',
        },
        configs = {
          mode = {
            verbose = false,
            hl = {
              normal = 'Type',
              insert = 'Function',
              pending = 'Boolean',
              visual = 'Keyword',
              command = 'String',
            },
          },
          path = {
            directory = true,
            icons = { folder = ' ', modified = '', read_only = '' },
          },
          git = {
            icons = {
              branch = '',
              added = ' ',
              modified = ' ',
              removed = ' ',
            },
          },
          diagnostics = {
            verbose = true,
            icons = {
              ERROR = ' ',
              WARN = ' ',
              HINT = ' ',
              INFO = ' ',
            },
          },
          filetype_lsp = {},
          progress = { follow = 'mode', column = false, icon = ' ' },
          recording = {
            hl = { primary = 'Error' },
            icon = '󰻂 ',
          },
        },
      }
      local colors = require('catppuccin.palettes').get_palette 'mocha'
      local set_hl_primary = function(name, fg_color, bg_color)
        vim.api.nvim_set_hl(
          0,
          name,
          { fg = fg_color, bg = bg_color, italic = true, bold = true }
        )
      end
      local set_hl_secondary = function(name, fg_color, bg_color)
        vim.api.nvim_set_hl(0, name, { fg = fg_color, bg = bg_color })
      end
      local set_hl_tertiary = function(name, fg_color, bg_color)
        vim.api.nvim_set_hl(
          0,
          name,
          { fg = fg_color, bg = bg_color, bold = true }
        )
      end
      set_hl_primary('SlimlinePathPrimary', colors.crust, colors.mauve)
      set_hl_primary('SlimlineGitPrimary', colors.crust, colors.blue)
      set_hl_tertiary('SlimlineDiagnosticsPrimary', colors.crust, colors.peach)
      set_hl_primary('SlimlineFiletype_lspPrimary', colors.crust, colors.green)
      set_hl_secondary('SlimlinePathSecondary', colors.text, colors.surface0)
      set_hl_secondary('SlimlineGitSecondary', colors.text, colors.surface0)
      set_hl_secondary(
        'SlimlineDiagnosticsSecondary',
        colors.text,
        colors.surface0
      )
      set_hl_secondary(
        'SlimlineFiletype_lspSecondary',
        colors.text,
        colors.surface0
      )
    end,
  },
}

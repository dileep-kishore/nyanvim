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
            hl = {
              primary = 'SlPathPrimary',
              secondary = 'SlPathSecondary',
            },
          },
          git = {
            icons = {
              branch = '',
              added = ' ',
              modified = ' ',
              removed = ' ',
            },
            hl = {
              primary = 'SlGitPrimary',
              secondary = 'SlGitSecondary',
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
            hl = {
              primary = 'SlDiagPrimary',
              secondary = 'SlDiagSecondary',
            },
          },
          filetype_lsp = {
            hl = {
              primary = 'SlLspPrimary',
              secondary = 'SlLspSecondary',
            },
          },
          progress = { follow = 'mode', column = false, icon = ' ' },
          recording = {
            hl = { primary = 'Error' },
            icon = '󰻂 ',
          },
        },
      }
    end,
  },
}

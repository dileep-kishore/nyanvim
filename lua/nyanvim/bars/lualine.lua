local colors = require('catppuccin.palettes').get_palette 'mocha'

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

-- Separator reference
-- separator = '',
-- separator = '',

local mode = {
  'mode',
  fmt = function(str)
    return ' [' .. str:sub(1, 3) .. ']'
  end,
  -- separator = { left = '' },
  padding = { left = 1, right = 0 },
  color = { gui = 'bold' },
}

local branch = {
  'b:gitsigns_head',
  icons_enabled = true,
  icon = '',
  separator = '',
  padding = { left = 1, right = 1 },
  color = { gui = 'bold,italic' },
}

local diff = {
  'diff',
  colored = true,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  cond = hide_in_width,
  update_in_insert = true,
  always_visible = true,
  padding = { left = 0, right = 1 },
}

local obsidian = {
  'g:obsidian',
  color = { fg = colors.green, bg = colors.base, gui = 'bold' },
  padding = { left = 0, right = 0 },
}

local grapple = {
  'grapple',
  color = { fg = colors.yellow, bg = colors.base, gui = 'bold' },
  padding = { left = 2, right = 0 },
}

local center_comp = {
  '%=',
  separator = '',
  padding = { left = 0, right = 0 },
  color = { bg = colors.base },
}

local icononly_filetype = {
  'filetype',
  colored = false,
  icon_only = true,
  separator = { left = '' },
  padding = { left = 0, right = 0 },
  color = function(section)
    return {
      fg = vim.bo.modified and colors.peach or colors.mauve,
      bg = colors.base,
    }
  end,
}

local filename = {
  'filename',
  file_status = true,
  path = 1,
  cond = hide_in_width,
  symbols = {
    modified = '',
    readonly = ' ',
    unnamed = '[No Name]',
    newfile = '[New]',
  },
  separator = '',
  padding = { left = 0, right = 0 },
  color = function(section)
    return {
      fg = vim.bo.modified and colors.peach or colors.mauve,
      bg = colors.base,
      gui = 'italic',
    }
  end,
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
  colored = true,
  update_in_insert = false,
  always_visible = false,
  padding = { left = 0, right = 0 },
  separator = { right = '' },
  color = { bg = colors.base, gui = 'bold' },
}

local lsp_status = {
  'lsp_status',
  separator = ' ',
  icon = '󱥸',
  padding = { left = 1, right = 1 },
  symbols = {
    spinner = {
      '⠋',
      '⠙',
      '⠹',
      '⠸',
      '⠼',
      '⠴',
      '⠦',
      '⠧',
      '⠇',
      '⠏',
    },
    done = '✓',
    separator = ',',
  },
  ignore_lsp = { 'copilot', 'copilot_ls' },
  color = { gui = 'bold' },
}

local filetype = {
  'filetype',
  icons_enabled = true,
  color = { gui = 'bold,italic' },
}

-- cool function for progress
local progress_custom_func = function()
  local current_line = vim.fn.line '.'
  local total_lines = vim.fn.line '$'
  local chars = {
    '__',
    '▁▁',
    '▂▂',
    '▃▃',
    '▄▄',
    '▅▅',
    '▆▆',
    '▇▇',
    '██',
  }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local progress_custom = {
  progress_custom_func,
  -- separator = { right = '' },
  padding = { left = 0, right = 1 },
}

local progress = {
  'progress',
  separator = { left = '' },
  padding = { left = 0, right = 0 },
}

local location = {
  'location',
  cond = hide_in_width,
  separator = '',
  padding = { left = 0, right = 0 },
}

local spaces = function()
  return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

require('lze').load {
  {
    'lualine.nvim',
    load = function(name)
      require('lzextras').loaders.multi {
        name,
        'noice.nvim',
        'grapple.nvim',
      }
    end,
    after = function(_)
      local custom_catppuccin = require 'lualine.themes.catppuccin-mocha'
      local modes = {
        'normal',
        'insert',
        'visual',
        'replace',
        'command',
        'inactive',
        'terminal',
      }
      for _, mode_name in ipairs(modes) do
        custom_catppuccin[mode_name].b.bg = colors.base
      end
      custom_catppuccin.normal.c.bg = colors.base
      custom_catppuccin.inactive.c.bg = colors.base
      local status_ok, lualine = pcall(require, 'lualine')
      if not status_ok then
        return
      end

      local macro = {
        require('noice').api.statusline.mode.get,
        cond = require('noice').api.statusline.mode.has,
        color = { fg = colors.green },
        separator = { right = '' },
        padding = { left = 0, right = 1 },
      }

      lualine.setup {
        options = {
          icons_enabled = true,
          globalstatus = true,
          theme = custom_catppuccin,
          component_separators = { left = ' ', right = ' ' },
          section_separators = {
            left = '',
            right = '',
            bg = colors.base,
          },
          disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = {
            branch,
            diff,
            obsidian,
          },
          lualine_c = {
            center_comp,
            icononly_filetype,
            filename,
            grapple,
          },
          lualine_x = {},
          lualine_y = {
            macro,
            diagnostics,
            -- 'encoding',
            lsp_status,
            -- filetype,
          },
          lualine_z = { progress, progress_custom },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { icononly_filetype, filename },
          lualine_x = { location },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}

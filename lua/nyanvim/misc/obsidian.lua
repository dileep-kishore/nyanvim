require('lze').load {
  {
    'obsidian.nvim',
    event = { 'DeferredUIEnter' },
    after = function(_)
      require('obsidian').setup {
        disable_frontmatter = true,
        workspaces = {
          {
            name = 'Ideaverse',
            path = '~/Documents/Ideaverse',
          },
        },
        new_notes_location = 'notes_subdir',
        notes_subdir = '+',
        preferred_link_style = 'wiki',
        note_id_func = function(title)
          return title
        end,
        daily_notes = {
          folder = 'Calendar/Notes/Daily',
          date_format = '%Y-%m-%d',
          template = 'Atlas/Utilities/Templates/Daily template.md',
        },
        templates = {
          folder = 'Atlas/Utilities/Templates',
          date_format = '%Y-%m-%d',
          time_format = '%H:%M',
          substitutions = {},
        },
        completion = {
          min_chars = 2,
          nvim_cmp = false,
          blink = true,
        },
        ui = {
          enable = false,
        },
        attachments = {
          img_folder = 'Atlas/Utilities/Attachments',
        },
      }
    end,
  },
}

local function map(mode, key, action, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, key, action, options)
end

map('n', '<leader>nn', '<cmd>ObsidianNew<cr>', { desc = 'Obsidian new note' })
map(
  'n',
  '<leader>nf',
  '<cmd>ObsidianQuickSwitch<cr>',
  { desc = 'Obsidian quick switch' }
)
map('n', '<leader>nd', '<cmd>ObsidianToday<cr>', { desc = 'Obsidian today' })
map(
  'n',
  '<leader>nt',
  '<cmd>ObsidianTemplate<cr>',
  { desc = 'Obsidian template' }
)
map('v', '<leader>nk', '<cmd>ObsidianLink<cr>', { desc = 'Obsidian link' })
map(
  'n',
  '<leader>nb',
  '<cmd>ObsidianBacklinks<cr>',
  { desc = 'Obsidian backlinks' }
)
map('n', '<leader>nl', '<cmd>ObsidianLinks<cr>', { desc = 'Obsidian links' })
map('n', '<leader>nr', '<cmd>ObsidianRename<cr>', { desc = 'Obsidian rename' })
map(
  'n',
  '<leader>no',
  '<cmd>ObsidianTOC<cr>',
  { desc = 'Obsidian table of contents' }
)

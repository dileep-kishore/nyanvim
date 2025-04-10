-- Helper function for key mappings
local function map(mode, key, action, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, key, action, options)
end

-- LSP (keymaps)
-- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
-- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
map(
  'n',
  '<leader>le',
  '<cmd>lua vim.diagnostic.open_float()<CR>',
  { desc = 'LSP diagnostics at cursor' }
)
map(
  'n',
  '<leader>la',
  '<cmd>Lspsaga code_action<cr>',
  { desc = 'Lspsaga code action' }
)
map(
  'n',
  '<leader>lp',
  '<cmd>Lspsaga peek_definition<cr>',
  { desc = 'Lspsaga peek definition' }
)
map('n', '<leader>lf', '<cmd>Lspsaga finder<cr>', { desc = 'Lspsaga finder' })
map('n', '<leader>li', '<cmd>LspInfo<cr>', { desc = 'LSP info' })
map(
  'n',
  ']d',
  '<cmd>Lspsaga diagnostic_jump_next<CR>',
  { desc = 'next Lspsaga diagnostic' }
)
map(
  'n',
  '[d',
  '<cmd>Lspsaga diagnostic_jump_prev<cr>',
  { desc = 'previous Lspsaga diagnostic' }
)
map(
  'n',
  '<leader>ll',
  '<cmd>lua vim.lsp.codelens.run()<cr>',
  { desc = 'Run code lens' }
)
map('n', '<leader>lo', '<cmd>Lspsaga outline<cr>', { desc = 'Lspsaga outline' })
map(
  'n',
  '<leader>lI',
  '<cmd>Lspsaga incoming_calls<cr>',
  { desc = 'Lspsaga incoming calls' }
)
map(
  'n',
  '<leader>lO',
  '<cmd>Lspsaga outgoing_calls<cr>',
  { desc = 'Lspsaga outgoing calls' }
)
map('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { desc = 'Lspsaga hover doc' })
map(
  'n',
  'gd',
  '<cmd>Lspsaga goto_definition<cr>',
  { desc = 'Lspsaga goto definition' }
)
-- LSP (rename)
map(
  'n',
  '<Leader>lr',
  '<cmd>Lspsaga rename<cr>',
  { desc = 'Rename symbol (buffer)' }
)
map(
  'n',
  '<Leader>lR',
  '<cmd>Lspsaga lsp_rename ++project<cr>',
  { desc = 'Rename symbol (project-wide)' }
)

-- LSP (documentation generation)
map('n', '<Leader>lg', "<cmd>lua require('neogen').generate()<CR>", {
  desc = 'Generate documentation (neogen)',
})

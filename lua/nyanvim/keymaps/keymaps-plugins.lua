-- Helper function for key mappings
local function map(mode, key, action, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, key, action, options)
end

-- LSP (keymaps)
map(
  'n',
  'gD',
  '<cmd>lua vim.lsp.buf.references()<cr>',
  { desc = '[G]oto [D]eclaration' }
)
map(
  'n',
  'gt',
  '<cmd>lua vim.lsp.buf.type_definition()<cr>',
  { desc = 'Type [D]efinition' }
)
map(
  'n',
  'gi',
  '<cmd>lua vim.lsp.buf.implementation()<cr>',
  { desc = 'Type [D]efinition' }
)
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
map('n', '<Leader>lr', ':IncRename ', { desc = 'Incremental rename' })

-- LSP (documentation generation)
map('n', '<Leader>lg', "<cmd>lua require('neogen').generate()<CR>", {
  desc = 'Generate documentation (neogen)',
})

-- ChatGPT
map('n', '<leader>cg', '<cmd>ChatGPT<cr>', { desc = 'ChatGPT' })
map(
  'n',
  '<leader>cc',
  '<cmd>CopilotChatToggle<cr>',
  { desc = 'Copilot chat toggle' }
)
map('n', '<leader>ca', '<cmd>ChatGPTActAs<cr>', { desc = 'ChatGPT act as' })
map(
  'v',
  '<leader>ce',
  '<cmd>ChatGPTEditWithInstruction<cr>',
  { desc = 'ChatGPT edit with instruction' }
)
map('n', '<leader>cr', ':ChatGPTRun ', { desc = 'ChatGPT run' })

-- DAP
map(
  'n',
  '<leader>db',
  "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
  { desc = 'DAP toggle breakpoint' }
)
map(
  'n',
  '<leader>dc',
  "<cmd>lua require'dap'.continue()<cr>",
  { desc = 'DAP continue' }
)
map(
  'n',
  '<leader>do',
  "<cmd>lua require'dapui'.toggle()<cr>",
  { desc = 'DAP toggle UI' }
)

-- sessions ([P]ossession)
map('n', '<leader>pl', '<cmd>PossessionLoad<cr>', { desc = 'Possession Load' })
map('n', '<leader>ps', '<cmd>PossessionSave<cr>', { desc = 'Possession Save' })
map(
  'n',
  '<leader>pr',
  '<cmd>PossessionRename<cr>',
  { desc = 'Possession Rename' }
)
map(
  'n',
  '<leader>pd',
  '<cmd>PossessionDelete<cr>',
  { desc = 'Possession Delete' }
)
map('n', '<leader>ps', '<cmd>PossessionList<cr>', { desc = 'Possession List' })

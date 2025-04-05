local M = {}
function M.on_attach(_, bufnr)
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    require('conform').format { async = true }
  end, { desc = 'Format current buffer using conform' })
end

function M.get_capabilities(server_name)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
  return capabilities
end
return M

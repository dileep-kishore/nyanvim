local get_capabilities = require('nyanvim.lsps.caps-on_attach').get_capabilities
local on_attach = require('nyanvim.lsps.caps-on_attach').on_attach

require('lze').load {
  {
    'nvim-lspconfig',
    on_require = { 'lspconfig' },
    lsp = function(plugin)
      require('lspconfig')[plugin.name].setup(vim.tbl_extend('force', {
        capabilities = get_capabilities(plugin.name),
        on_attach = on_attach,
      }, plugin.lsp or {}))
    end,
  },
  {
    'lazydev.nvim',
    cmd = { 'LazyDev' },
    ft = 'lua',
    after = function(_)
      require('lazydev').setup {
        library = {
          {
            words = { 'nixCats' },
            path = (nixCats.nixCatsPath or '') .. '/lua',
          },
        },
      }
    end,
  },
  {
    'lua_ls',
    lsp = {
      filetypes = { 'lua' },
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          formatters = {
            ignoreComments = true,
          },
          signatureHelp = { enabled = true },
          diagnostics = {
            globals = { 'nixCats', 'vim' },
            disable = { 'missing-fields' },
          },
          telemetry = { enabled = false },
        },
      },
    },
  },
  {
    'gopls',
    lsp = {},
  },
  {
    'basedpyright',
    lsp = {},
  },
  -- TODO: Nix
}

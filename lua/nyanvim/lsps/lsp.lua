local get_capabilities_custom = require('nyanvim.lsps.caps-on_attach').get_capabilities
local on_attach_custom = require('nyanvim.lsps.caps-on_attach').on_attach

require('lze').load {
  {
    'nvim-lspconfig',
    on_require = { 'lspconfig' },
    lsp = function(plugin)
      require('lspconfig')[plugin.name].setup(vim.tbl_extend('force', {
        capabilities = get_capabilities_custom(plugin.name),
        on_attach = on_attach_custom,
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
  { 'gopls', lsp = { filetypes = { 'go' } } },
  { 'basedpyright', lsp = { filetypes = { 'python' } } },
  {
    'nixd',
    lsp = {
      filetypes = { 'nix' },
      settings = {
        nixd = {
          nixpkgs = { expr = 'import <nixpkgs> {}' },
          options = {
            nixos = {
              expr = '(builtins.getFlake "github:dileep-kishore/nixos-hyprland").nixosConfigurations.tsuki.options',
            },
            home_manger = {
              expr = '(builtins.getFlake "github:dileep-kishore/nixos-hyprland").homeConfigurations."g8k@lap135849".options',
            },
          },
        },
      },
    },
  },
  { 'astro', lsp = {} },
  -- TODO: astro, bashls, dockerls, eslint, gopls, jsonls, harper_ls, ltex, texlab, marksman, julials, ts_ls, rust_analyzer, svelte, tailwindcss, typst_lsp, cssls, html
}

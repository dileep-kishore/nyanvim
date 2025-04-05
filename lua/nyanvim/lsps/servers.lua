local servers = {}

-- TODO:
-- bashls, dockerls, eslint, gopls, jsonls, harper_ls, ltex, texlab, marksman, julials, ts_ls, rust_analyzer, svelte, tailwindcss, typst_lsp, cssls, html

servers.lua_ls = {
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
}

servers.gopls = {
  filetypes = { 'go' },
}

servers.basedpyright = {
  filetypes = { 'python' },
}

servers.nixd = {
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
}

servers.astro = {}
return servers

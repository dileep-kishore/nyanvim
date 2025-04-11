inputs: let
  inherit (inputs.nixCats) utils;
in
  {
    pkgs,
    settings,
    categories,
    name,
    extra,
    mkPlugin,
    ...
  } @ packageDef: {
    # environmentVariables:
    # this section is for environmentVariables that should be available
    # at RUN TIME for plugins. Will be available to path within neovim terminal
    environmentVariables = {
      test = {
        NYANVIM_VAR = "Nyaaan!";
      };
    };

    # lspsAndRuntimeDeps:
    # this section is for dependencies that should be available
    # at RUN TIME for plugins. Will be available to PATH within neovim terminal
    # this includes LSPs
    lspsAndRuntimeDeps = with pkgs; {
      general = [
        nodejs_23
        ripgrep
        fd

        # lsps
        lua-language-server
        gopls
        basedpyright
        nixd
        astro-language-server
        bash-language-server
        dockerfile-language-server-nodejs
        vscode-langservers-extracted
        harper
        ltex-ls-plus
        texlab
        marksman
        typescript-language-server
        rust-analyzer
        svelte-language-server
        tailwindcss-language-server
        tinymist

        # formatters
        stylua
        alejandra
        shfmt
        gofumpt
        rustfmt
        ruff
        prettierd
        typstyle
        yamlfix

        # linters
        rstcheck
        vale
        nodePackages.jsonlint
        stylelint
        hadolint
        eslint_d
      ];
    };

    # This is for plugins that will load at startup without using packadd:
    startupPlugins = {
      general = with pkgs.vimPlugins; [
        pkgs.neovimPlugins.lze
        pkgs.neovimPlugins.lzextras
        nui-nvim
        better-escape-nvim
        catppuccin-nvim
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        nvim-treesitter-context
        nvim-highlight-colors
        nvim-lint
        nvim-web-devicons
        lualine-nvim
        tabby-nvim
        pkgs.neovimPlugins.incline-nvim
      ];
      # extra = with pkgs.neovimPlugins; [];
    };

    # not loaded automatically at startup.
    # use with packadd and an autocommand in config to achieve lazy loading
    optionalPlugins = {
      general = with pkgs.vimPlugins; [
        plenary-nvim
        blink-cmp
        blink-compat
        friendly-snippets
        lazydev-nvim
        lspsaga-nvim
        conform-nvim
        snacks-nvim
        nvim-notify
        noice-nvim
        indent-blankline-nvim
        arrow-nvim
        oil-nvim
        mini-indentscope
        image-nvim
        otter-nvim
        copilot-lua
        neogen
        avante-nvim
        ChatGPT-nvim
        wtf-nvim
        pkgs.neovimPlugins.websocket-nvim
        pkgs.neovimPlugins.neopyter
      ];
    };

    # shared libraries to be added to LD_LIBRARY_PATH
    # variable available to nvim runtime
    sharedLibraries = {
      general = with pkgs; [
        # libgit2
      ];
    };

    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
    extraWrapperArgs = {};

    # get the path to this python environment
    # in your lua config via
    # vim.g.python3_host_prog
    # or run from nvim terminal via :!<packagename>-python3
    python3.libraries = {
      python = py: [
        py.debugpy
      ];
    };

    # populates $LUA_PATH and $LUA_CPATH
    extraLuaPackages = {
      # vimagePreview = [ (lp: with lp; [ magick ]) ];
    };
  }

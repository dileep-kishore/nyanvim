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
        tree-sitter
        ripgrep
        ast-grep
        fd
        imagemagick
        lazygit
        gh
        python3Packages.pylatexenc

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
        # FIXME: Disable this until nodejs_24 binary is available on nixpkgs
        # tailwindcss-language-server
        tinymist

        # formatters
        stylua
        alejandra
        shfmt
        gofumpt
        rustfmt
        ruff
        prettierd
        biome
        typstyle
        yamlfix
        kdlfmt

        # linters
        rstcheck
        vale
        stylelint
        hadolint
        eslint_d

        # dap
        python3Packages.debugpy

        # misc
        uv
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
        rose-pine
        lualine-nvim
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        nvim-treesitter-context
        nvim-highlight-colors
        nvim-lint
        nvim-web-devicons
        tabby-nvim
        rainbow-delimiters-nvim
        render-markdown-nvim
        guess-indent-nvim
        vim-matchup
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
        mini-snippets
        blink-compat
        blink-cmp-avante
        friendly-snippets
        lazydev-nvim
        lspsaga-nvim
        vim-illuminate
        promise-async
        nvim-ufo
        conform-nvim
        snacks-nvim
        nvim-notify
        noice-nvim
        inc-rename-nvim
        indent-blankline-nvim
        which-key-nvim
        gitsigns-nvim
        diffview-nvim
        neogit
        octo-nvim
        grapple-nvim
        # oil-nvim
        yazi-nvim
        comment-nvim
        nvim-ts-context-commentstring
        mini-indentscope
        mini-ai
        mini-animate
        mini-basics
        # mini-files
        mini-icons
        mini-move
        mini-operators
        mini-surround
        treesj
        nvim-autopairs
        iron-nvim
        copilot-lua
        neogen
        avante-nvim
        ChatGPT-nvim
        wtf-nvim
        nvim-dap
        nvim-dap-ui
        nvim-dap-python
        nvim-dap-virtual-text
        ssr-nvim
        grug-far-nvim
        img-clip-nvim
        vim-repeat
        lspkind-nvim
        outline-nvim
        vim-tmux-navigator
        trouble-nvim
        todo-comments-nvim
        refactoring-nvim
        nvim-bqf
        marks-nvim
        markdown-preview-nvim
        cloak-nvim
        git-conflict-nvim
        nvim-ts-autotag
        flash-nvim
        tiny-inline-diagnostic-nvim
        zen-mode-nvim
        twilight-nvim
        smear-cursor-nvim
        pkgs.neovimPlugins.obsidian-nvim
        pkgs.neovimPlugins.possession-nvim
        pkgs.neovimPlugins.websocket-nvim
        pkgs.neovimPlugins.neopyter
        pkgs.neovimPlugins.colorful-winsep-nvim
        pkgs.neovimPlugins.reactive-nvim
        pkgs.neovimPlugins.symbol-usage-nvim
        pkgs.neovimPlugins.early-retirement-nvim
        pkgs.neovimPlugins.timber-nvim
        pkgs.neovimPlugins.maximize-nvim
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
        py.pylatexenc
      ];
    };

    # populates $LUA_PATH and $LUA_CPATH
    extraLuaPackages = {
      # vimagePreview = [ (lp: with lp; [ magick ]) ];
    };
  }

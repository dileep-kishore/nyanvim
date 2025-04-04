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
        ripgrep
        fd
        lua-language-server
        gopls
        basedpyright
        nixd
        nodejs_23
      ];
    };

    # This is for plugins that will load at startup without using packadd:
    startupPlugins = {
      general = with pkgs.vimPlugins; [
        pkgs.neovimPlugins.lze
        pkgs.neovimPlugins.lzextras
        better-escape-nvim
        catppuccin-nvim
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        nvim-treesitter-context
        nvim-highlight-colors
      ];
      # extra = with pkgs.neovimPlugins; [];
    };

    # not loaded automatically at startup.
    # use with packadd and an autocommand in config to achieve lazy loading
    optionalPlugins = {
      general = with pkgs.vimPlugins; [
        blink-cmp
        friendly-snippets
        lazydev-nvim
        oil-nvim
        image-nvim
        otter-nvim
        copilot-lua
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

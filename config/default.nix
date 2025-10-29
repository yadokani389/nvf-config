{ pkgs, ... }:
{
  imports = [
    ./barbar.nix
    ./keymaps.nix
    ./lsp-endhints.nix
    ./vim-eft.nix
    ./vim-translator.nix
  ];

  vim = {
    enableLuaLoader = true;
    lineNumberMode = "relNumber";
    preventJunkFiles = true;
    undoFile.enable = true;

    options = {
      tabstop = 2;
      shiftwidth = 2;
      scrolloff = 3;
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "macchiato";
      transparent = true;
    };

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };

    autopairs.nvim-autopairs.enable = true;
    utility = {
      yazi-nvim = {
        enable = true;
        mappings.openYazi = "<Leader>e";
      };
      preview.markdownPreview.enable = true;
    };
    binds.whichKey.enable = true;
    autocomplete.nvim-cmp.enable = true;
    snippets.luasnip.enable = true;
    ui.noice = {
      enable = true;
      setupOpts.presets.bottom_search = false;
    };
    visuals.nvim-web-devicons.enable = true;
    statusline.lualine.enable = true;
    comments.comment-nvim = {
      enable = true;
      mappings = {
        toggleCurrentLine = "<Leader>/";
        toggleSelectedBlock = "<Leader>/";
      };
    };
    git.gitsigns.enable = true;

    telescope = {
      enable = true;
      setupOpts = {
        defaults = {
          file_ignore_patterns = [
            "node_modules"
            ".git/"
            ".direnv/"
            "dist/"
            "build/"
            "target/"
            "result/"
          ];
        };
      };
    };

    lsp = {
      enable = true;
      inlayHints.enable = true;
      lspconfig.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      nix = {
        enable = true;
        format.type = "nixfmt";
      };
      markdown = {
        enable = true;
        extensions = {
          render-markdown-nvim.enable = true;
        };
      };
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      html.enable = true;
      sql.enable = true;
      ts.enable = true;
      python.enable = true;
      typst = {
        enable = true;
        extensions = {
          typst-concealer.enable = true;
          typst-preview-nvim.enable = true;
        };
      };
      rust.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
        setupOpts = {
          open_mapping = "<C-t>";
        };
      };
    };

    assistant.copilot = {
      enable = true;
      cmp.enable = true;
      setupOpts = {
        suggestion.enabled = false;
        panel.enabled = false;
      };
    };

    extraPlugins = {
      auto-save = {
        package = pkgs.vimPlugins.auto-save-nvim;
        setup = "require('auto-save').setup{}";
      };
      dropbar-nvim = {
        package = pkgs.vimPlugins.dropbar-nvim;
        setup = "require('dropbar').setup()";
      };
      mkdir-nvim = {
        package = pkgs.vimPlugins.mkdir-nvim;
      };
      wilder = {
        package = pkgs.vimPlugins.wilder-nvim;
        setup = "require('wilder').setup({modes = {':', '/', '?'}})";
      };
      copilotChat = {
        package = pkgs.vimPlugins.CopilotChat-nvim;
        setup = "require('CopilotChat').setup{}";
      };
    };
  };
}

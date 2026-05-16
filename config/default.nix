{ pkgs, ... }:
{
  imports = [
    ./barbar.nix
    ./blink.nix
    ./keymaps.nix
    ./lazygit.nix
    ./lsp-endhints.nix
    ./tiny-code-action.nix
    ./vim-translator.nix
  ];

  vim = {
    luaConfigPost = ''
      vim.filetype.add({
        extension = {
          mdx = "markdown.mdx",
        },
      })
    '';

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
      motion.flash-nvim.enable = true;
    };
    binds.whichKey.enable = true;
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
    notes.todo-comments = {
      enable = true;
      mappings = {
        quickFix = null;
        telescope = null;
        trouble = null;
      };
    };

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

      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      haskell.enable = true;
      html.enable = true;
      java.enable = true;
      json.enable = true;
      kotlin.enable = true;
      markdown = {
        enable = true;
        extraDiagnostics.enable = false;
        format.type = [ "prettierd" ];
        extensions = {
          render-markdown-nvim.enable = true;
        };
      };
      nix = {
        enable = true;
        format.type = [ "nixfmt" ];
      };
      python.enable = true;
      rust = {
        enable = true;
        lsp.opts = ''
          ['rust-analyzer'] = {
            cargo = { allFeatures = true },
          },
        '';
      };
      sql.enable = true;
      svelte.enable = true;
      toml.enable = true;
      typescript.enable = true;
      typst = {
        enable = true;
        extensions = {
          typst-preview-nvim.enable = true;
        };
      };
      wgsl.enable = true;
      yaml.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
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

    lazy.plugins = {
      "auto-save.nvim" = {
        package = pkgs.vimPlugins.auto-save-nvim;
        setupModule = "auto-save";
      };
      "dropbar.nvim" = {
        package = pkgs.vimPlugins.dropbar-nvim;
      };
      "mkdir.nvim" = {
        package = pkgs.vimPlugins.mkdir-nvim;
      };
      "wilder.nvim" = {
        package = pkgs.vimPlugins.wilder-nvim;
      };
      "CopilotChat.nvim" = {
        package = pkgs.vimPlugins.CopilotChat-nvim;
      };
    };
  };
}

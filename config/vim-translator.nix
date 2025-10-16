{ pkgs, ... }:
{
  vim = {
    extraPackages = [ pkgs.python3 ];
    extraPlugins = {
      vim-translator = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "vim-translator";
          src = pkgs.fetchFromGitHub {
            owner = "voldikss";
            repo = "vim-translator";
            rev = "6f0639c6d471a3a90ac19db96e1e379c030f74e3";
            hash = "sha256-ow5axYMtH433hXwYF5Oz3wWT/24VUHpALrH+Phlwk90=";
          };
        };
        setup = ''
          vim.g.translator_target_lang = "ja"
          vim.g.translator_default_engines = { "google" }
          vim.g.translator_window_type = "popup"
          vim.g.translator_window_max_width = 0.5
          vim.g.translator_window_max_height = 0.9
        '';
      };
    };

    keymaps = [
      {
        key = "<leader>t";
        mode = "";
        action = "";
        desc = "Translate";
      }
      {
        key = "<leader>tj";
        mode = "n";
        action = "<CMD>TranslateW<CR>";
        desc = "Translate words into Japanese";
      }
      {
        key = "<leader>tj";
        mode = "v";
        action = ":'<,'>TranslateW<CR>";
        desc = "Translate lines into Japanese";
      }
      {
        key = "<leader>te";
        mode = "n";
        action = "<CMD>TranslateW --target_lang=en<CR>";
        desc = "Translate words into English";
      }
      {
        key = "<leader>te";
        mode = "v";
        action = ":'<,'>TranslateW --target_lang=en<CR>";
        desc = "Translate lines into English";
      }
      {
        key = "<leader>tr";
        mode = "";
        action = "";
        desc = "Translate Replace";
      }
      {
        key = "<leader>trj";
        mode = "n";
        lua = true;
        action = ''
          function()
            vim.api.nvim_feedkeys("^vg_", "n", false)
            -- Execute the conversion command after a short delay.
            vim.defer_fn(function()
              vim.api.nvim_feedkeys(":TranslateR\n", "n", false)
            end, 100) -- 100ms delay
          end'';
        desc = "Replace to Japanese";
      }
      {
        key = "<leader>trj";
        mode = "v";
        action = ":'<,'>TranslateR<CR>";
        desc = "Replace to Japanese";
      }
      {
        key = "<leader>tre";
        mode = "n";
        lua = true;
        action = ''
          function()
            vim.api.nvim_feedkeys("^vg_", "n", false)
            -- Execute the conversion command after a short delay.
            vim.defer_fn(function()
              vim.api.nvim_feedkeys(":TranslateR --target_lang=en\n", "n", false)
            end, 100) -- 100ms delay
          end'';
        desc = "Replace to English";
      }
      {
        key = "<leader>tre";
        mode = "v";
        action = ":'<,'>TranslateR --target_lang=en<CR>";
        desc = "Replace to English";
      }
    ];
  };
}

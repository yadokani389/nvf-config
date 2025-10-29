{ pkgs, ... }:
{
  vim = {
    extraPlugins.tiny-code-action-nvim = {
      package = pkgs.vimUtils.buildVimPlugin {
        name = "tiny-code-action-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "rachartier";
          repo = "tiny-code-action.nvim";
          rev = "597c4a39d5601e050d740f3ef437ee695d1ff3b0";
          hash = "sha256-+U1GUvfLPZ+4MPi7Q5LG8TJEWJHyS45qbg1dpBk7g98=";
        };
        dependencies = with pkgs.vimPlugins; [
          telescope-nvim
          plenary-nvim
          snacks-nvim
        ];
      };
    };

    keymaps = [
      {
        key = "<leader>lc";
        mode = "n";
        action = "<cmd>lua require('tiny-code-action').code_action()<cr>";
        desc = "Open code actions with preview";
      }
    ];
  };
}

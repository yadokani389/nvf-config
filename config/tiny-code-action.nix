{ pkgs, ... }:
{
  vim = {
    lazy.plugins."tiny-code-action-nvim" = {
      package = pkgs.vimUtils.buildVimPlugin {
        name = "tiny-code-action-nvim";
        pname = "tiny-code-action-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "rachartier";
          repo = "tiny-code-action.nvim";
          rev = "897de9af9e3aa6e59bcb9fec760a7eb02d00e264";
          hash = "sha256-tiV+drfWAryw8cexSCgmZCXfHxi4oi6qX6oNmhHrhAk=";
        };
        dependencies = with pkgs.vimPlugins; [
          telescope-nvim
          plenary-nvim
          snacks-nvim
        ];
      };
      keys = [
        {
          key = "<leader>lc";
          mode = "n";
          action = "<cmd>lua require('tiny-code-action').code_action()<cr>";
          desc = "Open code actions with preview";
        }
      ];
    };
  };
}

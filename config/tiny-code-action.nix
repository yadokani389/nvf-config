{ nurPkgs, ... }:
{
  vim = {
    lazy.plugins."tiny-code-action-nvim" = {
      package = nurPkgs.tiny-code-action-nvim;
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

{ pkgs, ... }:
{
  vim = {
    lazy.plugins."barbar.nvim" = {
      package = pkgs.vimPlugins.barbar-nvim;
      lazy = false;
      keys = [
        {
          key = "<leader>b";
          mode = "";
          action = "";
          desc = "Buffer";
        }
        {
          key = "<leader>bl";
          mode = "";
          action = "<cmd>BufferNext<cR>";
          desc = "Next Buffer";
        }
        {
          key = "<leader>bh";
          mode = "";
          action = "<cmd>BufferPrevious<CR>";
          desc = "Previous Buffer";
        }
        {
          key = "<leader>bc";
          mode = "";
          action = "<CMD>BufferClose<CR>";
          desc = "Close Buffer";
        }
      ];
    };
  };
}

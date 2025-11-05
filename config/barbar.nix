{ pkgs, ... }:
{
  vim = {
    lazy.plugins = {
      "barbar.nvim" = {
        package = pkgs.vimPlugins.barbar-nvim;
      };
    };

    keymaps = [
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
      }
      {
        key = "<leader>bh";
        mode = "";
        action = "<cmd>BufferPrevious<CR>";
      }
      {
        key = "<leader>bc";
        mode = "";
        action = "<CMD>BufferClose<CR>";
      }
    ];
  };
}

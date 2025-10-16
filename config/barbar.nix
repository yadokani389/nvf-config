{ pkgs, ... }:
{
  vim = {
    extraPlugins = {
      barbar = {
        package = pkgs.vimPlugins.barbar-nvim;
        setup = "require('barbar').setup{}";
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

{ pkgs, ... }:
{
  vim = {
    lazy.plugins = {
      "lazygit.nvim" = {
        package = pkgs.vimPlugins.lazygit-nvim;
        keys = [
          {
            key = "<leader>g";
            mode = "";
            action = "";
            desc = "Git";
          }
          {
            key = "<Space>gg";
            mode = "n";
            action = ":LazyGit<CR>";
            desc = "Open Lazygit";
          }
          {
            key = "<Space>gf";
            mode = "n";
            action = ":LazyGitFilterCurrentFile<CR>";
            desc = "Open Lazygit with current file filter";
          }
        ];
        after = ''
          vim.g.lazygit_floating_window_scaling_factor = 0.97

          local bkey = vim.api.nvim_buf_set_keymap

          -- Disable esc when lazygit starts
          vim.api.nvim_create_augroup("LazygitKeyMapping", {})
          vim.api.nvim_create_autocmd("TermOpen", {
            group = "LazygitKeyMapping",
            pattern = "*",
            callback = function()
              local filetype = vim.bo.filetype
              if filetype == "lazygit" then
                bkey(0, "t", "<ESC>", "<ESC>", { silent = true })
                bkey(0, "t", "<C-v><ESC>", [[<C-\><C-n>]], { silent = true })
              end
            end,
          })
        '';
      };
    };
  };
}

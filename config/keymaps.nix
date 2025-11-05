{
  vim = {
    keymaps = [
      {
        key = "<S-l>";
        mode = "";
        action = "10l";
      }
      {
        key = "<S-k>";
        mode = "";
        action = "10k";
      }
      {
        key = "<S-j>";
        mode = "";
        action = "10j";
      }
      {
        key = "<S-h>";
        mode = "";
        action = "10h";
      }
      {
        key = "q:";
        mode = "n";
        action = "<nop>";
      }
      {
        key = "p";
        mode = "v";
        action = "P";
      }
      {
        key = "d";
        mode = [
          "n"
          "v"
        ];
        action = ''"_d'';
        noremap = true;
      }
      {
        key = "c";
        mode = [
          "n"
          "v"
        ];
        action = ''"_c'';
        noremap = true;
      }

      {
        # Escape terminal mode using ESC
        key = "<esc>";
        mode = "t";
        action = "<C-\\><C-n>";
        noremap = false;
      }

      {
        key = "<leader>d";
        mode = "";
        action = "";
        desc = "Debugger";
      }

      {
        key = "<leader>T";
        mode = "";
        action = "";
        desc = "Typst";
      }

      {
        key = "<leader>l";
        mode = "";
        action = "";
        desc = "Lsp";
      }
      {
        key = "<leader>lj";
        mode = "n";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        desc = "Lsp diagnostic goto_next";
      }
      {
        key = "<leader>lk";
        mode = "n";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        desc = "Lsp diagnostic goto_prev";
      }
    ];
  };
}

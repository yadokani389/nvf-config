{ lib, pkgs, ... }:
{
  vim = {
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      setupOpts = {
        enabled = lib.generators.mkLuaInline ''
          function()
            return vim.b.completion ~= false
          end
        '';
        sources.default = [
          "copilot"
          "snippets"
          "lsp"
          "path"
          "buffer"
        ];
        sources.providers = {
          copilot = {
            name = "copilot";
            module = pkgs.lib.mkForce "blink-cmp-copilot";
            score_offset = 100;
            async = true;
          };
        };
        completion = {
          menu.border = "rounded";
          documentation.window.border = "rounded";
        };
        signature = {
          enabled = true;
          window = {
            border = "rounded";
            show_documentation = true;
          };
        };
        keymap = {
          "<c-j>" = [
            "snippet_forward"
            "fallback"
          ];
          "<c-k>" = [
            "snippet_backward"
            "fallback"
          ];
        };
      };
    };

    lazy.plugins = {
      blink-cmp-copilot = {
        package = pkgs.vimPlugins.blink-cmp-copilot;
      };
    };

    luaConfigRC.blink-toggle = ''
      vim.api.nvim_create_user_command("BlinkToggle", function()
        vim.b.completion = not (vim.b.completion ~= false)
        print("blink.cmp: " .. (vim.b.completion and "enabled" or "disabled"))
      end, {})

      vim.api.nvim_create_user_command("BlinkDisable", function()
        vim.b.completion = false
        print("blink.cmp: disabled")
      end, {})

      vim.api.nvim_create_user_command("BlinkEnable", function()
        vim.b.completion = true
        print("blink.cmp: enabled")
      end, {})
    '';
  };
}

{ pkgs, ... }:
{
  vim = {
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      setupOpts = {
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
        signature.window.border = "rounded";
      };
    };

    lazy.plugins = {
      blink-cmp-copilot = {
        package = pkgs.vimPlugins.blink-cmp-copilot;
      };
    };
  };
}

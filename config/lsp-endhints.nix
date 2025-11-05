{ pkgs, ... }:
{
  vim.lazy.plugins.lsp-endhints = {
    package = pkgs.vimUtils.buildVimPlugin {
      name = "lsp-endhints";
      pname = "lsp-endhints";
      src = pkgs.fetchFromGitHub {
        owner = "chrisgrieser";
        repo = "nvim-lsp-endhints";
        rev = "0bd03846561f46d8b7d2284a02d3748c3d35621b";
        hash = "sha256-MgvZqaYbJWmcjIYJM0hCfnIVc+uKE0vk3Ky6PWFYpys=";
      };
    };
    after = "require('lsp-endhints').enable()";
  };
}

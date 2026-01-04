{ pkgs, ... }:
{
  vim.lazy.plugins.lsp-endhints = {
    package = pkgs.vimUtils.buildVimPlugin {
      name = "lsp-endhints";
      pname = "lsp-endhints";
      src = pkgs.fetchFromGitHub {
        owner = "chrisgrieser";
        repo = "nvim-lsp-endhints";
        rev = "782b728f7cfb530116502921fd99cbdba357285b";
        hash = "sha256-YGDS2MZAzEzIVkp99qq3RybiVc9EsF+zwWC1v6r9zc0=";
      };
    };
    after = "require('lsp-endhints').enable()";
  };
}

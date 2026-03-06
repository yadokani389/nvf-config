{ nurPkgs, ... }:
{
  vim.lazy.plugins.lsp-endhints = {
    package = nurPkgs.lsp-endhints;
    after = "require('lsp-endhints').enable()";
  };
}

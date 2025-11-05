{ pkgs, ... }:
{
  vim = {
    lazy.plugins.vim-eft = {
      package = pkgs.vimUtils.buildVimPlugin {
        name = "vim-eft";
        pname = "vim-eft";
        src = pkgs.fetchFromGitHub {
          owner = "hrsh7th";
          repo = "vim-eft";
          rev = "419deb0c45141c11cfd2648b8523f520f8413ec2";
          hash = "sha256-Gi9onX/pSIxjtOsXgYUxJtvY6boKcicAkchIwP6K12Q=";
        };
      };
      keys = [
        {
          key = ";";
          mode = "";
          action = "<Plug>(eft-repeat)";
        }
        {
          key = "f";
          mode = "";
          action = "<Plug>(eft-f)";
        }
        {
          key = "F";
          mode = "";
          action = "<Plug>(eft-F)";
        }
        {
          key = "t";
          mode = "";
          action = "<Plug>(eft-t)";
        }
        {
          key = "T";
          mode = "";
          action = "<Plug>(eft-T)";
        }
      ];
    };
  };
}

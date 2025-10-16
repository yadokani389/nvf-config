{ pkgs, ... }:
{
  vim = {
    extraPlugins.vim-eft = {
      package = pkgs.vimUtils.buildVimPlugin {
        name = "vim-eft";
        src = pkgs.fetchFromGitHub {
          owner = "hrsh7th";
          repo = "vim-eft";
          rev = "419deb0c45141c11cfd2648b8523f520f8413ec2";
          hash = "sha256-Gi9onX/pSIxjtOsXgYUxJtvY6boKcicAkchIwP6K12Q=";
        };
      };
    };

    keymaps = [
      {
        key = ";";
        mode = "";
        action = "<Plug>(eft-repeat)";
      }
      {
        key = ";";
        mode = "x";
        action = "<Plug>(eft-repeat)";
      }
      {
        key = ";";
        mode = "o";
        action = "<Plug>(eft-repeat)";
      }

      {
        key = "f";
        mode = "";
        action = "<Plug>(eft-f)";
      }
      {
        key = "f";
        mode = "x";
        action = "<Plug>(eft-f)";
      }
      {
        key = "f";
        mode = "o";
        action = "<Plug>(eft-f)";
      }
      {
        key = "F";
        mode = "";
        action = "<Plug>(eft-F)";
      }
      {
        key = "F";
        mode = "x";
        action = "<Plug>(eft-F)";
      }
      {
        key = "F";
        mode = "o";
        action = "<Plug>(eft-F)";
      }

      {
        key = "t";
        mode = "";
        action = "<Plug>(eft-t)";
      }
      {
        key = "t";
        mode = "x";
        action = "<Plug>(eft-t)";
      }
      {
        key = "t";
        mode = "o";
        action = "<Plug>(eft-t)";
      }
      {
        key = "T";
        mode = "";
        action = "<Plug>(eft-T)";
      }
      {
        key = "T";
        mode = "x";
        action = "<Plug>(eft-T)";
      }
      {
        key = "T";
        mode = "o";
        action = "<Plug>(eft-T)";
      }
    ];
  };
}

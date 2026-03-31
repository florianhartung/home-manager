{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "Florian Hartung";
        email = lib.mkDefault "60144801+florianhartung@users.noreply.github.com";
      };
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

  home.packages = [ pkgs.git-absorb ];
}

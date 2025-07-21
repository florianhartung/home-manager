{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Florian Hartung";
    userEmail = "60144801+florianhartung@users.noreply.github.com";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

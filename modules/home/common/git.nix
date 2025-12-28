{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "Florian Hartung";
        email = "60144801+florianhartung@users.noreply.github.com";
      };
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}

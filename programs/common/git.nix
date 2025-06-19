{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Florian Hartung";
    userEmail = "florian.hartung@dlr.de";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

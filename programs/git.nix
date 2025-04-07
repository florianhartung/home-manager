{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Florian Hartung";
    userEmail = "florian.hartung@dlr.de";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

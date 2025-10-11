{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Florian Hartung";
    userEmail = "florian.hartung5+github@gmail.com"; # change for work config?
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

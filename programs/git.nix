{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Florian Hartung";
    userEmail = "florian.hartung5+github@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
